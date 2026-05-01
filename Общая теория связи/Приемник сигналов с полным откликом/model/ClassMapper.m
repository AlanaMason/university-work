classdef ClassMapper < handle
    properties (SetAccess = private)
        isTransparent;
        Type;
        ModulationOrder;
        PhaseOffset;
        SymbolMapping;
        DecisionMethod;
        LogLanguage;
        log2M;
        Constellation;
        Bits;
        Mapper;
        DeMapper;
        % Ќовые параметры дл€ QAM
        QAMSymbolOrder;
        % ƒл€ дифференциальной модул€ции
        PreviousPhase;
    end

    methods
        function obj = ClassMapper(Params, LogLanguage)
            Mapper = Params.Mapper;
            obj.isTransparent = Mapper.isTransparent;
            obj.Type = Mapper.Type;
            obj.ModulationOrder = Mapper.ModulationOrder;
            obj.PhaseOffset = Mapper.PhaseOffset;
            obj.SymbolMapping = Mapper.SymbolMapping;
            obj.DecisionMethod = Mapper.DecisionMethod;
            obj.LogLanguage = LogLanguage;
            obj.log2M = log2(Mapper.ModulationOrder);

            % »нициализаци€ предыдущей фазы дл€ дифференциальной модул€ции
            obj.PreviousPhase = 0;

            % ѕреобразование SymbolMapping в параметр, пон€тный qammod/qamdemod
            if strcmp(obj.SymbolMapping, 'Gray')
                obj.QAMSymbolOrder = 'gray';
            else
                obj.QAMSymbolOrder = 'bin';
            end

            if strcmp(Mapper.Type, 'QAM')
                % —оздаем созвездие вручную
                obj.Bits = de2bi(0:obj.ModulationOrder-1, obj.log2M, 'left-msb').';
                % √енераци€ созвезди€ с учетом фазового сдвига
                const = qammod(0:obj.ModulationOrder-1, obj.ModulationOrder, ...
                    obj.QAMSymbolOrder, 'UnitAveragePower', true);
                obj.Constellation = const * exp(1i * obj.PhaseOffset);
                
            elseif strcmp(Mapper.Type, 'PSK')
                % —оздание битовых последовательностей
                obj.Bits = de2bi(0:obj.ModulationOrder-1, obj.log2M, 'left-msb').';
                % —оздание созвезди€ вручную
                const = pskmod(0:obj.ModulationOrder-1, obj.ModulationOrder, ...
                    obj.PhaseOffset, obj.SymbolMapping);
                obj.Constellation = const;
                
            elseif strcmp(Mapper.Type, 'DPSK')
                % ƒл€ дифференциальной модул€ции
                obj.Bits = de2bi(0:obj.ModulationOrder-1, obj.log2M, 'left-msb').';
                
                const = dpskmod(0:obj.ModulationOrder-1, obj.ModulationOrder, ...
                    obj.PhaseOffset, obj.SymbolMapping);
                obj.Constellation = const;
            end
        end

        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            if strcmp(obj.Type, 'QAM')
                % ћодул€ци€ QAM
                OutData = qammod(InData, obj.ModulationOrder, ...
                    obj.QAMSymbolOrder, ...
                    'InputType', 'bit', ...
                    'UnitAveragePower', true);
                % ‘азовый сдвиг
                OutData = OutData * exp(1i * obj.PhaseOffset);

            elseif strcmp(obj.Type, 'PSK')
                % ћодул€ци€ PSK
                OutData = pskmod(InData, obj.ModulationOrder, ...
                    obj.PhaseOffset, obj.SymbolMapping, ...
                    'InputType', 'bit');
                    
            elseif strcmp(obj.Type, 'DPSK')
                % ƒ»‘‘≈–≈Ќ÷»јЋ№Ќјя ћќƒ”Ћя÷»я с использованием встроенных функций
                if obj.ModulationOrder == 2
                    % DBPSK
                    OutData = dpskmod(InData, 2, obj.PhaseOffset, 'gray');
                elseif obj.ModulationOrder == 4
                    % DQPSK  
                    OutData = dpskmod(InData, 4, obj.PhaseOffset, 'gray');
                else
                    % ќбщий случай DPSK
                    OutData = dpskmod(InData, obj.ModulationOrder, obj.PhaseOffset, 'gray');
                end
            end
        end

        function OutData = StepRx(obj, InData, InstChannelParams)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            if strcmp(obj.Type, 'QAM')
                %  омпенсаци€ фазы
                InData = InData * exp(-1i * obj.PhaseOffset);
                
                if strcmp(obj.DecisionMethod, 'Hard decision')
                    OutData = qamdemod(InData, obj.ModulationOrder, ...
                        obj.QAMSymbolOrder, ...
                        'OutputType', 'bit', ...
                        'UnitAveragePower', true);
                else
                    % llr или approxllr
                    if strcmp(obj.DecisionMethod, 'Log-likelihood ratio')
                        decisionType = 'llr';
                    else
                        decisionType = 'approxllr';
                    end
                    OutData = qamdemod(InData, obj.ModulationOrder, ...
                        obj.QAMSymbolOrder, ...
                        'OutputType', decisionType, ...
                        'UnitAveragePower', true, ...
                        'NoiseVariance', InstChannelParams.Variance);
                end

            elseif strcmp(obj.Type, 'PSK')
                % ƒл€ PSK тоже учитываем три варианта
                if strcmp(obj.DecisionMethod, 'Hard decision')
                    OutData = pskdemod(InData, obj.ModulationOrder, ...
                        obj.PhaseOffset, obj.SymbolMapping, ...
                        'OutputType', 'bit');
                else
                    if strcmp(obj.DecisionMethod, 'Log-likelihood ratio')
                        decisionType = 'llr';
                    else
                        decisionType = 'approxllr';
                    end
                    OutData = pskdemod(InData, obj.ModulationOrder, ...
                        obj.PhaseOffset, obj.SymbolMapping, ...
                        'OutputType', decisionType, ...
                        'NoiseVariance', InstChannelParams.Variance);
                end
                
            elseif strcmp(obj.Type, 'DPSK')
                % ƒ»‘‘≈–≈Ќ÷»јЋ№Ќјя ƒ≈ћќƒ”Ћя÷»я с использованием встроенных функций
                if strcmp(obj.DecisionMethod, 'Hard decision')
                    if obj.ModulationOrder == 2
                        % DBPSK
                        OutData = dpskdemod(InData, 2, obj.PhaseOffset, 'gray');
                    elseif obj.ModulationOrder == 4
                        % DQPSK
                        OutData = dpskdemod(InData, 4, obj.PhaseOffset, 'gray');
                    else
                        % ќбщий случай DPSK
                        OutData = dpskdemod(InData, obj.ModulationOrder, obj.PhaseOffset, 'gray');
                    end
                else
                    % ƒл€ м€гких решений
                    if strcmp(obj.DecisionMethod, 'Log-likelihood ratio')
                        decisionType = 'llr';
                    else
                        decisionType = 'approxllr';
                    end
                    
                    if obj.ModulationOrder == 2
                        OutData = dpskdemod(InData, 2, obj.PhaseOffset, ...
                            'OutputType', decisionType, ...
                            'NoiseVariance', InstChannelParams.Variance);
                    elseif obj.ModulationOrder == 4
                        OutData = dpskdemod(InData, 4, obj.PhaseOffset, ...
                            'OutputType', decisionType, ...
                            'NoiseVariance', InstChannelParams.Variance);
                    else
                        OutData = dpskdemod(InData, obj.ModulationOrder, obj.PhaseOffset, ...
                            'OutputType', decisionType, ...
                            'NoiseVariance', InstChannelParams.Variance);
                    end
                end
            end
        end
    end
end