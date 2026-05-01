classdef ClassChannel < handle
    properties (SetAccess = private)
        isTransparent;
        LogLanguage;

        % --- Новые параметры для моделирования рассинхронизации ---
        TimeOffset;     % Ошибка по времени (в отсчётах, может быть дробной)
        FreqOffset;     % Ошибка по частоте (в Гц или нормализованная)
        Fs;             % Частота дискретизации (нужна для частотного сдвига)
    end

    properties (SetAccess = private)
        Ps;
        Pb;
        Pbd;
    end

    methods
        function obj = ClassChannel(Params, Objs, LogLanguage)
            % Конструктор
            Channel = Params.Channel;
            
            if numel(Channel.Fs) ~= 1
                Channel.Fs = Channel.Fs(1); % принудительно скаляр
            end
            obj.isTransparent = Channel.isTransparent;
            obj.LogLanguage = LogLanguage;
            

            % Средние мощности
            Const = Objs.Mapper.Constellation;
            obj.Ps = mean(abs(Const).^2);
            obj.Pb = obj.Ps / Objs.Mapper.log2M;

            if Objs.Encoder.isTransparent
                obj.Pbd = obj.Pb;
            else
                if strcmp(Objs.Encoder.TypeEncoder, 'Convolution')
                    obj.Pbd = obj.Pb / Objs.Encoder.CodeRateCC;
                elseif strcmp(Objs.Encoder.TypeEncoder, 'LDPC')
                    obj.Pbd = obj.Pb / Objs.Encoder.CodeRateLDPC;
                end
            end

            % --- Инициализация новых параметров рассинхронизации ---
            if isfield(Channel, 'TimeOffset')
                obj.TimeOffset = Channel.TimeOffset;
            else
                obj.TimeOffset = 0; % по умолчанию — идеальная синхронизация
            end

            if isfield(Channel, 'FreqOffset')
                obj.FreqOffset = Channel.FreqOffset;
            else
                obj.FreqOffset = 0; % по умолчанию — без частотной ошибки
            end

            if isfield(Channel, 'Fs')
                obj.Fs = Channel.Fs;
                
            else
                obj.Fs = 1; % нормализованная частота дискретизации
            end
        end

        function [OutData, InstChannelParams] = Step(obj, InData, h2dB)
            if obj.isTransparent
                OutData = InData;
                InstChannelParams.Variance = 1;
                return
            end

            % === 1. AWGN ===
            Sigma = sqrt(obj.Pbd * 10^(-h2dB/10) / 2);
            InstChannelParams.Variance = 2*Sigma^2;
            Noise = randn(length(InData), 2) * [1; 1i] * Sigma;
            OutData = InData + Noise;

            % === 2. Временная рассинхронизация ===
            if obj.TimeOffset ~= 0
                % Используем дробную задержку через filter/dsp.VariableFractionalDelay
                % Для MATLAB без Toolbox можно использовать интерполяцию
                N = length(OutData);
                n = (0:N-1)';
                % Интерполяция по дробному сдвигу
                OutData = interp1(n, OutData, n - obj.TimeOffset, 'linear', 0);
            end

            % === 3. Частотная рассинхронизация ===
            if obj.FreqOffset ~= 0
                N = length(OutData);
                t = (0:N-1)' / obj.Fs;
                % Применим частотный сдвиг
                OutData = OutData .* exp(1j * 2 * pi * obj.FreqOffset .* t);
            end
        end
    end
end
