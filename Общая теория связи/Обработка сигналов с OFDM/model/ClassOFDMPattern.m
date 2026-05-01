classdef ClassOFDMPattern < handle
    properties (SetAccess = private)
        isTransparent;
        LogLanguage;
        NFFt;
        PilotNum;
        PilotModulationType;
        PilotModulationOrdder;
        PilotPhaseOffset;
        PilotSymbolMapping;
        TOFDM;
        FreqGuard;
        
    end


    properties (SetAccess = private)
        PilotConstellation;
        idPilot;
        idData;
        NumDataCarriers;

        PilotData;

        NOFDMSimbols;
        NumBitsPerFrame;
        Fs;

    end


    methods
        function obj = ClassOFDMPattern(Params, LogLanguage, Objs)
            OFDMPattern = Params.OFDMPattern;

            obj.isTransparent         = OFDMPattern.isTransparent;
            obj.NFFt                  = OFDMPattern.NFFt;
            obj.PilotNum             = OFDMPattern.PilotNum;
            obj.PilotModulationType   = OFDMPattern.PilotModulationType;
            obj.PilotModulationOrdder = OFDMPattern.PilotModulationOrdder;
            obj.PilotPhaseOffset      = OFDMPattern.PilotPhaseOffset;
            obj.PilotSymbolMapping    = OFDMPattern.PilotSymbolMapping;
            obj.FreqGuard             = OFDMPattern.FreqGuard;
            obj.NumBitsPerFrame       = Objs.Source.NumBitsPerFrame;

            obj.TOFDM                 = OFDMPattern.TOFDM;
            obj.LogLanguage           = LogLanguage;




            % Расчет индексов
            idAllData = 1:obj.NFFt;
            idDc = obj.NFFt/2+1;
            idAllData = setdiff(idAllData,idDc);
            if obj.FreqGuard > 0
                idAllData = idAllData(obj.FreqGuard+1:end-obj.FreqGuard);
            end

            NumActive = length(idAllData);

           
            PilotSpacing = floor(NumActive / obj.PilotNum);
            if PilotSpacing < 1
                PilotSpacing = 1;
            end
            idPilotInActive = 1:PilotSpacing:NumActive;
            if length(idPilotInActive) > obj.PilotNum
                idPilotInActive = idPilotInActive(1:obj.PilotNum);
            end

            obj.idPilot = idAllData(idPilotInActive);


         
            obj.idData = setdiff(idAllData,obj.idPilot);
            obj.NumDataCarriers = length(obj.idData);

           NumSourceBits = Objs.Source.NumBitsPerFrame;
            if ~Objs.Encoder.isTransparent
                NumEncodedBits = NumSourceBits / Objs.Encoder.CodeRate;
            else
                NumEncodedBits = NumSourceBits;
            end

            BitsPerSymbol = log2(Objs.Mapper.ModulationOrder) * obj.NumDataCarriers;
            obj.NOFDMSimbols = ceil(NumEncodedBits / BitsPerSymbol);
            obj.Fs=(obj.NFFt)/obj.TOFDM;

            
            txPilot = randi([0 1],length(obj.idPilot)*(log2(obj.PilotModulationOrdder))*obj.NOFDMSimbols,1);
            switch obj.PilotModulationType
                case 'PSK'
                    obj.PilotConstellation = pskmod(0:obj.PilotModulationOrdder-1, obj.PilotModulationOrdder,...
                        obj.PilotPhaseOffset, obj.PilotSymbolMapping);
                    obj.PilotData = pskmod(txPilot, obj.PilotModulationOrdder,...
                        obj.PilotPhaseOffset,obj.PilotSymbolMapping,"InputType","bit");
            end

           
          
        end

        function OutData = Step(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            OutData = InData;
        end
    end
end
