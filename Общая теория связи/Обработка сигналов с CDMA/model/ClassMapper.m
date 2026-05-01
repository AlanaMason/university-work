classdef ClassMapper < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли выполнять модуляцию и демодуляцию
            isTransparent;
        % Тип сигнального созвездия
            Type;
        % Размер сигнального созвездия
            ModulationOrder;
        % Ротация сигнального созвездия
            PhaseOffset;
        % Выходные данные виде битов или нет
            BitOutput;
        % Тип отображения бит на точки сигнального созвездия: Binary | Gray
            SymbolMapping;

            NumSoftBits;

        % Вариант принятия решений о модуляционных символах: Hard decision
        % | Log-likelihood ratio | Approximate log-likelihood ratio
            DecisionMethod;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;
    end
    properties (SetAccess = private) % Вычисляемые переменные
        % Массив точек сигнального созвездия и соответствующий ему массив
        % бит
            Constellation;
            Bits;
        % Часто используемое значение
            log2M;
        % Объекты для модуляции/демодуляции
            Mapper;
            DeMapper;
    end
    methods
        function obj = ClassMapper(Params, LogLanguage) % Конструктор
            % Выделим поля Params, необходимые для инициализации
                Mapper  = Params.Mapper;
            % Инициализация значений переменных из параметров
                obj.isTransparent = Mapper.isTransparent;
                obj.Type            = Mapper.Type;
                obj.ModulationOrder = Mapper.ModulationOrder;
                obj.PhaseOffset     = Mapper.PhaseOffset;
                obj.BitOutput       = Mapper.BitOutput;
                obj.SymbolMapping   = Mapper.SymbolMapping;
                obj.DecisionMethod  = Mapper.DecisionMethod;
            % Переменная LogLanguage
                obj.LogLanguage = LogLanguage;

            % Расчёт часто используемого значения
                obj.log2M = log2(Mapper.ModulationOrder);

            % Определим массив возможных бит на входе модулятора и
            % соответствующих модуляционных символов
                if obj.isTransparent
                    obj.Bits = 1;
                    obj.Constellation = 1;
                else
                    if strcmp(obj.Type, 'QAM')
                        obj.Bits = qammod(0:obj.ModulationOrder-1, ...
                            obj.ModulationOrder, obj.SymbolMapping);
        
                    elseif strcmp(obj.Type, 'PSK')
                        obj.Bits = pskmod(0:obj.ModulationOrder-1, ...
                            obj.ModulationOrder, obj.PhaseOffset, obj.SymbolMapping);

                    elseif strcmp(obj.Type, 'DPSK')
                        obj.Bits = dpskmod(0:obj.ModulationOrder-1, ...
                            obj.ModulationOrder, obj.PhaseOffset, obj.SymbolMapping);
        
                    end
 
                    obj.Constellation = obj.Bits;
                end
        end
        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end

            if strcmp(obj.Type, 'QAM')
                MapData = qammod(InData, obj.ModulationOrder, ...
                    obj.SymbolMapping, 'InputType', 'bit');

            elseif strcmp(obj.Type, 'PSK')
                MapData = pskmod(InData, obj.ModulationOrder, ...
                    obj.PhaseOffset, obj.SymbolMapping, 'InputType', 'bit');

            elseif strcmp(obj.Type, 'DPSK')
                MapData = dpskmod(InData, obj.ModulationOrder);
            end

            OutData = MapData;
            
        end
        function OutData = StepRx(obj, InData, InstChannelParams)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % if ~(strcmp(obj.DecisionMethod, 'Hard decision'))
            %     set(obj.DeMapper, 'Variance', InstChannelParams.Variance);
            % end
            
            if strcmp(obj.Type, 'QAM')
                if strcmp(obj.DecisionMethod, 'Hard decision')
                    MapData = qamdemod(InData, obj.ModulationOrder, ...
                        obj.SymbolMapping, "OutputType", "bit");

                elseif strcmp(obj.DecisionMethod, 'Approximate log-likelihood ratio')
                    MapData = qamdemod(InData, obj.ModulationOrder, ...
                        obj.SymbolMapping, "OutputType", "approxllr", ...
                        "NoiseVariance", InstChannelParams.Variance);


                elseif strcmp(obj.DecisionMethod, 'Log-likelihood ratio')
                    MapData = qamdemod(InData, obj.ModulationOrder, ...
                        obj.SymbolMapping, "OutputType", "llr", ...
                        "NoiseVariance", InstChannelParams.Variance);
                end

            elseif strcmp(obj.Type, 'PSK')
                if strcmp(obj.DecisionMethod, 'Hard decision')
                    MapData = pskdemod(InData, obj.ModulationOrder, ...
                        obj.PhaseOffset, obj.SymbolMapping, "OutputType", "bit");

                elseif strcmp(obj.DecisionMethod, 'Approximate log-likelihood ratio')
                    MapData = pskdemod(InData, obj.ModulationOrder, obj.PhaseOffset, ...
                        obj.SymbolMapping, "OutputType", "approxllr", ...
                        "NoiseVariance", InstChannelParams.Variance);

                elseif strcmp(obj.DecisionMethod, 'Log-likelihood ratio')
                    MapData = pskdemod(InData, obj.ModulationOrder, obj.PhaseOffset, ...
                        obj.SymbolMapping, "OutputType", "llr", ...
                        "NoiseVariance", InstChannelParams.Variance);
                end

            elseif strcmp(obj.Type, 'DPSK')
                MapData = dpskdemod(InData, obj.ModulationOrder);
            end
            
            OutData = MapData;
        end
    end
end