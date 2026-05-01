classdef ClassMapper < handle
    properties (SetAccess = private)
        isTransparent;
        Type;
        ModulationOrder;
        PhaseOffset;
        SymbolMapping;
        DecisionMethod;
        LogLanguage;
    end

    properties (SetAccess = private)
        Constellation;
        Bits;
        log2M;
        DeMapper;
        NumBitsPerFrame;
    end

    methods
        function obj = ClassMapper(Params, LogLanguage, Objs)
            MapperParams = Params.Mapper;

            obj.isTransparent   = MapperParams.isTransparent;
            obj.Type            = MapperParams.Type;
            obj.ModulationOrder = MapperParams.ModulationOrder;
            obj.PhaseOffset     = MapperParams.PhaseOffset;
            obj.SymbolMapping   = MapperParams.SymbolMapping;
            obj.DecisionMethod  = MapperParams.DecisionMethod;
            obj.LogLanguage     = LogLanguage;
            obj.NumBitsPerFrame = Objs.Source.NumBitsPerFrame;
            obj.log2M = log2(obj.ModulationOrder);

            % Генерация всех возможных битовых последовательностей
            if obj.isTransparent
                obj.Bits = 1;
                obj.Constellation = 1;
            else
                obj.Bits = de2bi(0:obj.ModulationOrder-1, obj.log2M, 'left-msb').';
               
                switch obj.Type
                    case 'QAM'
                        obj.Constellation = qammod(0:obj.ModulationOrder-1, ...
                            obj.ModulationOrder, obj.SymbolMapping, 'UnitAveragePower', true, ...
                            "PlotConstellation",false);
                    case 'PSK'
                        obj.Constellation = pskmod(0:obj.ModulationOrder-1, ...
                            obj.ModulationOrder, obj.PhaseOffset, obj.SymbolMapping);
                    otherwise
                        error('Unsupported modulation type: %s', obj.Type);
                end
            end
        end

        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end

            switch obj.Type
                case 'QAM'
                    OutData = qammod(InData, obj.ModulationOrder, ...
                        obj.SymbolMapping, 'InputType', 'bit','UnitAveragePower', true);
                case 'PSK'
                    OutData = pskmod(InData, obj.ModulationOrder, obj.PhaseOffset,...
                         obj.SymbolMapping,'InputType', 'bit');
            end
        end


        function OutData = StepRx(obj, InData, InstChannelParams)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            switch obj.Type
                case 'QAM'
                    switch obj.DecisionMethod
                        case 'Log-likelihood ratio'
                            OutData = qamdemod(InData, obj.ModulationOrder, ...
                            obj.SymbolMapping,'OutputType', 'llr', 'NoiseVariance', InstChannelParams.Variance,...
                            'UnitAveragePower', true);
                        case 'Approximate log-likelihood ratio'
                           
                            approxLLR = qamdemod(InData, obj.ModulationOrder, ...
                            obj.SymbolMapping,'OutputType', 'approxllr', 'NoiseVariance', InstChannelParams.Variance,...
                            'UnitAveragePower', true);

                        
                            OutData = approxLLR;
                        otherwise
                            OutData1 = qamdemod(InData, obj.ModulationOrder, ...
                            obj.SymbolMapping,'OutputType', 'bit', 'UnitAveragePower', true);

                            %это тоже костыль на случай если нет
                            %кодирования. А ЕСЛИМ ОНО ЕСТЬ лень...
                            %OutData=OutData1(1:obj.NumBitsPerFrame);
                            OutData=OutData1;
                    end
                case 'PSK'
                    switch obj.DecisionMethod
                        case 'Log-likelihood ratio'
                            OutData = pskdemod(InData, obj.ModulationOrder,obj.PhaseOffset, ...
                            obj.SymbolMapping,'OutputType', 'llr', 'NoiseVariance', InstChannelParams.Variance);
                        case 'Approximate log-likelihood ratio'
                           
                            approxLLR = pskdemod(InData, obj.ModulationOrder, obj.PhaseOffset,...
                            obj.SymbolMapping,'OutputType', 'approxllr', 'NoiseVariance', InstChannelParams.Variance);

                        
                            OutData = approxLLR;
                        otherwise
                            OutData = pskdemod(InData, obj.ModulationOrder, obj.PhaseOffset, ...
                            obj.SymbolMapping,'OutputType', 'bit');
                            %OutData=1-OutData;
                    end
            end
        end
    end
end
