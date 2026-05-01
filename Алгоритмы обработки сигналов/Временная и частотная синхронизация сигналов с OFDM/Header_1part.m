%% 1.1. Помехоустойчивость приема сигналов с OFDM для разного значения временного сдвига
%при отсутствии временной синхронизаци
clear;
clc;
bpsData = 4;       
bpsPilot = 2;
nFFT = 2048;
pilotNum = 0;
nZeros = 200;
nCP = 0;
txData = randi([0 1], 10e4 ,1);

SyncType = 'Time';
AlgType = 1;
ShiftSymNum1 = 0;
ShiftSymNum2 = 5;
ShiftSymNum3 = 50;
SymbolNum = 0;
AKF = 0;
Equalizer = 0;

EbNoStartAWGN = 5;
EbNoStepAWGN = 1;
EbNoEndAWGN = 20;
EbNodB = EbNoStartAWGN:EbNoStepAWGN:EbNoEndAWGN;

[BER1_1, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
     nCP, SyncType, AlgType, ShiftSymNum1, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER2_1, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum2, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER3_1, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum3, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
figure(1)
semilogy(EbNodB,BER1_1,  'LineWidth', 2); hold on;
semilogy(EbNodB,BER2_1, 'LineWidth', 2);
semilogy(EbNodB,BER3_1, 'LineWidth', 2);
semilogy(EbNodB,berawgn(EbNodB,'qam',16), 'LineWidth', 2);
hold off;
ylim([10e-5,1]);
title('Временной сдвиг без синхронизации');
legend('Shift = 0', 'Shift = 5', 'Shift = 50','AWGN 16-QAM', 'Location', 'northeast', 'Fontsize', 14);
grid on;
%% 1.2. Вид автокорреляционной функции, на основе которой реализован алгоритм временной
%синхронизации по циклическому префиксу, в зависимости от количества символов,
%используемых для синхронизации
clear;
clc;
bpsData = 4;       
bpsPilot = 2;
nFFT = 2048;
pilotNum = 100;
nZeros = 100;
nCP = 10;
txData = randi([0 1], 10e4, 1);

SyncType = 'Time';
AlgType = 1;

ShiftSymNum = 1000;
SymbolNum1 = 0;
SymbolNum2 = 1;
SymbolNum3 = 5;
AKF = 1;
Equalizer = 0;

EbNoStartAWGN = 5;
EbNoStepAWGN = 1;
EbNoEndAWGN = 20;
EbNodB = EbNoStartAWGN:EbNoStepAWGN:EbNoEndAWGN;

[BER1_3, ~, AKF1_2] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
     nCP, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum1, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER2_3, ~, AKF2_2] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum2, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER3_3, ~, AKF3_2] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum3, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);

figure(2)
subplot (3, 1, 1);
plot (AKF1_2); 
title('Вид автокорреляционной функции');
subplot (3, 1, 2);
plot (AKF2_2);
subplot (3, 1, 3);
plot (AKF3_2);
%% 3. Помехоустойчивость приема сигналов с OFDM для разного количества символов,
%используемых при временной синхронизации по циклическому префиксу

figure(3)
semilogy(EbNodB, BER1_3, 'LineWidth', 2); hold on;
semilogy(EbNodB, BER2_3, 'LineWidth', 2);
semilogy(EbNodB, BER3_3, 'LineWidth', 2);
semilogy(EbNodB, berawgn(EbNodB,'qam',16), 'LineWidth', 2);
ylim([10e-5,1]);
title('Принятые сигналы для разного количества символов, использованных для синхронизации');
legend('SymbolNum = 0', 'SymbolNum = 2', 'SymbolNum = 5', 'QAM-16', 'Location', 'northeast', 'Fontsize', 14);
grid on;
%% 4. Влияние эквалайзера на помехоустойчивость приема сигналов с OFDM для разного
%количества символов, используемых для временной синхронизации по циклическому
%префиксу.
clear;
clc;
bpsData = 4;       
bpsPilot = 2;
nFFT = 2048;
pilotNum = 195;
nZeros = 146;
nCP = 100;
txData = randi([0 1], 10e4, 1);

SyncType = 'Time';
AlgType = 1;
ShiftSymNum = 100;

SymbolNum1 = 0;
SymbolNum2 = 2;
SymbolNum3 = 5;
AKF = 1;
Equalizer = 1;

EbNoStartAWGN = 5;
EbNoStepAWGN = 1;
EbNoEndAWGN = 20;
EbNodB = EbNoStartAWGN:EbNoStepAWGN:EbNoEndAWGN;

