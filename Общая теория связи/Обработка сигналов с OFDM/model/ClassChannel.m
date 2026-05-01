classdef ClassChannel < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли пропускать сигнал через канал
            isTransparent;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;
            ChannelType;
            maxDopplerShift;
    end
    properties (SetAccess = private) % Вычисляемые переменные
        % Значение средней мощности модуляционного символа
            Ps;
        % Значение средней мощности модуляционного бита
            Pb;
        % Значение средней мощности информационного бита
            Pbd;
            pathDelays;
            avgPathGaindB;
            MapperModulationOrder;
            Fs;
            CodeRate;
            rayleighChan;
            MaxDelayInSamples;

    end
    methods
        function obj = ClassChannel(Params, Objs, LogLanguage)
        % Конструктор
            % Выделим поля Params, необходимые для инициализации
                Channel = Params.Channel;
            % Инициализация значений переменных из параметров
                obj.isTransparent   = Channel.isTransparent;
                obj.ChannelType     = Channel.ChannelType;
                obj.maxDopplerShift = Channel.maxDopplerShift;
                obj.Fs = Objs.OFDMPattern.Fs;
            % Переменная LogLanguage
                obj.LogLanguage = LogLanguage;
                switch obj.ChannelType
                    case 'EPA'
                        pathDelays = [0 30 70 90 110 190 410]*1e-9;
                        avgPathGaindB = [0 -1 -2 -3 -8 -17.2 -20.8];

                    case 'EVA'
                        pathDelays = [0 30 150 310 370 710 1090 1730 2510]*1e-9;
                        avgPathGaindB = [0 -1.5 -1.4 -3.6 -0.6 -9.1 -7 -12 -16.9];
                       
                    case 'ETU'
                        pathDelays = [0 50 120 200 230 500 1600 2300 5000]*1e-9;
                        avgPathGaindB =[-1 -1 -1 0 0 0 -3 -5 -7];
                     
                    case 'SCH'
                        obj.pathDelays = 0;
                        obj.avgPathGaindB = 0;                        
                end
                AvgPathGainsLinear = 10.^(avgPathGaindB / 10);
                TotalGainLinear = sum(AvgPathGainsLinear);
                NormalizedGainsDb = avgPathGaindB - 10*log10(TotalGainLinear);
                 obj.rayleighChan = comm.RayleighChannel( ...
                'SampleRate', obj.Fs, ...
                'PathDelays', pathDelays, ...
                'AveragePathGains', NormalizedGainsDb, ...
                'MaximumDopplerShift', obj.maxDopplerShift, ...
                'PathGainsOutputPort',true, ...
                    'RandomStream', 'mt19937ar with seed', ...
                    'Seed', 10);
                 obj.MaxDelayInSamples = round(max(pathDelays) * obj.Fs);

            % Определим среднюю мощность модуляционного символа
                Const = Objs.Mapper.Constellation;
                obj.Ps = mean((abs(Const)).^2);

                obj.MapperModulationOrder = Objs.Mapper.log2M;
                obj.CodeRate = Objs.Encoder.CodeRate;

            % Определим среднюю мощность модуляционного бита
                obj.Pb = obj.Ps / Objs.Mapper.log2M;

            % Определим среднюю мощность информационного бита (энергия,
            % приходящаяся на информационный бит, оказывается больше, так
            % как используются проверочные биты)
                %obj.Pbd = obj.Pb;
                % Когда и если будет реализован класс кодирования, то здесь
                % должно будет быть
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


            switch obj.ChannelType
                case {'EPA', 'EVA', 'ETU'}
                FilterPrefix = InData(end - obj.MaxDelayInSamples + 1 : end);
                FilterSuffix = InData(1 : obj.MaxDelayInSamples);
                SignalToFilter = [FilterPrefix; InData; FilterSuffix];
                
                % Пропускаем через канал
                [FilteredSignalLong, PathGains] = obj.rayleighChan(SignalToFilter);

                FadedSignal = FilteredSignalLong(obj.MaxDelayInSamples + 1 : ...
                                        obj.MaxDelayInSamples + length(InData));
                
                InstChannelParams.PathGains = PathGains(obj.MaxDelayInSamples + 1 : ...
                                               obj.MaxDelayInSamples + length(InData), :);
                reset(obj.rayleighChan);
%                      OutData = obj.rayleighChan(InData) + Noise;
%                      reset(obj.rayleighChan);

                otherwise
                    FadedSignal = InData;


            end
                % Сформируем АБГШ
                %txSigPower = mean(abs(InData).^2);
                Sigma = sqrt(obj.Pbd * 10^(-h2dB/10) / 2);
                %EsNodB=h2dB+10*log10(obj.MapperModulationOrder);% костыль для проверки 
                %Sigma = sqrt((txSigPower * 10^(-EsNodB/10)) / 2);
                InstChannelParams.Variance = 2*Sigma^2;
                %Noise = randn(length(InData), 2) * [1; 1i] * Sigma ;
                Noise=Sigma*(randn(size(InData))+1j*randn(size(InData)));
                OutData = FadedSignal + Noise;
                
        end
    end
end