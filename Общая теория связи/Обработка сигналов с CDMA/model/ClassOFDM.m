classdef ClassOFDM < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли пропускать сигнал через канал
            isTransparent;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;

            isEQ;

            InterpMethod;

            CP;

            TypeEQ;

    end
    properties (SetAccess = private) % Вычисляемые переменные
            Nfft = 2048;

            N_OFDM_sym = 10;

            pilotIdx;

            dataIdx;

            pilot_spacing;
            
            N_pilot;

            ModPilots;

            M_pilot = 2;

    end
    methods
        function obj = ClassOFDM(Params, Objs, LogLanguage)
        % Конструктор
            % Выделим поля Params, необходимые для инициализации
                OFDM = Params.OFDM;
            % Инициализация значений переменных из параметров
                obj.isTransparent = OFDM.isTransparent;
            % Переменная LogLanguage
                obj.LogLanguage = LogLanguage;
                
                obj.CP = round(obj.Nfft * OFDM.CP);

                obj.isEQ = OFDM.isEQ;

                obj.InterpMethod = OFDM.InterpMethod;

                obj.TypeEQ = OFDM.TypeEQ;

                obj.pilot_spacing = OFDM.Step + 1;

                if Objs.Encoder.isTransparent
                    obj.N_pilot = 810/OFDM.Step + 1;
                    M = 810 + obj.N_pilot;
                    guard = (obj.Nfft - M + 1) / 2;
                else
                    obj.N_pilot = 1620/OFDM.Step + 1;
                    M = 1620 + obj.N_pilot;
                    guard = (obj.Nfft - M + 1) / 2;
                end

                pilotPos = 1:obj.pilot_spacing:M;
                avail = (guard+1):(obj.Nfft-guard+1);
                obj.pilotIdx = avail(pilotPos);
                obj.dataIdx = avail;
                obj.dataIdx(pilotPos) = [];

                bitPilot = randi([0 1], log2(obj.M_pilot)*obj.N_pilot, ...
                    obj.N_OFDM_sym);
                obj.ModPilots = pskmod(bitPilot, obj.M_pilot, 0, "gray", ...
                    'InputType', 'bit');

        end
        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % Здесь должна быть процедура формирования сигнала
            sig = zeros(obj.Nfft, obj.N_OFDM_sym);
            
            data = reshape(InData, [length(obj.dataIdx), obj.N_OFDM_sym]);

            sig(obj.dataIdx, :) = data;
            sig(obj.pilotIdx, :) = obj.ModPilots;
            
            OFDM_Sig_Tx = ifft(sig);
            
            cp_sig = [OFDM_Sig_Tx(end-obj.CP+1:end, :); OFDM_Sig_Tx];

            OutData = cp_sig(:);
        end
        function OutData = StepRx(obj, InData, InstChannelParams)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % Здесь должна быть процедура, обратная поцедуре формирования
            % сигнала

            SigRx_reshaped = reshape(InData, [(obj.Nfft + obj.CP), obj.N_OFDM_sym]);

            delete_cp = SigRx_reshaped(obj.CP+1:end, :);
            OFDM_Sig_Rx = fft(delete_cp);

            if obj.isEQ
                eq_sig_rx = OFDM_Sig_Rx(obj.dataIdx, :);
            else

                % канальная оценка по пилотам
                H_est_pilot = OFDM_Sig_Rx(obj.pilotIdx, :) ./ obj.ModPilots;

                % интерполяция на все поднесущие
                H_est = interp1(obj.pilotIdx, H_est_pilot, 1:obj.Nfft, obj.InterpMethod);

                if strcmp(obj.TypeEQ, 'ZF')
                    % применение эквалайзера Zero Forcing
                    eq_sig_rx = OFDM_Sig_Rx ./ H_est; 
                    
                elseif strcmp(obj.TypeEQ, 'MMSE')
                    eq_sig_rx = (conj(H_est) ./ (abs(H_est).^2 + ...
                        InstChannelParams.Variance)) .* OFDM_Sig_Rx;

                elseif strcmp(obj.TypeEQ, 'PS') % perfect score идеальная оценка
                    ChanFilters = InstChannelParams.info_chan.ChannelFilterCoefficients;
                    OfdmEstBeginIdx = obj.Nfft/2;      % середина символа
                    OfdmEstStep = obj.Nfft + obj.CP;    % шаг между символами
                    
                    PathGains_mid = InstChannelParams.PathGains( ...
                        OfdmEstBeginIdx + 1 : OfdmEstStep : end, :);
                    
                    ImpResp = reshape(PathGains_mid.', ...
                        size(PathGains_mid, 2), 1, []) .* ChanFilters;

                    h_est = squeeze(sum(ImpResp, 1)) ;
            
                    Hf = fft(h_est, obj.Nfft, 1);   % частотная характеристика
                    
                    eq_sig_rx = OFDM_Sig_Rx ./ Hf;
                end
                
                eq_sig_rx = eq_sig_rx(obj.dataIdx, :);
            end

            OutData = eq_sig_rx(:);
        end
    end
end