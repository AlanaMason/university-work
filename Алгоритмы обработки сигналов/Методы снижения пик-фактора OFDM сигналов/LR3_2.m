%% 4. Влияние количества последовательностей, используемых в алгоритме SLM, на CCDF
%пик-фактора

clc; clear; 

Nfft = 2048;
Nsub = 1024;       
M = 16;                

U_list = [0, 4, 16, 128]; 
Nsym = 1000;           

Xgrid = 0:0.1:13;
CCDF = cell(length(U_list), 1);

InData = randi([0 1], log2(M)*Nsub*Nsym, 1);
ModData = qammod(InData, M, 'InputType', 'bit', 'UnitAveragePower', true);
GataGrid = reshape(ModData, Nsub, Nsym);

idxStart = Nfft/2 - Nsub/2 + 1;
idxActive = idxStart : (idxStart + Nsub - 1);

for k = 1:length(U_list)
    Ureq = U_list(k);
    if Ureq == 0
        Ueff = 1; desc = 'Без SLM (U=0)';
    else
        Ueff = Ureq; desc = sprintf('SLM (U=%d)', Ureq);
    end
    WinnerSig = zeros(Nfft * Nsym, 1);
    if Ueff > 100, tic; end
    for s = 1:Nsym
        Xcurr = GataGrid(:, s);
        if Ueff == 1
            P = ones(Nsub, 1);
        else
            P = randsrc(Nsub, Ueff, [1, -1]);
            P(:, 1) = 1; 
        end
        Candidates = repmat(Xcurr, 1, Ueff) .* P;
        Frame = zeros(Nfft, Ueff);
        Frame(idxActive, :) = Candidates;
        TxSignal = ifft(ifftshift(Frame, 1), Nfft, 1);
        Pwr = abs(TxSignal).^2;
        PeakVal = max(Pwr, [], 1);
        MeanVal = mean(Pwr, 1);
        PAPR = PeakVal ./ MeanVal;
        [~, idxBest] = min(PAPR);
        WinnerSig((s-1)*Nfft + 1 : s*Nfft) = TxSignal(:, idxBest);
    end
    if Ueff > 100, fprintf('(%.1f с) ', toc); end
    
    % CCDF
    PwrInst = abs(WinnerSig).^2;
    PwrMean = mean(PwrInst);
    PAPRdB = 10 * log10(PwrInst / PwrMean);
    [fCDF, Xval] = ecdf(PAPRdB);
    fCDFraw = 1 - fCDF;
    valid = isfinite(Xval);
    Xval = Xval(valid); fCDFraw = fCDFraw(valid);
    [Xu, idxU] = unique(Xval);
    fu = fCDFraw(idxU);
    CCDF{k} = interp1(Xu, fu, Xgrid, 'pchip', NaN);
end

figure('Name', 'SLM Analysis Muted Colors');
hold on; grid on;
plot_handles = [];
legend_str = {};

for k = 1:length(U_list)
    y_data = CCDF{k};
    mask = ~isnan(y_data) & (y_data > 0);
    if U_list(k) == 0
        lbl = 'Без SLM (Original)';
    else
        lbl = sprintf('SLM U=%d', U_list(k));
    end
    legend_str{end+1} = lbl; %#ok<AGROW>
    h = semilogy(Xgrid(mask), y_data(mask), ...
        'LineWidth', 2.0);
    plot_handles = [plot_handles; h]; %#ok<AGROW>
end

set(gca, 'YScale', 'log');
xlabel('PAPR (дБ)');
ylabel('Вероятность (CCDF)');
title('Эффективность SLM (Зависимость от U)');
xlim([0 12.5]);
ylim([1e-4 1]);
legend(plot_handles, legend_str, 'Location', 'southwest');
annotation('textbox', [0.65, 0.75, 0.2, 0.1], ...
    'String', {sprintf('N_{fft}=%d', Nfft), 'Фазы: \{0, \pi\}'}, ...
    'FitBoxToText', 'on', 'EdgeColor', [0.8 0.8 0.8]);


%% 5. Влияние количества блоков, используемых в алгоритме PTS, на CCDF пик-фактора


clc; clear; 

Nfft = 2048;
Nsub = 1024;           
M = 16;                 
Vlist = [1, 2, 4, 8]; 
Nsym = 1000;           

