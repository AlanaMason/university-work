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

            FadingType;

            DopplerShift;

            CHAN;

            t_shift;
            sps;
            f_shift;
    end
    methods
        function obj = ClassChannel(Params, Objs, LogLanguage)
        % Конструктор
            % Выделим поля Params, необходимые для инициализации
                Channel = Params.Channel;
            % Инициализация значений переменных из параметров
                obj.isTransparent = Channel.isTransparent;
            % Переменная LogLanguage
                obj.LogLanguage = LogLanguage;

                obj.FadingType = Channel.FadingType;

                obj.DopplerShift = Channel.DopplerShift;

                obj.sps = Params.Sig.sps;
                obj.t_shift = Channel.t_shift;
                obj.f_shift = Channel.f_shift;

            % Определим среднюю мощность модуляционного символа
                Const = Objs.Mapper.Constellation;
                obj.Ps = mean((abs(Const)).^2);

            % Определим среднюю мощность модуляционного бита
                obj.Pb = obj.Ps / Objs.Mapper.log2M ;

            % Определим среднюю мощность информационного бита (энергия,
            % приходящаяся на информационный бит, оказывается больше, так
            % как используются проверочные биты)
                % obj.Pbd = obj.Pb;
                % Когда и если будет реализован класс кодирования, то здесь
                % должно будет быть
                if Objs.OFDM.isTransparent
                    obj.Pbd = obj.Pb / Objs.Encoder.Rate ;
                else
                    obj.Pbd = obj.Pb / Objs.Encoder.Rate / Objs.OFDM.Nfft;
                end

                Fs = 3.84 * 10^6;

                if strcmp(obj.FadingType, 'EPA')
                    pathDelays = [0 30 70 90 110 190 410] * 1e-9;
                    avgPathGains_dB = [0 -1 -2 -3 -8 -17.2 -20.8];
                    obj.CHAN = comm.RayleighChannel( ...
                        'SampleRate', Fs, ...                       % нормированная частота дискретизации
                        'PathDelays', pathDelays, ...               % задержки многолучевого канала (пример)
                        'AveragePathGains', avgPathGains_dB, ...    % усиления путей в дБ
                        'MaximumDopplerShift', obj.DopplerShift, ...% fD = 0 Гц
                        'PathGainsOutputPort',true);   

                elseif strcmp(obj.FadingType, 'EVA')
                    pathDelays = [0 30 150 310 370 710 1090 1730 2510] * 1e-9;
                    avgPathGains_dB = [0 -1.5 -1.4 -3.6 -0.6 -9.1 -7 -12 -16.9];
                    obj.CHAN = comm.RayleighChannel( ...
                        'SampleRate', Fs, ...                       % нормированная частота дискретизации
                        'PathDelays', pathDelays, ...               % задержки многолучевого канала (пример)
                        'AveragePathGains', avgPathGains_dB, ...    % усиления путей в дБ
                        'MaximumDopplerShift', obj.DopplerShift, ...% fD = 0 Гц
                        'PathGainsOutputPort',true); 

                elseif strcmp(obj.FadingType, 'ETU')
                    pathDelays = [0 50 120 200 230 500 1600 2300 5000] * 1e-9;
                    avgPathGains_dB = [-1 -1 -1 0 0 0 -3 -5 -7];
                    obj.CHAN = comm.RayleighChannel( ...
                        'SampleRate', Fs, ...                       % нормированная частота дискретизации
                        'PathDelays', pathDelays, ...               % задержки многолучевого канала (пример)
                        'AveragePathGains', avgPathGains_dB, ...    % усиления путей в дБ
                        'MaximumDopplerShift', obj.DopplerShift, ...% fD = 0 Гц
                        'PathGainsOutputPort',true); 

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

                Noise = randn(length(InData), 2) * [1; 1i] * Sigma;
                
                if strcmp(obj.FadingType, '')
                    faded = InData;
                else
                    [faded, InstChannelParams.PathGains] = obj.CHAN(InData);
                    InstChannelParams.info_chan = info(obj.CHAN);
                    reset(obj.CHAN);

                    % OutData = faded;
                    % return
                end
                
            % Добавим его к сигналу
                faded_f_shift = faded .* exp(1j*2*pi*obj.f_shift.* ((0:numel(faded)-1).'/obj.sps) );
                OutData = circshift(faded_f_shift, round(obj.t_shift*obj.sps)) + Noise;
        end
    end
end