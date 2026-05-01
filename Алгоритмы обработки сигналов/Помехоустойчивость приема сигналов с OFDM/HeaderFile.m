%% Общие входные данные
clear
bpsData = 4;       
bpsPilot=2;
nFFT = 2048;
tOFDM = 100e-6;
txData = randi([0 1],10e4,1);

EbNoStartEPA = 5;
EbNoStepEPA = 1;
EbNoEndEPA = 30;

EbNoStartEVA = 10;
EbNoStepEVA = 1;
EbNoEndEVA = 40;

EbNoStartETU = 30;
EbNoStepETU = 1;
EbNoEndETU = 50;

EbNoStartAWGN = 5;
EbNoStepAWGN = 1;
EbNoEndAWGN = 20;


%% 1.Помехоустойчивость приема сигналов с OFDM в канале с АБГШ для разного количества информационных поднесущих 
pilotStep = 10;
nZerosLeft = 0;
nZerosRight = 0;
nCP = 0;

nFFT1 = 512;
nFFT2 = 1024;
nFFT3 = 2048;

[BER_nFFT1, EbNodB_nFFT1] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT1, pilotStep,...
        nZerosLeft, nZerosRight, nCP, 0, tOFDM, txData, 0, 0, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);

[BER_nFFT2,EbNodB_nFFT2] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT2, pilotStep,...
        nZerosLeft, nZerosRight, nCP, 0, tOFDM, txData, 0, 0, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);

[BER_nFFT3,EbNodB_nFFT3] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT3, pilotStep,...
        nZerosLeft, nZerosRight, nCP, 0, tOFDM, txData, 0, 0, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);

figure(1)
grid on;
semilogy(EbNodB_nFFT1, BER_nFFT1); hold on;
semilogy(EbNodB_nFFT2, BER_nFFT2);
semilogy(EbNodB_nFFT3, BER_nFFT3);
semilogy(EbNodB_nFFT1, berawgn(EbNodB_nFFT1, 'qam', 16));
ylim([10e-5, 1]);
title('Канал АБГШ для разного количества информационных поднесущих');
legend('AWGN nFFT-512', 'AWGN nFFT-1024', 'AWGN nFFT-2048', 'AWGN 16-QAM', 'Location', 'best');


%% 2.1 Помехоустойчивость приема сигналов с OFDM в канале с замираниями EPA CHANNEL
% (максимальный допплеровский сдвиг 0 Гц) при использовании эквалайзера на приеме без защитного
% интервала по времени для разного шага пилотных поднесущих 
pilotStep1 = 2;
pilotStep2 = 50;
pilotStep3 = 100;
nZerosLeft = 300;
nZerosRight = 308;
nCP = 0;

[BER_EPA1, EbNodB_EPA1] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT, pilotStep1,...
    nZerosLeft, nZerosRight, nCP, 0, tOFDM, txData, 1, 0, EbNoStartEPA, EbNoStepEPA, EbNoEndEPA);

[BER_EPA2, EbNodB_EPA2] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT, pilotStep2,...
    nZerosLeft, nZerosRight, nCP, 0, tOFDM, txData, 1, 0, EbNoStartEPA, EbNoStepEPA, EbNoEndEPA);

[BER_EPA3, EbNodB_EPA3] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT, pilotStep3,...
    nZerosLeft, nZerosRight, nCP, 0, tOFDM, txData, 1, 0, EbNoStartEPA, EbNoStepEPA, EbNoEndEPA);

figure(2)

semilogy(EbNodB_EPA1, BER_EPA1); hold on;
semilogy(EbNodB_EPA3, BER_EPA3);
semilogy(EbNodB_EPA2, BER_EPA2);
semilogy(EbNodB_EPA1, berawgn(EbNodB_EPA1, 'qam', 16));
ylim([10e-5, 1]);
title('EPA канал для разного шага пилотных поднесущих');
legend('EPA PilotStep-2', 'EPA PilotStep-50', 'EPA PilotStep-100', 'AWGN 16-QAM', 'Location', 'best');
grid on;
%% 2.2 EVA CHANNEL
pilotStep1 = 2;
pilotStep2 = 20;
pilotStep3 = 100;
nZerosLeft = 0;
nZerosRight = 0;
nCP = round(1/4*nFFT);

