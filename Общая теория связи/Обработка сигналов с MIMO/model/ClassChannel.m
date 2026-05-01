classdef ClassChannel < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли пропускать сигнал через канал
            isTransparent;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;
    end

    properties (SetAccess = private) % Вычисляемые переменные
        % Значение средней мощности модуляционного символа
            Ps;
        % Значение средней мощности модуляционного бита
            Pb;
        % Значение средней мощности информационного бита
            Pbd;

            TypeOfDiversity;
            NumTransAnts;
            NumResAnts;
            NumBitsPerFrame;
            MethodForMISO;
    end

    methods
        function obj = ClassChannel(Params, Objs, LogLanguage)
        % Конструктор
            % Выделим поля Params, необходимые для инициализации
                Channel             = Params.Channel;
            % Инициализация значений переменных из параметров
                obj.isTransparent   = Channel.isTransparent;
            % Переменная LogLanguage
                obj.LogLanguage     = LogLanguage;
                
                obj.TypeOfDiversity = Objs.Sig.TypeOfDiversity;
                obj.NumTransAnts    = Objs.Sig.NumTransAnts;
                obj.NumResAnts      = Objs.Sig.NumResAnts;
                obj.MethodForMISO = Objs.Sig.MethodForMISO;

                obj.NumBitsPerFrame      = Objs.Source.NumBitsPerFrame / Objs.Mapper.log2M;
                
            % Определим среднюю мощность модуляционного символа
                Const = Objs.Mapper.Constellation;
                obj.Ps = mean((abs(Const)).^2);

            % Определим среднюю мощность модуляционного бита
                obj.Pb = obj.Ps / Objs.Mapper.log2M;

            % Определим среднюю мощность информационного бита (энергия,
            % приходящаяся на информационный бит, оказывается больше, так
            % как используются проверочные биты)
            if Objs.Encoder.isTransparent
                obj.Pbd = obj.Pb;
            else
                obj.Pbd = obj.Pb / Objs.Encoder.CodeRate;
            end
        end

        function [OutData, InstChannelParams] = Step(obj, InData, h2dB)
            if obj.isTransparent
                OutData = InData;
                InstChannelParams.Variance = 1;
                return
            end


            % Сформируем АБГШ
                Sigma = sqrt(obj.Pbd * 10^(-h2dB/10) / 2);
                InstChannelParams.Variance = 2*Sigma^2;
                Noise = Sigma * (randn(length(InData),1) + 1j*randn(length(InData),1));
                switch obj.TypeOfDiversity
                    case 'SIMO'
                        Hchannel = (randn(obj.NumResAnts, obj.NumBitsPerFrame) + 1j*randn(obj.NumResAnts, obj.NumBitsPerFrame))/sqrt(2);
                        % можно попробовать без корня из 2
                        InstChannelParams.Hchannel = Hchannel;
                        noizz = repmat(Noise, 1, obj.NumResAnts).';
                        x_kron=kron(ones(obj.NumResAnts, 1), InData.');
                        OutData = Hchannel.*x_kron + noizz;

                    case 'MISO'
                        switch obj.MethodForMISO
                            case 'ALAM' 
                                Hchannel1 = (randn(obj.NumResAnts, length(InData)) + 1j*randn(obj.NumResAnts, length(InData)))/sqrt(2);
                                Hchannel2 = (randn(obj.NumResAnts, length(InData)) + 1j*randn(obj.NumResAnts,length(InData)))/sqrt(2);
                                InstChannelParams.Hchannel1 = Hchannel1;
                                InstChannelParams.Hchannel2 = Hchannel2;
                                Noise1 = Sigma * (randn(length(InData),1) + 1j*randn(length(InData),1)).';
                                Noise2 = Sigma * (randn(length(InData),1) + 1j*randn(length(InData),1)).';
                                OutData(1, :) = Hchannel1 .* InData(1, :) + Hchannel2 .* InData(2, :) + Noise1;
                                OutData(2, :) = -Hchannel1 .* conj(InData(2, :)) + Hchannel2 .* conj(InData(1, :)) + Noise2;
                                
                            case 'BEAM'
                                Hchannel = (randn(obj.NumTransAnts, length(InData)) + 1j*randn(obj.NumTransAnts, length(InData)))/sqrt(2);
                                normH = sqrt(sum(abs(Hchannel).^2,1)); 
                                InstChannelParams.Hchannel = normH;
                                w = conj(Hchannel) ./ normH;
                                s = w.* InData.';
                                OutData = sum(Hchannel.*s, 1) + Noise.';
                        end

                    case 'MIMO'
                         Hchannel = (randn(obj.NumResAnts, obj.NumTransAnts, length(InData)) + 1j*randn(obj.NumResAnts, obj.NumTransAnts, length(InData)))/sqrt(2);
                         InstChannelParams.Hchannel = Hchannel;
                         Noise = Sigma * (randn(obj.NumResAnts, length(InData)) + 1j*randn(obj.NumResAnts, length(InData)));
                         
                         y = zeros(obj.NumResAnts, obj.NumBitsPerFrame/obj.NumTransAnts);
                        for k=1:obj.NumBitsPerFrame/obj.NumTransAnts
                            y(:,k) = Hchannel(:,:,k) * InData(:,k);
                        end
                        y = y + Noise;
                        OutData = y;
                end

            
        end
        
    end
end