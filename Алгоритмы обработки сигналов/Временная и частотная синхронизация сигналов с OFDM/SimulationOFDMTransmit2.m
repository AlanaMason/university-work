function [BER,EbNodB, ACF_1]=SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
     nCP, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum, Equalizer, txData, EbNoStart, EbNoStep, EbNoEnd)

    % РАСЧЕТ ДОПОЛНИТЕЛЬНЫХ ПАРАМЕТРОВ
    Md = 2^bpsData;
    Mp = 2^bpsPilot;
    EbNodB = EbNoStart:EbNoStep:EbNoEnd;
    nEbNo = size(EbNodB,2);
    nAverages = 70;
    
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
    txSignal1=reshape(addedCP, [], 1);
    BERAverageAll=zeros(nEbNo, nAverages);
    
   switch SyncType % тип синхронизации 
        case 'Time'       % синхронизация по времени
           switch AlgType
               case 1       % временная синхронизация по циклическому префиксу
                    txSignal=[zeros(ShiftSymNum,1);txSignal1(1:(end-ShiftSymNum))];
                    rxSignal1=zeros(size(txSignal,1), 1);
                    for j=1:nEbNo
                        for R=1:nAverages
                            EbNo_lin = 10^(EbNodB(j)/10);
                            Eb = 1/(nFFT *log2(Md));
                            N0 = Eb / EbNo_lin;
                            sigma2 = N0/2;
                            noiseMC = sqrt(sigma2) * ( randn(size(txSignal)) + 1j*randn(size(txSignal)) );
                            rxSignal1 = txSignal + noiseMC;
                            if (AKF == 1)           %расчет АКФ для вывода     
                                maxSymbols = min(SymbolNum, floor(length(rxSignal1)/(nFFT+nCP)));
                                if maxSymbols < 1
                                    maxSymbols = 1; 
                                end
                                ACF = zeros(maxSymbols, nFFT);
                                for n = 1:SymbolNum
                                    for d = 1:nFFT-1
                                        idx1 = (nFFT + nCP) * (n - 1) + (1:nCP) + d;
                                        idx2 = (nFFT + nCP) * (n - 1) + (nFFT+1:nFFT+nCP) + d;
                                        if idx2(end) > length(rxSignal1)
                                            break;
                                        end
                                        ACF(n,d) = sum(conj(rxSignal1(idx1)) .* rxSignal1(idx2));
                                    end
                                end
                                ACF_1 = abs(sum(ACF(1:maxSymbols,:),1));
                                [~, idMax] = max(ACF_1);
                                idStart = idMax + 1;
                                rxFull = rxSignal1(idStart:end);
                                numsym = floor(length(rxFull)/(nFFT+nCP));
                                rxFullTrim = rxFull(1:numsym*(nFFT+nCP));
                                rxSignalBeforeFFT = reshape(rxFullTrim, nFFT+nCP, numsym);
                            else
                                rxSignalBeforeFFT=reshape(rxSignal1, nFFT+nCP, nOfdmSymbols);
                                ACF_1 = 0;
                            end
                        
                            rxSignalWithoutCP = rxSignalBeforeFFT(nCP+1:end, :);
                    % ПРЕОБРАЗОВАНИЕ ФУРЬЕ
                            rxSignalFFT=fft(rxSignalWithoutCP,nFFT,1);
                    % ЭКВАЛАЙЗЕР
                            if (Equalizer==1)
                                rxPilot = rxSignalFFT(idPilot, :);
                                rxDataa= rxSignalFFT(idData, :);
                                txPilots = txSigPilotReshape(:, 1:size(rxPilot, 2));
                                hPilot = rxPilot ./ txPilots;
                                hChan = zeros(nFFT, size(rxPilot,2));
                                for symIdx = 1:size(rxPilot,2)
                                    hChan(:, symIdx) = interp1(idPilot, hPilot(:, symIdx), 1:nFFT, 'linear');
                                end
                                hChan = hChan(idData, :);
                                rxSignalFFT1 = (conj(hChan) ./ (abs(hChan).^2 + sigma2)) .* rxDataa; 
                                rxBitsVec = rxSignalFFT1;
                            else
                                rxBitsVec=rxSignalFFT(idData , :); 
                                rxBitsVec = rxBitsVec(:);
                            end
    
                            % ДЕМОДУЛЯЦИЯ
                            rxBits = qamdemod(rxBitsVec, Md, 'OutputType','bit','UnitAveragePower',true);
                            if (AKF == 1)
                                rxBitsCut=rxBits(1:numsym*nBitsPerOFDM);
                            % БЕР
                                txDataMat=txData(1:numsym*nBitsPerOFDM);
                                numBitErrors = sum(rxBitsCut ~= txDataMat,1);
                                BERAverageAll(j, R) = numBitErrors./ (numsym*nBitsPerOFDM);
                            else
                                rxBits=reshape(rxBits,nOfdmSymbols*nBitsPerOFDM, 1); 
                                rxBitsCut=rxBits(1:nInBits);
                            % БЕР
                                txDataMat=txData(1:nInBits);
                                numBitErrors = sum(rxBitsCut ~= txDataMat,1);
                                BERAverageAll(j, R) = numBitErrors./ nInBits;
                            end
                        end
                    end
               otherwise %Алгоритм Мина в функции SimulationOFDMTimeOffset

           end

       case 'Frec'      % Синхронизация по частоте
           ACF_1 = 0;
           switch AlgType
               case 1
                % ДОБАВЛЕНИЕ СДВИГА
                    txSignal = txSignal1 .* exp(1j*2*pi.*(0:length(txSignal1)-1).'/nFFT*ShiftSymNum);
                    rxSignal1=zeros(size(txSignal,1), 1);
                    for j=1:nEbNo
                        for R=1:nAverages
                            EbNo_lin = 10^(EbNodB(j)/10);
                            Eb = 1/(nFFT *log2(Md));
                            N0 = Eb / EbNo_lin;
                            sigma2 = N0/2;
                            noiseMC = sqrt(sigma2) * ( randn(size(txSignal)) + 1j*randn(size(txSignal)) );

                            rxSignal1 = txSignal + noiseMC;
                            rxSignalShifted=reshape(rxSignal1, nFFT+nCP, nOfdmSymbols);
                            rxSymbolsForSync = rxSignalShifted(:,1:SymbolNum);
                            
                            CPSymbols = rxSymbolsForSync(1:nCP, :);
                            CPSymbols = CPSymbols(:);
                            endSymbol = rxSymbolsForSync((nFFT+1):end, :);
                            endSymbol = endSymbol(:);
                            
                            C = sum(conj(CPSymbols).*endSymbol);
                            
                            offset = angle(C)/(2*pi);
                            rxSignal1 = rxSignal1 .* exp(-1j *2*pi* (0:length(rxSignal1)-1) * offset/nFFT).';
                            rxSignalBeforeFFT = reshape(rxSignal1, nFFT+nCP, nOfdmSymbols);

                            rxSignalWithoutCP = rxSignalBeforeFFT(nCP+1:end, :);
                    % Преобразование Фурье
                            rxSignalFFT=fft(rxSignalWithoutCP,nFFT,1);
                    % ЭКВАЛАЙЗЕР
                            if (Equalizer==1)
                                 Equalized = zeros(size(rxSignalFFT));
                                for k = 1:nOfdmSymbols
                                    rxPilotData = rxSignalFFT(idPilot, k);
                                    txPilotData = txSigPilot((k-1)*length(idPilot)+1 : k*length(idPilot));
                                    hPilot = rxPilotData ./ txPilotData;
                                    hChan = interp1(idPilot, hPilot, 1:nFFT, 'makima', 'extrap').';
                                    Equalized(:, k) = (conj(hChan) ./ (abs(hChan).^2 + sigma2)) .* rxSignalFFT(:, k);
                                end
                                    rxBitsVec = Equalized(idData , :);
                            else
                                rxBitsVec=rxSignalFFT(idData , :); % тут только данные, без пилотов, 
                            end

                    % ДЕМОДУЛЯЦИЯ
                            rxBitsVec = rxBitsVec(:);
                            rxBits = qamdemod(rxBitsVec, Md, 'OutputType','bit','UnitAveragePower',true);
                            rxBits=reshape(rxBits,nOfdmSymbols*nBitsPerOFDM, 1); 
                            rxBitsCut=rxBits(1:nInBits);
                    % БЕР
                            txDataMat=txData(1:nInBits);
                            numBitErrors = sum(rxBitsCut ~= txDataMat,1);
                            BERAverageAll(j, R) = numBitErrors./ nInBits;
                          
                       end
                        
                    end
               otherwise %0
                    A = txSignal1(1:nFFT/4);

                    ASigTx = [A; A; -A; -A; txSignal1(nFFT+nCP+1:end)];
                    vec = (0:length(ASigTx)-1).';
                    txSignal = ASigTx .* exp(1j*2*pi.*vec/nFFT*ShiftSymNum);
                    rxSignal1=zeros(size(txSignal,1), 1);
                    for j=1:nEbNo
                        for T=1:nAverages
                            Eb = 1/(nFFT *log2(Md));
                            linSNR = 10^(EbNodB(j)/10);
                            N0 = Eb / linSNR;
                            sigma2 = N0 / 2;
                            noise = sqrt(sigma2) * (randn(size(txSignal)) + 1j*randn(size(txSignal)));
                            rxSignal1 = txSignal + noise;
                        
                            P = sum( conj( rxSignal1( 1:nFFT/4 )) .* rxSignal1( nFFT/4 + ( 1:nFFT/4 ) ) );
                            eps = angle(P) * 4;
                            rxSignalCorr = rxSignal1 .* exp(-1j.*vec*eps/nFFT);
                            
                            rxSignalCorr = rxSignalCorr(1+nFFT:end);
                            rxSignal = reshape(rxSignalCorr, [nFFT + nCP, (nOfdmSymbols-1)]);

                            rxSignalWithoutCP = rxSignal(nCP+1:end, :);
                
                
                        % Преобразование Фурье
                            rxSignalFFT=fft(rxSignalWithoutCP,nFFT,1);
                        % СЮДА ДОБАВИТЬ Эквалайзер
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
                                rxSignalFFT1 = (conj(hChan) ./ (abs(hChan).^2 + sigma2)) .* rxDataa;
                                rxBitsVec = rxSignalFFT1;
                         
                            else
                                rxBitsVec1 = rxSignalFFT(idData , :); 
                                rxBitsVec = rxBitsVec1(:);
                            end
                                
                            % Демодуляция
                               rxBits = qamdemod(rxBitsVec, Md, 'OutputType','bit','UnitAveragePower',true);
                               rxBitsCut = rxBits(1:(nBitsPerOFDM*(nOfdmSymbols-1)));
                            % БЕР
                               txDataMat=txData((nBitsPerOFDM+1):(nBitsPerOFDM*(nOfdmSymbols)));
                               numBitErrors = sum(rxBitsCut ~= txDataMat,1);
                               BERAverageAll(j, T) = numBitErrors/(nBitsPerOFDM*(nOfdmSymbols-1));
                        end
                    end
            end
   end
    BER=mean(BERAverageAll, 2);
end