classdef ClassEncoder < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли выполнять кодирование и декодирование
            isTransparent;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;
        % Тип кодера/декодера
            Type;
        % Тип решения
            DecisionMethod

            TypeModulation;
    end
    properties (SetAccess = private) % Вычисляемые переменные
            Rate;
            
        % для свёрточного кодирования
            trellis;

            EncoderLDPC;
            DecoderLDPC;

    end
    methods
        function obj = ClassEncoder(Params, LogLanguage) % Конструктор
            % Выделим поля Params, необходимые для инициализации
                Encoder  = Params.Encoder;
            % Инициализация значений переменных из параметров
                obj.isTransparent = Encoder.isTransparent;
            % Переменная LogLanguage
                obj.LogLanguage = LogLanguage;
                    
                obj.TypeModulation = Encoder.TypeModulation;
                obj.Type = Encoder.Type;
                obj.DecisionMethod = Encoder.DecisionMethod;

                if obj.isTransparent
                    obj.Rate = 1;
                end
                
                if strcmp(obj.Type, 'Poly')
                    obj.Rate = 1/2 ;
                    obj.trellis = poly2trellis(7, [171 133]);

                elseif strcmp(obj.Type, 'LDPC')
                    
                    if strcmp(obj.TypeModulation, 'QPSK')
                        obj.Rate = 1/2 ;

                    elseif strcmp(obj.TypeModulation, '8PSK')
                        obj.Rate = 3/4 ;

                    end

                    H = dvbs2ldpc(obj.Rate);
                    obj.EncoderLDPC = comm.LDPCEncoder(H);
                    obj.DecoderLDPC = comm.LDPCDecoder(H);
                    % obj.DecoderLDPC.MaximumIterationCount = 50;   % число итераций BP-декодера
                    % obj.DecoderLDPC.IterationTerminationCondition = 'Parity check satisfied';
                    % obj.DecoderLDPC.OutputValue = 'Information part';  % вернуть только информационные биты
                
                else % без кодирования
                    obj.Rate = 1;
                end

        end
        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % Здесь должна быть процедура кодирования
            if strcmp(obj.Type, 'Poly')
                OutData = convenc(InData, obj.trellis);

            elseif strcmp(obj.Type, 'LDPC')
                OutData = obj.EncoderLDPC(InData);
            
            else % без кодирования
                OutData = InData;
            end
        end
        function OutData = StepRx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % Здесь должна быть процедура декодирования
            if strcmp(obj.Type, 'Poly')

                if strcmp(obj.DecisionMethod, 'Log-likelihood ratio')
                    OutData = vitdec(InData, obj.trellis, 30, "trunc", 'unquant');
                    
                    
                elseif strcmp(obj.DecisionMethod, 'Approximate log-likelihood ratio')

                    % NumBitSoft = 4; 
                    % % Масштабируем в диапазон [0, 2^NumBitSoft - 1]
                    % soft_bits = (2^NumBitSoft - 1) - (round( (InData - min(InData)) * (2^NumBitSoft - 1) / (max(InData) - min(InData)) ) );
                    % OutData = vitdec(soft_bits, obj.trellis, 30, 'trunc', 'soft', NumBitSoft);

                    OutData = vitdec(InData, obj.trellis, 30, "trunc", 'unquant');

                else
                    OutData = vitdec(InData, obj.trellis, 30, 'trunc', 'hard');
                end

            elseif strcmp(obj.Type, 'LDPC')

                if strcmp(obj.DecisionMethod, 'Hard decision')
                    llr = (1 - 2.*InData) .* 10;
                    OutData = obj.DecoderLDPC(llr);

                else
                    OutData = obj.DecoderLDPC(InData);
                end
                
            else % без кодирования
                if strcmp(obj.DecisionMethod, 'Hard decision')
                    OutData = InData;
                else
                    OutData = InData < 0;
                end
            end
        end
    end
end