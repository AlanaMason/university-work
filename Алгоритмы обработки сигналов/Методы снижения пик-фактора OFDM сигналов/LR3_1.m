%% 1. Зависимость CCDF пик-фактора от количества ненулевых поднесущих в OFDM сигнале
clc; clear; 
Nfft = 2048;                
M = 16;                    
Nsym = 500;               
PAPRdBGrid = 0:0.1:12;    
SubcarrierList = [64, 128, 256, 512, 1024]; 

CCDF = zeros(length(PAPRdBGrid), length(SubcarrierList));

for i = 1:length(SubcarrierList)
    SubCurrent = SubcarrierList(i);
    idxData = randi([0 M-1], SubCurrent, Nsym);
    ModSymbols = qammod(idxData, M, 'UnitAveragePower', true);
    FrameFreq = zeros(Nfft, Nsym);
    idxStart = Nfft/2 - SubCurrent/2 + 1;
    idxActive = idxStart : (idxStart + SubCurrent - 1); 
    FrameFreq(idxActive, :) = ModSymbols;
    TxSignal = ifft(ifftshift(FrameFreq, 1), Nfft, 1);
    Pwr = abs(TxSignal).^2;
    PwrMax = max(Pwr, [], 1);
    PwrMean = mean(Pwr, 1);
    PaprLin = PwrMax ./ PwrMean;
    PaprdB = 10 * log10(PaprLin);
    PaprSort = sort(PaprdB, 'descend');
    Prob = (1:Nsym) / Nsym;
    [PaprUnique, idxU] = unique(PaprSort);
    ProbUnique = Prob(idxU);
    CCDFCurve = interp1(PaprUnique, ProbUnique, PAPRdBGrid, 'linear', 0);
    CCDFCurve(PAPRdBGrid < min(PaprUnique)) = 1;
    CCDFCurve(isnan(CCDFCurve)) = 0;
    CCDF(:, i) = CCDFCurve;
end

figure('Name', 'Зависимость CCDF от N_sub');
semilogy(PAPRdBGrid, CCDF, 'LineWidth', 2);
grid on;
xlabel('PAPR_0, дБ');
ylabel('CCDF = Pr(PAPR > PAPR_0)');
title(['CCDF пик-фактора для разных N_{sub} (N_{fft}=' num2str(Nfft) ', 16-QAM)']);

legend_str = cell(length(SubcarrierList), 1);
for i = 1:length(SubcarrierList)
    legend_str{i} = sprintf('N_{sub} = %d', SubcarrierList(i));
end
legend(legend_str, 'Location', 'SouthWest');

xlim([0 12]);
ylim([1e-3 1]);

%% 2. Влияние уровня клиппирования сигнала на ССDF пик-фактора, энергетический спектр
% OFDM сигнала и помехоустойчивость приема
clc; clear; 

Nfft = 2048;
Nsub = 1024;           
M = 16;                
CP = 128;
CRdB = [8, 6, 4]; 

EbNodB = 0:2:18;
Nber = 3000;      

Nstat = 2000;  
InData = randi([0 1], log2(M)*Nsub*Nstat, 1);
ModData = qammod(InData, M, 'InputType', 'bit', 'UnitAveragePower', true);
DataFrame = zeros(Nfft, Nstat);

idxActive = Nfft/2 - Nsub/2 + 1 : Nfft/2 + Nsub/2;
DataFrame(idxActive, :) = reshape(ModData, Nsub, Nstat);

TxSignal = ifft(ifftshift(DataFrame, 1), Nfft, 1);
TxSignalVec = TxSignal(:);

sigma = std(TxSignalVec);

InDataRef = randi([0 1], log2(M)*Nsub*Nber, 1);
ModDataRef = qammod(InDataRef, M, 'InputType', 'bit', 'UnitAveragePower', true);
DataFrameRef = zeros(Nfft, Nber);
DataFrameRef(idxActive, :) = reshape(ModDataRef, Nsub, Nber);
TxSignalref = ifft(ifftshift(DataFrameRef, 1), Nfft, 1);

CCDF = cell(length(CRdB), 1);
PSD = cell(length(CRdB), 1);
BER = zeros(length(EbNodB), length(CRdB));

Xgrid = 0:0.1:14; 

