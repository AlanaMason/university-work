classdef ClassEncoder < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли выполнять кодирование и декодирование
            isTransparent;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;
            % Скорость кода
            CodeRate;
      

    end
    properties (SetAccess = private) % Вычисляемые переменные 
        % Тип кодера
            CoderType
        % Сверточный кодер
            ConvEnc;
        % Декодер Витерби
            ViterbiDec;
        % LDPC кодер
            LDPCEnc;
        % LDPC декодер
            LDPCDec;
        % Тип принятия решений
            DecisionType;
        
            tracebackDepth;
            tailLen;
            DVBS2;
            Ninfo;
          
    end
    methods
        function obj = ClassEncoder(Params, LogLanguage) % Конструктор это типа какой именно энкодер и как соберется
            % Выделим поля Params, необходимые для инициализации
                Encoder  = Params.Encoder;
            % Инициализация значений переменных из параметров
                obj.isTransparent = Encoder.isTransparent;
            % Переменная LogLanguage
                obj.LogLanguage = LogLanguage;
                obj.CodeRate = Encoder.CodeRate;
                if Encoder.isTransparent
                    obj.CoderType = 'None';
                    return;
                end
                if isfield(Encoder, 'CoderType')
                    obj.CoderType = Encoder.CoderType;
                 else
                    error('Params.Encoder.CoderType is required (''Conv'' or ''LDPC'').');
                end
                if isfield(Encoder, 'DecisionType')
                     obj.DecisionType = Encoder.DecisionType;
                else
                    obj.DecisionType = 'Hard';
                end
                obj.Ninfo=Params.Source.NumBitsPerFrame;
                 



            switch obj.CoderType
                case 'Conv'
                    trellis = poly2trellis(7, [171 133]);
                    obj.ConvEnc = comm.ConvolutionalEncoder('TrellisStructure',trellis,'TerminationMethod', 'Truncated');
                    
                    constraintLen = 7;
                    obj.tracebackDepth = 5*constraintLen;
                    obj.tailLen=constraintLen-1;
                    switch obj.DecisionType
                        case 'Hard'
                            obj.ViterbiDec = comm.ViterbiDecoder(trellis,...
                             'InputFormat','Hard',... 
                             'TracebackDepth',obj.tracebackDepth,...
                             'TerminationMethod','Truncated');

                        case 'SoftAproc'
                             obj.ViterbiDec = comm.ViterbiDecoder(trellis, ...
                                'InputFormat','Unquantized', 'SoftInputWordLength', 3, ...
                                'TracebackDepth', obj.tracebackDepth,...
                                'InvalidQuantizedInputAction', 'Error', ...
                                'TerminationMethod','Terminated');
                            
                        case 'SoftExact'
                            obj.ViterbiDec = comm.ViterbiDecoder(trellis, ...
                             'InputFormat','Unquantized', ...
                             'TracebackDepth', obj.tracebackDepth,...
                             'TerminationMethod','Terminated');
                    end


                case 'LDPC'
                    obj.DVBS2 = dvbs2ldpc(Encoder.CodeRate); % например, rate = 1/2
                    obj.LDPCEnc = ldpcEncoderConfig(obj.DVBS2);
                    obj.LDPCDec = ldpcDecoderConfig(obj.DVBS2);


            end 
        end





        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            switch obj.CoderType
                case 'Conv'
                    if ismethod(obj.ConvEnc,'reset')
                        reset(obj.ConvEnc);
                    end
                    % Добавляем tail нулей, чтобы энкодер завершил в нулевом состоянии
                    inCol = InData(:);
                    %padded = [inCol; zeros(obj.tailLen,1)];

                    OutData = obj.ConvEnc(inCol); % возвращается закодированный поток
                  
                case 'LDPC'
                    %inCol = InData(:);
                  
                    OutData = ldpcEncode(InData, obj.LDPCEnc);
                otherwise
                    OutData = InData;
            end
        end




        function OutData = StepRx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            switch obj.CoderType
                case 'Conv'
                    
                            % Сбрасываем состояние декодера
                            if ismethod(obj.ViterbiDec,'reset')
                                reset(obj.ViterbiDec);
                            end
                            
                            
                           
                            inCol=InData(:);

                            decoded_all = obj.ViterbiDec(inCol);
                       
                            if length(decoded_all) > obj.Ninfo
                                OutData=decoded_all(1:obj.Ninfo);
                            else
                                
                                OutData = decoded_all;
                             end
 
                case 'LDPC'
                    %inCol=InData(:);
                    OutData = ldpcDecode(InData,obj.LDPCDec, 10);
                otherwise
                    OutData = InData;
            end
        end
    end
end