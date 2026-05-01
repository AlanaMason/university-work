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
        % Тип отображения бит на точки сигнального созвездия: Binary | Gray
            SymbolMapping;
        % Вариант принятия решений о модуляционных символах: hard
        % | llr | Approxllr
            DecisionMethod;
        % Для ldpc

        % Переменная управления языком вывода информации для пользователя
            LogLanguage;
    end

    properties (SetAccess = private) % Вычисляемые переменные
        % Часто используемое значение
            log2M;
            Constellation
    end

    methods
        function obj = ClassMapper(Params, LogLanguage) % Вызывает конструктор
            % Выделим поля Params, необходимые для инициализации
                Mapper  = Params.Mapper;
            % Инициализация значений переменных из параметров
                obj.isTransparent = Mapper.isTransparent;
                obj.Type            = Mapper.Type;
                obj.ModulationOrder = Mapper.ModulationOrder;
                obj.PhaseOffset     = Mapper.PhaseOffset;
                obj.SymbolMapping   = Mapper.SymbolMapping;
                obj.DecisionMethod  = Mapper.DecisionMethod;
               
            % Переменная LogLanguage
                obj.LogLanguage = LogLanguage;

            % Расчёт часто используемого значения
                obj.log2M = log2(Mapper.ModulationOrder);
                % Суммарное количество точек созвездия для APSK
        
            if ~obj.isTransparent
                obj.createConstellation();
            end
        end
        
         function createConstellation(obj)
            % Создание созвездия
            if strcmp(obj.Type, 'QAM')
                    % Создаем QAM созвездие
                    obj.Constellation = qammod(0:obj.ModulationOrder-1, ...
                        obj.ModulationOrder, ...
                        'UnitAveragePower', true, ...
                        "PlotConstellation",false);
            elseif strcmp(obj.Type, 'PSK')
                    % Создаем PSK созвездие
                    obj.Constellation = pskmod(0:obj.ModulationOrder-1, ...
                        obj.ModulationOrder, ...
                        obj.PhaseOffset, ...
                        "PlotConstellation",false);

            end
        end

        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            if strcmp(obj.Type, 'QAM')
                OutData = qammod(InData, obj.ModulationOrder, ...
                    obj.SymbolMapping,...
                    'InputType', 'bit', ...
                    'UnitAveragePower', true);
            elseif strcmp(obj.Type, 'PSK')
                OutData = pskmod(InData, obj.ModulationOrder, ...
                    obj.PhaseOffset, obj.SymbolMapping, ...
                    'InputType', 'bit');

            end
        end

        function OutData = StepRx(obj, InData, InstChannelParams)
            if obj.isTransparent
                OutData = InData;
                return
            end

            if strcmp(obj.Type, 'QAM')
                OutData = qamdemod(InData, obj.ModulationOrder, ...
                    obj.SymbolMapping,...
                    'OutputType', obj.DecisionMethod, ...
                    'UnitAveragePower', true, ...
                    'NoiseVariance', InstChannelParams.Variance);
            elseif strcmp(obj.Type, 'PSK')
                OutData = pskdemod(InData, obj.ModulationOrder, ...
                    obj.PhaseOffset, obj.SymbolMapping, ...
                    'OutputType', obj.DecisionMethod, ...
                    'NoiseVariance', InstChannelParams.Variance);

            end
%             if strcmp(obj.DecisionMethod, 'bit')
%                 OutData = 1 - OutData;
%             end
        end
    end
end