[BER_EVA1, EbNodB_EVA1] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT, pilotStep1,...
    nZerosLeft, nZerosRight, nCP, 0, tOFDM, txData, 2, 0, EbNoStartEVA, EbNoStepEVA, EbNoEndEVA);

[BER_EVA2, EbNodB_EVA2] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT, pilotStep2,...
    nZerosLeft, nZerosRight, nCP, 0, tOFDM, txData, 2, 0, EbNoStartEVA, EbNoStepEVA, EbNoEndEVA);

[BER_EVA3, EbNodB_EVA3] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT, pilotStep3,...
    nZerosLeft, nZerosRight, nCP, 0, tOFDM, txData, 2, 0, EbNoStartEVA, EbNoStepEVA, EbNoEndEVA);
figure(2)
semilogy(EbNodB_EVA1, BER_EVA1); hold on;
semilogy(EbNodB_EVA3, BER_EVA3);
semilogy(EbNodB_EVA2, BER_EVA2);
semilogy(EbNodB_EVA1, berawgn(EbNodB_EVA1, 'qam', 16));
ylim([10e-5, 1]);



%% 2.3 ETU CHANNEL
pilotStep1 = 2;
pilotStep2 = 50;
pilotStep3 = 100;
nZerosLeft = 0;
nZerosRight = 0;
nCP = round(1/4*nFFT);

[BER_ETU1, EbNodB_ETU1] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT, pilotStep1,...
    nZerosLeft, nZerosRight, nCP, 0, tOFDM, txData, 3, 0, EbNoStartETU, EbNoStepETU, EbNoEndETU);

[BER_ETU2, EbNodB_ETU2] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT, pilotStep2,...
    nZerosLeft, nZerosRight, nCP, 0, tOFDM, txData, 3, 0, EbNoStartETU, EbNoStepETU, EbNoEndETU);

[BER_ETU3, EbNodB_ETU3] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT, pilotStep3,...
    nZerosLeft, nZerosRight, nCP, 0, tOFDM, txData, 3, 0, EbNoStartETU, EbNoStepETU, EbNoEndETU);
figure(3)
semilogy(EbNodB_ETU1, BER_ETU1); hold on;
semilogy(EbNodB_ETU2, BER_ETU2);
semilogy(EbNodB_ETU3, BER_ETU3);
semilogy(EbNodB_ETU1, berawgn(EbNodB_ETU1, 'qam', 16));
ylim([10e-5, 1]);
%% 3. Помехоустойчивость приема сигналов с OFDM в канале с замираниями 
% (максимальный допплеровский сдвиг 0 Гц) при использовании эквалайзера на приеме для разных защитных
% интервалов по времени (заполнение нулями и циклический префикс)

pilotStep = 30;

nZerosLeft1 = 0;
nZerosRight1 = 0;
nZeros1 = 0;
nCP1 = round(1/7*nFFT);
nZerosLeft2 = 300;
nZerosRight2 = 320;
nZeros2 = round(1/7*nFFT);
nCP2 = 0;


[BER_EVACP, EbNodB_EVACP] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT, pilotStep,...
    nZerosLeft1, nZerosRight1, nCP1, nZeros1, tOFDM, txData, 1, 0, EbNoStartEPA, EbNoStepEPA, EbNoEndEPA);

[BER_EVAZeros, EbNodB_EVAZeros] = SimulationOFDMTransmit(bpsData, bpsPilot, nFFT, pilotStep,...
    nZerosLeft2, nZerosRight2, nCP2,nZeros2, tOFDM, txData, 1, 0, EbNoStartEPA, EbNoStepEPA, EbNoEndEPA);
figure(3)
semilogy(EbNodB_EVACP, BER_EVACP); hold on;
semilogy(EbNodB_EVAZeros, BER_EVAZeros);
semilogy(EbNodB_EVACP, berawgn(EbNodB_EVACP, 'qam', 16));
ylim([10e-5,1]);
title('EPA канал для разных защитных интервалов по времени');
legend('EPA CP', 'EPA Zeros', 'AWGN 16-QAM', 'Location', 'best');
grid on;
%% 4. Помехоустойчивость приема сигналов с OFDM в канале с замираниями 
% (максимальный допплеровский сдвиг 0 Гц) при использовании эквалайзера на приеме для разных длин
% циклического префикса 

