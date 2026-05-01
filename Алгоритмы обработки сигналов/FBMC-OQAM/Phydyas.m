%1. Вид импульсной характеристики и частотной характеристики фильтра-прототипа типа
%Phydyas при разных коэффициентах перекрытия. 
clc; clear; close all;

M = 512;   % число поднесущих

% PHYDYAS коэффициенты
H_table = {
    [1, 0.707107], ...                            
    [1, 0.911438, 0.411438], ...                 
    [1, 0.971960, 0.707107, 0.235147]            
};
K_values = [2, 3, 4];

figure('Name', 'Импульсные характеристики'); 
ax_ir = gca; hold(ax_ir, 'on');
title(ax_ir, 'Импульсные характеристики PHYDYAS');
xlabel(ax_ir, 'n');
ylabel(ax_ir, 'Амплитуда');
grid(ax_ir, 'on');

figure('Name', 'АЧХ'); 
ax_fr = gca; hold(ax_fr, 'on');
title(ax_fr, 'Амплитудно-частотные характеристики PHYDYAS');
xlabel(ax_fr, 'Нормированная частота');
ylabel(ax_fr, 'Амплитуда (дБ)');
grid(ax_fr, 'on');
ylim(ax_fr, [-120 5]);

colors = {'b','r','m'};
Legend = {};

FFTpoints = 16384;

for i = 1:length(K_values)
    K = K_values(i);
    Hc = H_table{i};
    L = K * M;    
    N0 = (L - 1) / 2;
    H = zeros(1, L);
    for n = 0:L-1
        val = Hc(1); 
        for k = 1:length(Hc)-1
            val = val + 2 * Hc(k+1) * cos( 2*pi*k*(n - N0) / (K*M) );
        end
        H(n+1) = val;
    end
    H = H / sqrt(sum(H.^2));
    Hplot = H / max(abs(H));
    figure(1);
    plot(ax_ir, (-N0:N0), Hplot, 'Color', colors{i}, 'LineWidth', 1.5);
    Legend{i} = ['K=' num2str(K)];

    Hpad = [H zeros(1, FFTpoints - L)];
    Hf = fftshift(fft(Hpad));
    Hmag = abs(Hf);
    Hmag = Hmag / max(Hmag);
    F = linspace(-0.5, 0.5, FFTpoints + 1);
    F = F(1:end-1);
    figure(2);
    plot(ax_fr, F, 20*log10(Hmag), 'Color', colors{i}, 'LineWidth', 1.5);
end

figure(1);
legend(ax_ir, Legend, 'Location','best');

figure(2);
legend(ax_fr, Legend, 'Location','southwest');
xlim(ax_fr, [-0.5 0.5]);

