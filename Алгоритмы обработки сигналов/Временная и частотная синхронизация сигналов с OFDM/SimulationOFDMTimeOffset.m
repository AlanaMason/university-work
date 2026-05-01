function [BER,AKF,EbNodB]=SimulationOFDMTimeOffset(bpsData, bpsPilot, nFFT, txData, pilotNum, nZeros, ...
     nCP, EbNoStart, EbNoStep, EbNoEnd, shift, Equalizer)

% РАСЧЕТ ДОПОЛНИТЕЛЬНЫХ ПАРАМЕТРОВ
    Md = 2^bpsData;
    Mp = 2^bpsPilot;
    EbNodB = EbNoStart:EbNoStep:EbNoEnd;
    nEbNo = size(EbNodB,2);
    nAverages = 20;
    
    % РАСЧЕТ ИНДЕКСОВ
    idAllData = 1:nFFT;
    idDc = nFFT/2+1;
    idAllData = setdiff(idAllData,idDc);
    if nZeros > 0
        idAllData = idAllData(nZeros+1:end-nZeros);
    end
    NumActive = length(idAllData);
    pilotStep = floor(NumActive / pilotNum);
    idPilotActive = unique([1:pilotStep:NumActive, NumActive(end)]);
    if length(idPilotActive) > pilotNum + 1
        idPilotActive = idPilotActive(1:pilotNum);
    end
    idPilot = idAllData(idPilotActive);
    idData = setdiff(idAllData, idPilot);
    
    % ПАДИНГ ВХОДНЫХ БИТ
    nInBits = length(txData); 
    nInformBits = length(idData); 
    nBitsPerOFDM = nInformBits*bpsData;
    nOfdmSymbols = ceil(nInBits / nBitsPerOFDM);
    padBits = nOfdmSymbols*nBitsPerOFDM - nInBits; 
    if padBits>0
        txData = [txData(:);zeros(padBits, 1)]; 
    else
        txData=txData(:);
    end
    
    % МОДУЛЯЦИЯ
    nPilot = length(idPilot);
    txPilot = randi([0 1], nPilot*bpsPilot*nOfdmSymbols, 1);    
    txSigData = qammod(txData, Md, 'InputType', 'bit', 'UnitAveragePower', true);
    txSigPilot = qammod(txPilot, Mp, 'InputType', 'bit', 'UnitAveragePower', true);   
    txSigDataReshape = reshape(txSigData, length(idData), nOfdmSymbols);
    txSigPilotReshape = reshape(txSigPilot, length(idPilot), nOfdmSymbols);

    % СБОР РЕСУРСНОЙ СЕТКИ
    resors = zeros(nFFT, nOfdmSymbols);
    resors(idData,:) = txSigDataReshape;
    resors(idPilot,:) = txSigPilotReshape;

    % ОБРАТНОЕ ПРЕОБРАЗОВАНИЕ ФУРЬЕ
    ofdmTimeGrid = ifft(resors, nFFT, 1); % по столбцам

    % ДОБАВЛЕНИЕ ЦИКЛИЧЕСКОГО ПРЕФИКСА
    addedCP = [ofdmTimeGrid(end-nCP+1:end, :); ofdmTimeGrid];
    txSignal1 = addedCP(:);
    BERAverageAll=zeros(nEbNo, nAverages);
    A = txSignal1(1:nFFT/4);
    SigTx_A = [A; A; -A; -A; txSignal1(nFFT+nCP+1:end)];
    txSignal = [zeros(shift, 1); SigTx_A];
    txSigPower = mean(abs(txSignal).^2);
    rxSignal1=zeros(size(txSignal,1), 1);
    for j=1:nEbNo
        for T=1:nAverages
            Eb = 1/(nFFT *log2(Md));
            SNR_linear = 10^(EbNodB(j)/10);
            N0 = Eb / SNR_linear;
            noise_var = N0 / 2;
            noise = sqrt(noise_var) * (randn(size(txSignal)) + 1j*randn(size(txSignal)));
            rxSignal1 = txSignal + noise;
            M = zeros(nFFT, 1);
            for d = 1:nFFT-1
                P = 0; R = 0;
                for m = 0:1
                    P = P + sum( conj( rxSignal1( nFFT/2*m + d + (0:nFFT/4-1) ) ) .* ...
                        rxSignal1( nFFT/2*m + nFFT/4 + d + (0:nFFT/4-1) ) );
                    R = R + sum( (abs( rxSignal1( nFFT/2*m + nFFT/4 + d + (0:nFFT/4-1) ) )).^2);
                end
                M(d) = ( ( abs(P) ).^2 ) ./ ( R.^2 );
            end
            [~, maxidx] = max(M);
            AKF = M;
            rx_not_shift = rxSignal1(maxidx:end);
            rx_not_shift_2 = rx_not_shift(nFFT+1:end);
            a = floor(length(rx_not_shift_2) / (nFFT + nCP) );
            rx_not_shift_1 = rx_not_shift_2(1:(nFFT + nCP)*a);
            SigRx_reshaped = reshape(rx_not_shift_1, [nFFT + nCP, a]);
            rxSignalWithoutCP = SigRx_reshaped(nCP+1:end, :);

        % Преобразование Фурье
            rxSignalFFT=fft(rxSignalWithoutCP,nFFT,1);
        % Эквалайзер
            if (Equalizer==1)
                rxPilot = rxSignalFFT(idPilot, :);
                rxDataa= rxSignalFFT(idData, :);
                txPilots = txSigPilotReshape(:, 2:(size(rxPilot, 2)+1));
                hPilot = rxPilot ./ txPilots;
                hChan = zeros(nFFT, size(rxPilot,2));
                for symIdx = 1:size(rxPilot,2)
                    hChan(:, symIdx) = interp1(idPilot, hPilot(:, symIdx), 1:nFFT, 'linear');
                end
                hChan = hChan(idData, :);
                noiseVar_freq = noise_var;
                denom = abs(hChan).^2 + noiseVar_freq;   
                rxSignalFFT1 = (conj(hChan) ./ denom) .* rxDataa;
                rxBitsVec1=rxSignalFFT1;
            end
                
            % Демодуляция
            rxBitsVec = rxBitsVec1(:);
            rxBits = qamdemod(rxBitsVec, Md, 'OutputType','bit','UnitAveragePower',true);
            rxBitsCut=rxBits(1:(nBitsPerOFDM*a));
            % БЕР
            txDataMat=txData((nBitsPerOFDM+1):(nBitsPerOFDM*(a+1)));
            numBitErrors = sum(rxBitsCut ~= txDataMat,1);
            BERAverageAll(j, T) = numBitErrors/(nBitsPerOFDM*a);
        end
    end      
    BER=mean(BERAverageAll, 2);
end