pilotStep = 30;
nZerosLeft = 0;
nZerosRight = 0;
nCP1 = round(1/10*nFFT);
nCP3 = round(1/227*nFFT);
nCP2 = round(1/100*nFFT);

[BER_EVACP1,EbNodB_EVACP1] = SimulationOFDMTransmit2(bpsData,bpsPilot,nFFT, pilotStep,...
    nZerosLeft, nZerosRight, nCP1,  tOFDM, txData, 1, 0, EbNoStartEPA, EbNoStepEPA, EbNoEndEPA);

[BER_EVACP2,EbNodB_EVACP2] = SimulationOFDMTransmit2(bpsData,bpsPilot,nFFT, pilotStep,...
    nZerosLeft, nZerosRight, nCP2,   tOFDM, txData, 1, 0, EbNoStartEPA, EbNoStepEPA, EbNoEndEPA);

[BER_EVACP3,EbNodB_EVACP3] = SimulationOFDMTransmit2(bpsData,bpsPilot,nFFT, pilotStep,...
    nZerosLeft, nZerosRight, nCP3,  tOFDM, txData, 1, 0, EbNoStartEPA, EbNoStepEPA, EbNoEndEPA);

figure(4)
semilogy(EbNodB_EVACP1,BER_EVACP1); hold on;
semilogy(EbNodB_EVACP2,BER_EVACP2);
semilogy(EbNodB_EVACP3,BER_EVACP3);
semilogy(EbNodB_EVACP1,berawgn(EbNodB_EVACP1,'qam',16));
ylim([10e-5,1]);
title('EPA канал для разной длины циклического префикса');
legend('EPA CP-1/10', 'EPA CP-1/7', 'EPA CP-1/4','AWGN 16-QAM', 'Location', 'best');
grid on;


%% 5. Помехоустойчивость приема сигналов с OFDM в канале с замираниями при
% использовании эквалайзера на приеме для разных значений максимального допплеровского
% сдвига при фиксированной длине циклического префикса 

pilotStep = 30;
nZerosLeft = 0;
nZerosRight = 0;
nCP = round(1/6*nFFT);
maxDopplerShift1 = 0;
maxDopplerShift2 = 25;
maxDopplerShift3 = 50;

[BER_EVADSH1,EbNodB_EVADSH1] = SimulationOFDMTransmit2(bpsData,bpsPilot,nFFT, pilotStep,...
    nZerosLeft, nZerosRight, nCP, tOFDM, txData, 1, maxDopplerShift1, EbNoStartEPA, EbNoStepEPA, EbNoEndEPA);

[BER_EVADSH2,EbNodB_EVADSH2] = SimulationOFDMTransmit2(bpsData,bpsPilot,nFFT, pilotStep,...
    nZerosLeft, nZerosRight, nCP, tOFDM, txData, 1, maxDopplerShift2, EbNoStartEPA, EbNoStepEPA, EbNoEndEPA);

[BER_EVADSH3,EbNodB_EVADSH3] = SimulationOFDMTransmit2(bpsData,bpsPilot,nFFT, pilotStep,...
    nZerosLeft, nZerosRight, nCP, tOFDM, txData, 1, maxDopplerShift3, EbNoStartEPA, EbNoStepEPA, EbNoEndEPA);
figure(5)
semilogy(EbNodB_EVADSH1,BER_EVADSH1); hold on;
semilogy(EbNodB_EVADSH2,BER_EVADSH2);
semilogy(EbNodB_EVADSH3,BER_EVADSH3);
%semilogy(EbNodB_EVADSH1,berawgn(EbNodB_EVADSH1,'qam',16));
ylim([10e-5,1]);
title('EPA канал для разного доплеровского сдвига');
legend('EPA Dopler-0', 'EPA Dopler-25', 'EPA Dopler-50', 'Location', 'best');
grid on;