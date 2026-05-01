classdef ClassSig < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли пропускать сигнал через канал
            isTransparent;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;

            EqualizerOn;
            ScramblerOn;
            Expansion;
            RayCount;


    end
    properties (SetAccess = private) % Вычисляемые переменные

            SigChannelizationCode;

            PilotsChannelizationCode;

            ScrCode;

            PilotSig;

            numSymsPerFrame;

    end
    methods
        function obj = ClassSig(Params, Objs, LogLanguage)
        % Конструктор
            
                Sig = Params.Sig;
        
                obj.isTransparent = Sig.isTransparent;
    
                obj.LogLanguage = LogLanguage;

                obj.EqualizerOn = Sig.EqualizerOn;

                obj.ScramblerOn = Sig.ScramblerOn;

                obj.Expansion = Sig.Expansion;

                obj.RayCount = Sig.RayCount;
                broadeningMat = hadamard(obj.Expansion) / sqrt(obj.Expansion);

                obj.SigChannelizationCode = broadeningMat(5, :);
                obj.PilotsChannelizationCode = broadeningMat(2, :);
                
                obj.ScrCode = GenScrCode(10);
                obj.ScrCode = obj.ScrCode / sqrt(2);

                obj.numSymsPerFrame = Objs.Source.NumBitsPerFrame / Objs.Mapper.log2M;
                pilotSyms = ones(1, obj.numSymsPerFrame);
                obj.PilotSig = kron(pilotSyms, obj.PilotsChannelizationCode);
        end
        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end

            Data = kron(InData.', obj.SigChannelizationCode);

            sigSum = Data + obj.PilotSig;

            if ~obj.EqualizerOn
                OutData = sigSum.';
            else
                if ~(obj.ScramblerOn)
                    ScrSig = sigSum;
                else
                    ScrSig = sigSum .* obj.ScrCode;
                end

                OutData = repmat(ScrSig, 1, 3).';
            end


        end
        function OutData = StepRx(obj, InData, InstChannelParams)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % Здесь должна быть процедура, обратная поцедуре формирования
            % сигнала

            if ~obj.EqualizerOn
                SigRx = reshape(InData, obj.Expansion, []).';

                SignalData = sum(SigRx .* obj.SigChannelizationCode, 2);
                OutData = SignalData;
            else
                len = length(InData)/3;
                frameIdx = (1:len) + len;
                shifts = (-10:10).';
                shiftIdx = frameIdx + shifts;

                if obj.ScramblerOn
                    descrambledRxShifts = InData(shiftIdx) .* conj(obj.ScrCode);
                else
                    descrambledRxShifts = InData(shiftIdx);
                end

                descrambledRxReshaped = reshape(descrambledRxShifts.', obj.Expansion, []).';
                pilotsRx = sum(descrambledRxReshaped .* obj.PilotsChannelizationCode, 2);

                pilotsRxReshaped = reshape(pilotsRx, obj.numSymsPerFrame, []).';

                pilotsFreqOffset = ...
                    angle(pilotsRxReshaped(:, 2:end) .* conj(pilotsRxReshaped(:, 1:end-1)));
                
                pilotsFreqOffset = mean(pilotsFreqOffset, 2);

                % компенсируем фазовый сдвиг
                pilotsPhaseSynced = ...
                    pilotsRxReshaped .* exp(-1i * pilotsFreqOffset * (1:obj.numSymsPerFrame));

                rakePattern = abs(sum(pilotsPhaseSynced, 2));

                [~, sortedIdx] = sort(rakePattern, 'descend');

                bestIds = sortedIdx(1:obj.RayCount);  
                
                raySyms = zeros(obj.RayCount, obj.numSymsPerFrame);     % строки: лучи, столбцы: символы
                rayPilots = zeros(obj.RayCount, obj.numSymsPerFrame);   % оценки пилотов (каналов)

                for k = 1:obj.RayCount
                    id = bestIds(k);

                    Ray = descrambledRxShifts(id, :);

                    sig = reshape(Ray, obj.Expansion, []).';
    
                    raySyms(k, :) = sum(sig .* obj.SigChannelizationCode, 2).';
                    
                    rayPilots(k, :) = pilotsRxReshaped(id, :);
                end


                OutSyms = zeros(1, obj.numSymsPerFrame);

                for k = 1:obj.numSymsPerFrame
                    h_vec = rayPilots(:, k);
                    s_vec = raySyms(:, k);
                    numerator = sum(conj(h_vec) .* s_vec);
                    denom = sum(abs(h_vec).^2);

                    OutSyms(k) = numerator / denom;

                end

                OutData = (OutSyms).';
            end



        end
    end
end