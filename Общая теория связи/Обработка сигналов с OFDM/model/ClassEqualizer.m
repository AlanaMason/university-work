classdef ClassEqualizer < handle
    properties (SetAccess = private)
    isTransparent;
    LogLanguage;
    EqualizerType;
    InterpolationType;

    end


    properties (SetAccess = private)
    idData;
    idPilot;
    NFFt;
    PilotData;
    NOFDMSimbols;

    end


    methods
        function obj = ClassEqualizer(Params, LogLanguage, Objs)
            Equalizer = Params.Equalizer;

            obj.isTransparent         = Equalizer.isTransparent;
            obj.EqualizerType         = Equalizer.EqualizerType;
            obj.InterpolationType     = Equalizer.InterpolationType;
            obj.NFFt                  = Objs.OFDMPattern.NFFt;
            obj.idData                = Objs.OFDMPattern.idData;
            obj.idPilot               = Objs.OFDMPattern.idPilot;
            obj.PilotData             = Objs.OFDMPattern.PilotData;
            obj.NOFDMSimbols          = Objs.OFDMPattern.NOFDMSimbols;
            obj.LogLanguage           = LogLanguage;
 
        end

        function OutData = Step(obj, InData, InstChannelParams)
            if obj.isTransparent
                OutData = InData;
                return
            end
            % тут посчитаем характеристику канала
            
            rxPilot = InData(obj.idPilot,:);
            nPilot = length(obj.idPilot);
            txPilot2 = reshape(obj.PilotData, nPilot, obj.NOFDMSimbols);
            hPilot = rxPilot ./ txPilot2;

            hChannel = zeros(obj.NFFt, obj.NOFDMSimbols);
            for i = 1:obj.NOFDMSimbols
                hChannel(:, i) = interp1(obj.idPilot, hPilot(:, i), ...
                                         (1:obj.NFFt), obj.InterpolationType, 'extrap');
            end
           
            %hChannel = interp1(obj.idPilot, hPilot, 1:obj.NFFt, obj.InterpolationType, 'extrap');
                ReceivedData = InData(obj.idData, :);
                hChannelData = hChannel(obj.idData, :);
            switch obj.EqualizerType
                case 'ZF'
                    rxEqualized = ReceivedData./ hChannelData;
                    ProblemIndices = isnan(rxEqualized) | isinf(rxEqualized);
                    rxEqualized(ProblemIndices) = 0;
                    

                case 'MMSE'
                    rxEqualized = (conj(hChannelData)./(abs(hChannelData).^2 + InstChannelParams.Variance)).*ReceivedData;
            end
            OutData = reshape(rxEqualized,[],1);
            
        end
    end
end