[BER1_4, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum1, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER2_4, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum2, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER3_4, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum3, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
figure(4)
semilogy(EbNodB, BER1_4, 'LineWidth', 2); hold on;
semilogy(EbNodB, BER2_4, 'LineWidth', 2);
semilogy(EbNodB, BER3_4, 'LineWidth', 2);
semilogy(EbNodB, berawgn(EbNodB,'qam',16), 'LineWidth', 2);
ylim([10e-5,1]);
title('Временной сдвиг для разного количества символов временной синхронизации синхронизации');
legend('Shift = 0', 'Shift = 2', 'Shift = 5', 'QAM-16', 'Location', 'northeast', 'Fontsize', 14);
grid on;
%% 5. Вид автокорреляционной функции, используемой для временной синхронизации на
%основе символов с периодическими повторениями (алгоритм Минна)
 
clear;
clc;
bpsData = 4;       
bpsPilot = 2;
nFFT = 2048;
pilotNum = 195;
nZeros = 146;
nCP = nFFT/8;
txData = randi([0 1], 10e4, 1);

shift = 500;
Equalizer = 1;
EbNoStart = 5;
EbNoStep = 1;
EbNoEnd = 20;

[BER1_5, AKF1_5, EbNodB] = SimulationOFDMTimeOffset(bpsData, bpsPilot, nFFT, txData, pilotNum, nZeros, ...
     nCP, EbNoStart, EbNoStep, EbNoEnd, shift, Equalizer);
 
figure(5)
plot (AKF1_5); 
title('Вид автокорреляционной функции');

%% 6.Помехоустойчивость приема сигналов с OFDM при временной синхронизации на основе
%символов с периодическими повторениями (алгоритм Минна) без эквалайзера и с
%эквалайзером.
figure(6)
semilogy(EbNodB, BER1_5, 'LineWidth', 2); hold on;
semilogy(EbNodB, berawgn(EbNodB,'qam',16), 'LineWidth', 2);
ylim([10e-5,1]);
title('Временная синхронизация с использованием алгоритма Минна с эквалайзером');
legend('SymbolNum = 0', 'QAM-16', 'Location', 'northeast', 'Fontsize', 14);
grid on;
%% 2.1 Помехоустойчивость приема сигналов с OFDM для разного частотного сдвига при
%отсутствии частотной синхронизации

clear;
clc;
bpsData = 4;       
bpsPilot = 2;
nFFT = 2048;
pilotNum = 195;
nZeros = 146;
nCP = nFFT/8;
txData = randi([0 1], 10e4 ,1);

SyncType = 'Frec';
AlgType = 1;
ShiftSymNum1 = 0;
ShiftSymNum2 = 0.001;
ShiftSymNum3 = 0.01;
SymbolNum = 0;
AKF = 0;
Equalizer = 0;


EbNoStartAWGN = 0;
EbNoStepAWGN = 1;
EbNoEndAWGN = 20;
EbNodB = EbNoStartAWGN:EbNoStepAWGN:EbNoEndAWGN;

[BER1_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
     nCP, SyncType, AlgType, ShiftSymNum1, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER2_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum2, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER3_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum3, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
figure(7)
semilogy(EbNodB,BER1_1_2,  'LineWidth', 2); hold on;
semilogy(EbNodB,BER2_1_2, 'LineWidth', 2);
semilogy(EbNodB,BER3_1_2, 'LineWidth', 2);
semilogy(EbNodB,berawgn(EbNodB,'qam',16), 'LineWidth', 2);
hold off;
ylim([10e-5,1]);
title('Частотный сдвиг без синхронизации');
legend('Shift = 0', 'Shift = 0.001', 'Shift = 0.01','AWGN 16-QAM', 'Location', 'northeast', 'Fontsize', 14);
grid on;
%% 2.2 Влияние эквалайзера на помехоустойчивость приема сигналов с OFDM для разного
%частотного сдвига при отсутствии частотной синхронизации

clear;
clc;
bpsData = 4;       
bpsPilot = 2;
nFFT = 2048;
pilotNum = 195;
nZeros = 146;
nCP = nFFT/8;
txData = randi([0 1], 10e4 ,1);

SyncType = 'Frec';
AlgType = 1;
ShiftSymNum1 = 0;
ShiftSymNum2 = -0.02;
ShiftSymNum3 = 0.02;
SymbolNum = 0;
AKF = 0;
Equalizer = 1;

EbNoStartAWGN = 0;
EbNoStepAWGN = 1;
EbNoEndAWGN = 20;
EbNodB = EbNoStartAWGN:EbNoStepAWGN:EbNoEndAWGN;

[BER1_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
     nCP, SyncType, AlgType, ShiftSymNum1, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER2_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum2, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER3_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum3, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
figure(8)
semilogy(EbNodB,BER1_1_2,  'LineWidth', 2); hold on;
semilogy(EbNodB,BER2_1_2, 'LineWidth', 2);
semilogy(EbNodB,BER3_1_2, 'LineWidth', 2);
semilogy(EbNodB,berawgn(EbNodB,'qam',16), 'LineWidth', 2);
hold off;
ylim([10e-5,1]);
title('Частотный сдвиг без синхронизации с использованием эквалайзера');
legend('Shift = 0', 'Shift = -0.02', 'Shift = 0.02','AWGN 16-QAM', 'Location', 'northeast', 'Fontsize', 14);
grid on;
%% 2.3 Помехоустойчивость приема сигналов с OFDM для разного количества символов,
%используемых при частотной синхронизации по циклическому префиксу
%(нормированная частотная расстройка [-0.5, 0.5])
clear;
clc;
bpsData = 4;       
bpsPilot = 2;
nFFT = 2048;
pilotNum = 195;
nZeros = 146;
nCP = nFFT/8;
txData = randi([0 1], 10e4 ,1);

SyncType = 'Frec';
AlgType = 1;

ShiftSymNum = 0.02;
SymbolNum1 = 0;
SymbolNum2 = 2;
SymbolNum3 = 5;
AKF = 0;
Equalizer = 0;

EbNoStartAWGN = 0;
EbNoStepAWGN = 1;
EbNoEndAWGN = 20;
EbNodB = EbNoStartAWGN:EbNoStepAWGN:EbNoEndAWGN;

[BER1_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
     nCP, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum1, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER2_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum2, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER3_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum3, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
figure(9)
semilogy(EbNodB,BER1_1_2,  'LineWidth', 2); hold on;
semilogy(EbNodB,BER2_1_2, 'LineWidth', 2);
semilogy(EbNodB,BER3_1_2, 'LineWidth', 2);
semilogy(EbNodB,berawgn(EbNodB,'qam',16), 'LineWidth', 2);
hold off;
ylim([10e-5,1]);
title('Частотный сдвиг с использованием разного количества символов для синхронизации');
legend('SymbolNum = 0', 'SymbolNum = 2', 'SymbolNum = 5','AWGN 16-QAM', 'Location', 'northeast', 'Fontsize', 14);
grid on;
%% 2.4  Влияние циклического префикса на помехоустойчивость приема сигналов с OFDM при
%частотной синхронизации по циклическому префиксу

clear;
clc;
bpsData = 4;       
bpsPilot = 2;
nFFT = 2048;
pilotNum = 195;
nZeros = 146;
txData = randi([0 1], 10e4 ,1);

nCP1 = 32;
nCP2 = 128;
nCP3 = 256;

SyncType = 'Frec';
AlgType = 1;

ShiftSymNum = 0.2;
SymbolNum = 6;
AKF = 0;
Equalizer = 0;

EbNoStartAWGN = 0;
EbNoStepAWGN = 1;
EbNoEndAWGN = 20;
EbNodB = EbNoStartAWGN:EbNoStepAWGN:EbNoEndAWGN;

[BER1_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
     nCP1, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER2_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP2, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER3_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP3, SyncType, AlgType, ShiftSymNum, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);

figure(10)
semilogy(EbNodB,BER1_1_2,  'LineWidth', 2); hold on;
semilogy(EbNodB,BER2_1_2, 'LineWidth', 2);
semilogy(EbNodB,BER3_1_2, 'LineWidth', 2);
semilogy(EbNodB,berawgn(EbNodB,'qam',16), 'LineWidth', 2);
hold off;
ylim([10e-5,1]);
title('Частотный сдвиг для разной длины циклического префикса');
legend('CP = 32', 'CP = 128', 'CP = 256','AWGN 16-QAM', 'Location', 'northeast', 'Fontsize', 14);
grid on;
%% 2.5  Помехоустойчивость приема сигналов с OFDM при частотной синхронизации на основе
%символов с периодическими повторениями при нормированной частотной расстройке
%[- 0.5, 0.5] и [-2, 2]

clear;
clc;
bpsData = 4;       
bpsPilot = 2;
nFFT = 2048;
pilotNum = 195;
nZeros = 146;
txData = randi([0 1], 10e4 ,1);
nCP = 128;

SyncType = 'Frec';
AlgType = 1;
ShiftSymNum1 = 0.2;
ShiftSymNum2 = 1.5;
ShiftSymNum3 = 2.5;
SymbolNum = 6;
AKF = 0;
Equalizer = 0;

EbNoStartAWGN = 0;
EbNoStepAWGN = 1;
EbNoEndAWGN = 20;
EbNodB = EbNoStartAWGN:EbNoStepAWGN:EbNoEndAWGN;

[BER1_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
     nCP, SyncType, AlgType, ShiftSymNum1, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER2_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum2, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);
[BER3_1_2, ~, ~] = SimulationOFDMTransmit2(bpsData, bpsPilot, nFFT, pilotNum, nZeros, ...
      nCP, SyncType, AlgType, ShiftSymNum3, AKF, SymbolNum, Equalizer, txData, EbNoStartAWGN, EbNoStepAWGN, EbNoEndAWGN);

figure(10)
semilogy(EbNodB,BER1_1_2,  'LineWidth', 2); hold on;
semilogy(EbNodB,BER2_1_2, 'LineWidth', 2);
semilogy(EbNodB,BER3_1_2, 'LineWidth', 2);
semilogy(EbNodB,berawgn(EbNodB,'qam',16), 'LineWidth', 2);
hold off;
ylim([10e-5,1]);
title('Синхронизация на основе симвоов с повторениием для разной частотной отстройки');
legend( 'Shift = 0.02','Shift = 1.5','Shift = 2.5','AWGN 16-QAM', 'Location', 'northeast', 'Fontsize', 14);
grid on;