Xgrid = 0:0.1:13;
CCDF = cell(length(Vlist), 1);

InData = randi([0 1], log2(M)*Nsub*Nsym, 1);
ModData = qammod(InData, M, 'InputType', 'bit', 'UnitAveragePower', true);
DataGrid = reshape(ModData, Nsub, Nsym);

idxStart = Nfft/2 - Nsub/2 + 1;
idxActive = idxStart : (idxStart + Nsub - 1);

for k = 1:length(Vlist)
    V = Vlist(k);
    if V > 1
        NumCombs = 2^(V-1);
        Phase = ones(NumCombs, V);
        if V > 1
             TempCombs = 1 - 2 * ff2n(V-1); 
             Phase(:, 2:end) = TempCombs;
        end
    else
        Phase = 1;
    end
    WinnerSig = zeros(Nfft * Nsym, 1);
    
    for s = 1:Nsym
        Xcurr = DataGrid(:, s);
        SignalPart = zeros(Nfft, V);
        BlockSize = floor(Nsub / V);
        
        for v = 1:V
            if v < V
                idxSub = (v-1)*BlockSize + 1 : v*BlockSize;
            else
                idxSub = (v-1)*BlockSize + 1 : Nsub;
            end
            
            FrameTemp = zeros(Nfft, 1);
            idxFFT = idxActive(idxSub);
            FrameTemp(idxFFT) = Xcurr(idxSub);
            SignalPart(:, v) = ifft(ifftshift(FrameTemp, 1), Nfft, 1);
        end
        MinPapr = inf;
        BestSig = zeros(Nfft, 1);
        
        for c = 1:size(Phase, 1)
            b = Phase(c, :); 
            SigCand = SignalPart * b.';
            Pwr = abs(SigCand).^2;
            PeakVal = max(Pwr);
            MeanVal = mean(Pwr);
            CurrPapr = PeakVal / MeanVal;
            
            if CurrPapr < MinPapr
                MinPapr = CurrPapr;
                BestSig = SigCand;
            end
        end
        
        WinnerSig((s-1)*Nfft + 1 : s*Nfft) = BestSig;
    end
    PwrInst = abs(WinnerSig).^2;
    PwrMean = mean(PwrInst);
    PaprdB = 10 * log10(PwrInst / PwrMean);
    [fCDF, Xval] = ecdf(PaprdB);
    fCDFraw = 1 - fCDF;
    valid = isfinite(Xval);
    Xval = Xval(valid); fCDFraw = fCDFraw(valid);
    [xu, idxU] = unique(Xval);
    fu = fCDFraw(idxU);
    CCDF{k} = interp1(xu, fu, Xgrid, 'pchip', NaN);
end

figure('Name', 'PTS Analysis');
hold on; grid on;

plot_handles = [];
legend_str = {};

for k = 1:length(Vlist)
    y_data = CCDF{k};
    mask = ~isnan(y_data) & (y_data > 0);
    
    if Vlist(k) == 1
        lbl = 'Original (V=1)';
    else
        lbl = sprintf('PTS (V=%d)', Vlist(k));
    end
    legend_str{end+1} = lbl; %#ok<AGROW>
    
    % Линия
    h = semilogy(Xgrid(mask), y_data(mask), ...
        'LineWidth', 2.0);
    plot_handles = [plot_handles; h]; %#ok<AGROW>
    
    % Маркеры
    if k > 1
        idx = 1:8:length(Xgrid);
        idx = intersect(idx, find(mask));
        semilogy(Xgrid(idx), y_data(idx), 'LineStyle', 'none');
    end
end

grid minor; set(gca, 'YScale', 'log');
xlabel('PAPR (дБ)'); ylabel('CCDF (Вероятность)');
title('Эффективность PTS (Влияние количества блоков V)');
xlim([0 12]); ylim([1e-5 1]);

legend(plot_handles, legend_str, 'Location', 'southwest');

annotation('textbox', [0.6, 0.7, 0.25, 0.1], ...
    'String', {'Разбиение: Adjacent', 'Фазы: \{1, -1\}', sprintf('N_{fft}=%d', Nfft)}, ...
    'FitBoxToText', 'on');