for i = 1:length(CRdB)
    cr_val = CRdB(i);

    if isinf(cr_val)
        threshold = inf;
    else
        threshold = 10^(cr_val/20) * sigma;
    end
    SigProc = TxSignalVec;
    if ~isinf(threshold)
        mask = abs(SigProc) > threshold;
        SigProc(mask) = threshold .* (SigProc(mask) ./ abs(SigProc(mask)));
    end
    
 
    PwrInst = abs(SigProc).^2;
    PwrMean = mean(PwrInst);
    
    PaprdB = 10 * log10(PwrInst / PwrMean);
    [fCDF, Xval] = ecdf(PaprdB);
    fCCDF = 1 - fCDF;
    [xu, idxUnique] = unique(Xval);
    fu = fCCDF(idxUnique);
    ccdf_interp = interp1(xu, fu, Xgrid, 'pchip', NaN);
    CCDF{i} = ccdf_interp;
 
    [pxx, Freq] = pwelch(SigProc, hamming(2048), 1024, 2048, 1, 'centered');
    PSD{i} = [Freq, 10*log10(pxx)];
    
    SigBer = TxSignalref;
    if ~isinf(threshold)
        MaskBer = abs(SigBer) > threshold;
        SigBer(MaskBer) = threshold .* (SigBer(MaskBer) ./ abs(SigBer(MaskBer)));
    end

    SigBerCP = [SigBer(end-CP+1:end, :); SigBer];

    for k = 1:length(EbNodB)
 
        SNR = EbNodB(k) + 10*log10(log2(M)) + 10*log10(Nsub/Nfft);      
        RxSignal = awgn(SigBerCP, SNR, 'measured');       
        RxSignalNoCP = RxSignal(CP+1:end, :);
        RxSignalFFT = fft(RxSignalNoCP, Nfft, 1);
        RxSignalFFT = fftshift(RxSignalFFT, 1);     
        DemodSym = RxSignalFFT(idxActive, :);
        OutData = qamdemod(DemodSym(:), M, 'OutputType', 'bit', 'UnitAveragePower', true);
        
        [~, BER(k, i)] = biterr(InDataRef, OutData);
    end

end

figure('Name', 'PSD and CCDF Instantaneous');
plot(1); hold on; 
for i = 1:length(CRdB)
    plot(PSD{i}(:,1), PSD{i}(:,2), ...
        'LineWidth', 1.5, ...
        'DisplayName', get_leg(CRdB(i)));
end
xlabel('Нормированная частота'); ylabel('PSD (дБ/Гц)');
title('1. Энергетический спектр (PSD)');
ylim([-100 -10]); xlim([-0.5 0.5]);
legend('show', 'Location', 'south');
figure('Name', 'Мгновенная мощность');
plot(2); hold on; 
set(gca, 'YScale', 'log'); 

plot_handles = [];
for i = 1:length(CRdB)
    y_data = CCDF{i};
    mask_plot = ~isnan(y_data) & (y_data > 0);
    h = semilogy(Xgrid(mask_plot), y_data(mask_plot), ...
        'LineWidth', 2);
    plot_handles = [plot_handles; h]; %#ok<AGROW>
    
    semilogy(Xgrid, y_data, ...
        'LineStyle', 'none');
end
xlabel('PAPR (Мгновенный), дБ'); ylabel('Вероятность (CCDF)');
title('2. CCDF Мгновенной мощности');
xlim([0 12]); ylim([1e-3 1]);
legend(plot_handles, arrayfun(@(x) get_leg(x), CRdB, 'UniformOutput', false), 'Location', 'southwest');
grid minor;

figure('Name', 'BER Analysis');
semilogy(EbNodB, berawgn(EbNodB, 'qam', M), 'k--', 'LineWidth', 1.5, 'DisplayName', 'Theory');
hold on; 
for i = 1:length(CRdB)
    semilogy(EbNodB, BER(:, i), ...
        'LineWidth', 1.5, ...
        'DisplayName', get_leg(CRdB(i)));
end
xlabel('E_b / N_0 (дБ)'); ylabel('BER');
title('3. Помехоустойчивость (BER)');
ylim([1e-4 1]); xlim([0 18]);
legend('show', 'Location', 'southwest');

function s = get_leg(val)
    if isinf(val)
        s = 'No Clipping';
    else
        s = sprintf('CR = %d dB', val);
    end
end

%% 3. Влияние количества итераций при клиппировании с последующей фильтрацией на CCDF
% пик-фактора, энергетический спектр OFDM сигнала и помехоустойчивость приема
clc; clear; 

Nfft = 2048;
Nsub = 1024;         
M = 16;                
CP = 128;  
CRdB = 4;              
Iterations_list = [1, 3, 5];

Scenarios = [0, Iterations_list];

Xgrid = 0:0.1:12; 
EbNo_dB = 0:2:12;      

NsymStat = 1000;      
Nsym = 2000;
idxStart = Nfft/2 - Nsub/2 + 1;
idxActive = idxStart : (idxStart + Nsub - 1);
Filter = false(Nfft, 1);
Filter(idxActive) = true;

InData = randi([0 1], log2(M)*Nsub*NsymStat, 1);
ModData = qammod(InData, M, 'InputType', 'bit', 'UnitAveragePower', true);
DataFrame = zeros(Nfft, NsymStat);
DataFrame(idxActive, :) = reshape(ModData, Nsub, NsymStat);
DataFrameRaw = ifft(ifftshift(DataFrame, 1), Nfft, 1);

sigma = std(DataFrameRaw(:));
threshold = 10^(CRdB/20) * sigma;

InDataRef = randi([0 1], log2(M)*Nsub*Nsym, 1);
ModDataRef = qammod(InDataRef, M, 'InputType', 'bit', 'UnitAveragePower', true);
DataFrameRef = zeros(Nfft, Nsym);
DataFrameRef(idxActive, :) = reshape(ModDataRef, Nsub, Nsym);
DataFrameRefRaw = ifft(ifftshift(DataFrameRef, 1), Nfft, 1);

