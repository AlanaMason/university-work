% пояснение к функции 
% Входные параметры: 
% bpsData- степень модуляции данных; 
% bpsPilot- степень модуляции пилотов;
% nFFT- размер преобразования Фурье; 
% pilotStep- шаг по пилотам;
% nZerosLeft,nZerosRight- количество нулевых поднесущих слева и справа
% соответственно (если не нужно, просто передать нулями); 
% nCP- длина циклического префикса (если не нужен передать как ноль); 
% txData - вектор входных данных; 
% ChannelType- тип канала: '0'- АБГШ канал,'1'- канал с замираниями EPA,
% '2'-канал с замиранниями EVA,'3'- канал с замираниями ETU; 
% EbNodB- сигнал/шум на энергию бита в ДБ 
% 
%Выходные параметры: 
% BER- количество битовых ошибок; 

function [BER, EbNodB] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT, pilotStep, nZerosLeft,...
    nZerosRight, nCP, nZeros, tOFDM, txData, ChannelType, maxDopplerShift, EbNoStart, EbNoStep, EbNoEnd)

    % РАСЧЕТ ДОПОЛНИТЕЛЬНЫХ ПАРАМЕТРОВ
    Md = 2^bpsData;
    Mp = 2^bpsPilot;
    EbNodB = EbNoStart:EbNoStep:EbNoEnd;
    nEbNo = size(EbNodB, 2);
   
    
    % РАСЧЕТ ИНДЕКСОВ
    idAllData = 1:nFFT;
    idZerosLeft = 1:(nZerosLeft);
    idZerosRight = (nFFT-nZerosRight+1):nFFT;
    idDc = nFFT/2+1;
    idZerosAll = unique([idZerosLeft, idZerosRight, idDc]);
    idAllData = setdiff(idAllData, idZerosAll);
    idPilot = unique([idAllData(1):pilotStep:idAllData(end), idAllData(end)]) ;
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
        txData = txData(:);
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
    resors(idData, :) = txSigDataReshape;
    resors(idPilot, :) = txSigPilotReshape;

    % ОБРАТНОЕ ПРЕОБРАЗОВАНИЕ ФУРЬЕ
    ofdmTimeGrid = ifft(resors, nFFT, 1); % по столбцам

    % ДОБАВЛЕНИЕ ЗАЩИТНОГО ИНТЕРВАЛА 
    switch nCP
        case 0
            switch nZeros
                case 0
                    txSignal = reshape(ofdmTimeGrid, [], 1);
                otherwise
                   addedZeros = zeros(nFFT+nZeros, nOfdmSymbols);
                   addedZeros(nZeros+1:end, :) = ofdmTimeGrid;
                   txSignal = reshape(addedZeros, [], 1);
            end
        otherwise
            addedCP = zeros(nFFT+nCP, nOfdmSymbols);
            for i = 1:nOfdmSymbols
                symbol = ofdmTimeGrid(:, i);
                cp = symbol(end-nCP+1:end);
                addedCP(:, i) = [cp;symbol];
            end
            txSignal = reshape(addedCP, [], 1);

    end
    % КАНАЛ
    switch ChannelType 
        case 1 %'EPA'
          
             pathDelays = [0 30 70 90 110 190 410]*1e-9;
             avgPathGaindB = [0 -1 -2 -3 -8 -17.2 -20.8];
             Fs = (nFFT)/tOFDM; 
            % РЕЛЕЕВСКИЙ КАНАЛnoise
             rayleighChan = comm.RayleighChannel( ...
                'SampleRate', Fs, ...
                'PathDelays', pathDelays, ...
                'AveragePathGains', avgPathGaindB, ...
                'MaximumDopplerShift', maxDopplerShift, ...
                'DopplerSpectrum', doppler('Jakes'),...
                'PathGainsOutputPort', true);
            % Белый шум
            txSigPower = mean(abs(txSignal).^2);
            rxSignal = zeros(nEbNo, size(txSignal,1));
            for j = 1:nEbNo
                EsNodB = EbNodB(j) + 10*log10(bpsData);
                EsNo = 10.^(EsNodB./10);
                noiseVar = sqrt(txSigPower./(EsNo.*2));
                noise = noiseVar*(randn(size(txSignal)) + 1j*randn(size(txSignal)));
                rxSignal(j, :) = (rayleighChan(txSignal) + noise).';
            end

        case 2 %'EVA'
             pathDelays = [0 30 150 310 370 710 1090 1730 2510]*1e-9;
             avgPathGaindB = [0 -1.5 -1.4 -3.6 -0.6 -9.1 -7 -12 -16.9];
             Fs = (nFFT)/tOFDM; 
            %Релеевский канал
             rayleighChan = comm.RayleighChannel( ...
                'SampleRate', Fs, ...
                'PathDelays', pathDelays, ...
                'AveragePathGains', avgPathGaindB, ...
                'MaximumDopplerShift', maxDopplerShift, ...
                'DopplerSpectrum', doppler('Jakes'),...
                'PathGainsOutputPort', true);
             
            % Белый шум
            txSigPower = mean(abs(txSignal).^2);
            rxSignal = zeros(nEbNo,size(txSignal,1));
            for j = 1:nEbNo
                EsNodB = EbNodB(j) + 10*log10(bpsData);
                EsNo = 10.^(EsNodB./10);
                noiseVar = sqrt(txSigPower./(EsNo.*2));
                noise = noiseVar*(randn(size(txSignal)) + 1j*randn(size(txSignal)));
                rxSignal(j, :) = (rayleighChan(txSignal) + noise).';
            end

        case 3 %'ETU'
             pathDelays = [0 50 120 200 230 500 1600 2300 5000]*1e-9;
             avgPathGaindB = [-1 -1 -1 0 0 0 -3 -5 -7];
             Fs = (nFFT)/tOFDM; 
            %Релеевский канал
             rayleighChan = comm.RayleighChannel( ...
                'SampleRate', Fs, ...
                'PathDelays', pathDelays, ...
                'AveragePathGains', avgPathGaindB, ...
                'MaximumDopplerShift', maxDopplerShift, ...
                'DopplerSpectrum', doppler('Jakes'),...
                'PathGainsOutputPort', true);
            % Белый шум
            txSigPower = mean(abs(txSignal).^2);
            rxSignal = zeros(nEbNo, size(txSignal,1));
            for j = 1:nEbNo
                EsNodB = EbNodB(j) + 10*log10(bpsData);
                EsNo = 10.^(EsNodB./10);
                noiseVar = sqrt(txSigPower./(EsNo.*2));
                noise = noiseVar*(randn(size(txSignal)) + 1j*randn(size(txSignal)));
                rxSignal(j, :) = (rayleighChan(txSignal) + noise).';
            end

        otherwise %AWGN - 0   
            txSigPower = mean(abs(txSignal).^2);
            rxSignal = zeros(nEbNo, size(txSignal, 1));
            for j = 1:nEbNo
                EsNodB = EbNodB(j) + 10*log10(bpsData);
                EsNo = 10.^(EsNodB./10);
                noiseVar = sqrt(txSigPower./(EsNo.*2));
                noise = noiseVar*(randn(size(txSignal)) + 1j*randn(size(txSignal)));
                rxSignal(j, :) = (txSignal + noise).';
            end

    end
 % Приемник
    switch nCP   % 
        case 0
            switch nZeros
                case 0
                    rxSignalBeforeFFT = reshape(rxSignal.', nFFT+nCP, nOfdmSymbols, nEbNo);
                    rxSignalWithoutCP = rxSignalBeforeFFT(nCP+1:end, :, :);
                otherwise
                    rxSignalBeforeFFT = reshape(rxSignal.', nFFT+nZeros, nOfdmSymbols, nEbNo);
                    rxSignalWithoutCP = rxSignalBeforeFFT(nZeros+1:end, :, :);
            end
        otherwise
            rxSignalBeforeFFT = reshape(rxSignal.', nFFT+nCP, nOfdmSymbols, nEbNo);
            rxSignalWithoutCP = rxSignalBeforeFFT(nCP+1:end, :, :);
    end
% Преобразование Фурье
    rxSignalFFT = fft(rxSignalWithoutCP, nFFT, 1);
% Эквалайзер
    switch ChannelType
            case 0 % Случай канала с белым шумом
                rxEqualizedData = rxSignalFFT(idData, :, :);
    
            otherwise % В случае канала с замираниями добавим эквалайзинг 
                % По пилотам найдем передаточную характеристику кнала
                rxPilot = rxSignalFFT(idPilot, :, :);
                txPilot3 = repmat(txSigPilotReshape, 1, 1, nEbNo);
                hPilot = rxPilot ./ txPilot3;
                hPilot2 = reshape(hPilot, nPilot, []);
                hChannel2 = interp1(idPilot, hPilot2, 1:nFFT, 'linear', 'extrap');
                hChannel = reshape(hChannel2, nFFT, nOfdmSymbols, nEbNo);

                % Сам эквалайзер
                rxEqualized = rxSignalFFT ./ hChannel;
                rxEqualizedData = rxEqualized(idData, :, :);
    end
% Демодуляция
    rxBitsVec = rxEqualizedData(:); % тут только данные, без пилотов, 
    rxBits = qamdemod(rxBitsVec, Md, 'OutputType', 'bit', 'UnitAveragePower', true);
    rxBitsAll = rxBits.';
    rxBits = reshape(rxBitsAll.', nOfdmSymbols*nBitsPerOFDM, nEbNo);
    rxBitsCut = rxBits(1:nInBits, :);
% БЕР
    txDataMat = repmat(txData(1:nInBits), 1, nEbNo);
    numBitErrors = sum(rxBitsCut ~= txDataMat, 1);
    BER = numBitErrors./ nInBits;
end