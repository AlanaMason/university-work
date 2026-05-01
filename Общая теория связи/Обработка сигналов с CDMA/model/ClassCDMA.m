classdef ClassCDMA < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли пропускать сигнал через канал
            isTransparent;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;

            isNOTEQ;

            isNOTScramb;

            Expansion;

            ChannelizationCodeId;

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
        function obj = ClassCDMA(Params, Objs, LogLanguage)
        % Конструктор
            
                CDMA = Params.CDMA;
        
                obj.isTransparent = CDMA.isTransparent;
    
                obj.LogLanguage = LogLanguage;

                obj.isNOTEQ = CDMA.isNOTEQ;

                obj.isNOTScramb = CDMA.isNOTScramb;

                obj.Expansion = CDMA.Expansion;

                obj.RayCount = CDMA.RayCount;

                obj.ChannelizationCodeId = CDMA.ChannelizationCodeId;

                broadeningMat = hadamard(obj.Expansion) / sqrt(obj.Expansion);

                obj.SigChannelizationCode = broadeningMat(obj.ChannelizationCodeId, :);
                obj.PilotsChannelizationCode = broadeningMat(obj.ChannelizationCodeId - 1, :);
                
                scrCodeNum = 10;
                obj.ScrCode = GenScrCode(scrCodeNum);
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
            
            % Здесь должна быть процедура формирования сигнала

            infSig = kron(InData.', obj.SigChannelizationCode);

            sigSum = infSig + obj.PilotSig;

            if obj.isNOTEQ
                OutData = sigSum.';
            else
                if obj.isNOTScramb
                    sig_scr = sigSum;
                else
                    sig_scr = sigSum .* obj.ScrCode;
                end

                OutData = repmat(sig_scr, 1, 3).';
            end


        end
        function OutData = StepRx(obj, InData, InstChannelParams)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % Здесь должна быть процедура, обратная поцедуре формирования
            % сигнала

            if obj.isNOTEQ
                sig = reshape(InData, obj.Expansion, []).';

                sig_syms = sum(sig .* obj.SigChannelizationCode, 2);
                OutData = sig_syms;
            else
                
                frameIdx = (1:38400) + 38400;
                shifts = (-15:15).';
                shiftIdx = frameIdx + shifts;

                if obj.isNOTScramb
                    descrambledRxShifts = InData(shiftIdx);
                else
                    descrambledRxShifts = InData(shiftIdx) .* conj(obj.ScrCode);
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

                % idx = find(sortedIdx == sortedIdx(1) - 1);
                % sortedIdx(idx) = [];
                % 
                % idx = find(sortedIdx == sortedIdx(1) + 1);
                % sortedIdx(idx) = [];
                


                bestIds = sortedIdx(1:obj.RayCount);   % индексы топ-N лучей
                
                raySyms = zeros(obj.RayCount, obj.numSymsPerFrame);     % строки: лучи, столбцы: символы
                rayPilots = zeros(obj.RayCount, obj.numSymsPerFrame);   % оценки пилотов (каналов)

                for k = 1:obj.RayCount
                    id = bestIds(k);

                    Ray = descrambledRxShifts(id, :);

                    sig = reshape(Ray, obj.Expansion, []).';
    
                    raySyms(k, :) = sum(sig .* obj.SigChannelizationCode, 2).';
                    
                    rayPilots(k, :) = pilotsRxReshaped(id, :);
                end


                combinedSyms = zeros(1, obj.numSymsPerFrame);

                for k = 1:obj.numSymsPerFrame
                    h_vec = rayPilots(:, k);
                    s_vec = raySyms(:, k);
                    numerator = sum(conj(h_vec) .* s_vec);
                    denom = sum(abs(h_vec).^2);

                    combinedSyms(k) = numerator / denom;

                end

                OutData = ( combinedSyms ).';
            end


            % SigRx_reshaped = reshape(InData, [(obj.Nfft + obj.CP), obj.N_OFDM_sym]);
            % 
            % delete_cp = SigRx_reshaped(obj.CP+1:end, :);
            % OFDM_Sig_Rx = fft(delete_cp);
            % 
            % if obj.isNOTEQ
            %     eq_sig_rx = OFDM_Sig_Rx(obj.dataIdx, :);
            % else
            % 
            % 
            %     ChanFilters = InstChannelParams.info_chan.ChannelFilterCoefficients;
            %     OfdmEstBeginIdx = obj.Nfft/2;      % середина символа
            %     OfdmEstStep = obj.Nfft + obj.CP;    % шаг между символами
            % 
            %     PathGains_mid = InstChannelParams.PathGains( ...
            %         OfdmEstBeginIdx + 1 : OfdmEstStep : end, :);
            % 
            %     ImpResp = reshape(PathGains_mid.', ...
            %         size(PathGains_mid, 2), 1, []) .* ChanFilters;
            % 
            %     h_est = squeeze(sum(ImpResp, 1)) ;
            % 
            %     Hf = fft(h_est, obj.Nfft, 1);   % частотная характеристика
            % 
            %     eq_sig_rx = OFDM_Sig_Rx ./ Hf;
            % 
            % 
            %     eq_sig_rx = eq_sig_rx(obj.dataIdx, :);
            % end
            % 
            % OutData = eq_sig_rx(:);
        end
    end
end