CCDF = {};
PSD = {};
BER = zeros(length(EbNo_dB), length(Scenarios));

for i = 1:length(Scenarios)
    n_iter = Scenarios(i);
    
    if n_iter == 0
        desc = 'Original (No Clip)';
        tx_proc = DataFrameRaw;
        tx_ber_proc = DataFrameRefRaw;
    else
        desc = sprintf('C&F %d Iterations', n_iter);
        
        current_sig = DataFrameRaw;
        for k = 1:n_iter
            mask = abs(current_sig) > threshold;
            current_sig(mask) = threshold .* (current_sig(mask) ./ abs(current_sig(mask)));
            spec = fft(current_sig, Nfft, 1);
            spec = fftshift(spec, 1);
            spec(~Filter, :) = 0; 
            current_sig = ifft(ifftshift(spec, 1), Nfft, 1);
        end
        tx_proc = current_sig;
        
        current_ber = DataFrameRefRaw;
        for k = 1:n_iter
            mask = abs(current_ber) > threshold;
            current_ber(mask) = threshold .* (current_ber(mask) ./ abs(current_ber(mask)));
            spec = fft(current_ber, Nfft, 1);
            spec = fftshift(spec, 1);
            spec(~Filter, :) = 0;
            current_ber = ifft(ifftshift(spec, 1), Nfft, 1);
        end
        tx_ber_proc = current_ber;
    end
    sig_vec = tx_proc(:);
    Pwr = abs(sig_vec).^2;
    PwrMean = mean(Pwr);
    PaprInst = 10*log10(Pwr/PwrMean);
    [f_cdf, Xval] = ecdf(PaprInst);
    [xu, idxU] = unique(Xval);
    fu = 1 - f_cdf(idxU);
    
    CCDF{i} = interp1(xu, fu, Xgrid, 'pchip', NaN);
    
 
    [pxx, f_freq] = pwelch(sig_vec, hamming(2048), 1024, 2048, 1, 'centered');
    PSD{i} = [f_freq, 10*log10(pxx)];
    sig_cp = [tx_ber_proc(end-CP+1:end, :); tx_ber_proc];
    for k = 1:length(EbNo_dB)
        snr_val = EbNo_dB(k) + 10*log10(log2(M)) + 10*log10(Nsub/Nfft);
        rx_sig = awgn(sig_cp, snr_val, 'measured');
        
        rx_no_cp = rx_sig(CP+1:end, :);
        rx_fft = fftshift(fft(rx_no_cp, Nfft, 1), 1);
        rx_syms = rx_fft(idxActive, :);
        rx_bits = qamdemod(rx_syms(:), M, 'OutputType', 'bit', 'UnitAveragePower', true);
        [~, BER(k, i)] = biterr(InDataRef, rx_bits);
    end

end

figure('Name', 'C&F 4dB Analysis');
plot(1); hold on; 
for i = 1:length(Scenarios)
    plot(PSD{i}(:,1), PSD{i}(:,2), ...
        'LineWidth', 1.5, ...
        'DisplayName', get_lbl(Scenarios(i)));
end
xlabel('Норм. частота'); ylabel('PSD (дБ/Гц)');
title(['1. Спектр (CR = ' num2str(CRdB) ' дБ)']);
legend('show', 'Location', 'south');
ylim([-100 -10]); xlim([-0.5 0.5]);

figure('Name', 'CCDF');
plot(2); hold on; set(gca, 'YScale', 'log');
for i = 1:length(Scenarios)
    y_data = CCDF{i};
    mask = ~isnan(y_data) & (y_data > 0);
    
    semilogy(Xgrid(mask), y_data(mask), ...
        'LineWidth', 2, ...
        'DisplayName', get_lbl(Scenarios(i)));
    semilogy(Xgrid, y_data, 'LineStyle', 'none');

end
xlabel('PAPR (дБ)'); ylabel('Вероятность (CCDF)');
title('2. Снижение PAPR (Итерации)');
xlim([0 12]); ylim([1e-4 1]);
legend('show', 'Location', 'southwest');

figure('Name', 'BER 4dB');
semilogy(EbNo_dB, berawgn(EbNo_dB, 'qam', M), 'k:', 'LineWidth', 1.5, 'DisplayName', 'Theory');
hold on; grid on;
for i = 1:length(Scenarios)
    semilogy(EbNo_dB, BER(:, i), ...
        'LineWidth', 1.5, 'DisplayName', get_lbl(Scenarios(i)));
end
xlabel('Eb/N0 (дБ)'); ylabel('BER');
title(['3. BER (CR = ' num2str(CRdB) ' дБ, Жесткое)']);
ylim([1e-4 1]);
legend('show', 'Location', 'southwest');

function s = get_lbl(n)
    if n==0, s='No Clip'; else, s=sprintf('%d Iterations', n); end
end