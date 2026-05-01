function DrawBERAndFER(DirName)
%
% Функция прорисовки кривых вероятности битовой и кадровой ошибок
% close all;
    % Директория, из которой будут взяты результаты
        if nargin == 0
            DirName = 'Results';
        end

    % Получим информацию о содержимом директории
        Listing = dir(DirName);

    % Инициализируем cell-массив для хранения имён файлов, из которых потом
    % сделаем легенду
        Names = cell(0);

    % Цикл по всем файлам директории
        for k = 1:length(Listing)
            % Надо проверять, чтобы рассматриваемый элемент был файлом и
            % имел расширение mat
                if ~Listing(k).isdir
                    FName = Listing(k).name;
                    if length(FName) > 4
                        if isequal(FName(end-3:end), '.mat')
                            % Добавим имя файла к списку
                                Names{end+1} = FName(1:end-4); %#ok<AGROW>
                        end
                    end
                end
        end

        if isempty(Names)
            error('Не найдены файлы с результатами!');
        end

    % Прорисовка BER и FER
        % Создадим два полотна и оси
            f  = cell(3, 1);
            ax = cell(3, 1);
            for k = 1:3
                f{k} = figure;
                    ax{k} = axes;
            end

        % Цикл по всем уже известным файлам
            for k = 1:length(Names)
                % Загрузка результатов
                    load([DirName, '\', Names{k}, '.mat'], 'Res', 'Params');
                % Прорисовка без затирания старых рисунков    
                    figure(f{1});
                        hold on;
                        plot(Res.h2dBs, Res.NumErBits ./ Res.NumTrBits, ...
                            'LineWidth', 2, 'MarkerSize', 12, ...
                            'Marker', '.');
                    figure(f{2});
                        hold on;
                        plot(Res.h2dBs, Res.NumErFrames ./ ...
                            Res.NumTrFrames, 'LineWidth', 2, ...
                            'MarkerSize', 12, 'Marker', '.');
                    figure(f{3});
                        h2Shannon = findSNRatTargetBER(Res.h2dBs,...
                            Res.NumErBits ./ Res.NumTrBits);
                        hold on;
                        plot(h2Shannon, ...
                            log2(Params.Mapper.ModulationOrder)* ...
                            Params.Encoder.CodeRate,'o', 'LineWidth', 4);
            end


        for k = 1:3
            figure(f{k});

            % Добавим сетку
                grid on;

            % Сделаем традиционный масштаб по оси ординат
                set(ax{k}, 'YScale', 'log');

            % Подпишем рисунок и ось абсцисс
                if k == 1
                    title('BER', 'FontSize',14);
                    ylim([10^(-4),10^0]);
                    % xlim([0,6]);
                elseif (k==2)
                    title('FER', 'FontSize',14);
                else
                    title('Shannon', 'FontSize',14)
                end
                xlabel('{\ith}^2 (dB)', 'FontSize',14);

            % Прорисовка стандартных BER
            % В данном случае для QAM4 и QAM16 до вероятности 1e-6
                if k == 1
                    AddNames = cell(0);
                    h2dB = 0:0.1:10.5;
                    BER = berawgn(h2dB, 'qam', 4);
                    plot(h2dB, BER);
                    AddNames{end+1} = 'QPSK'; %#ok<AGROW>

                    h2dB = 0:0.1:14.4;
                    BER = berawgn(h2dB, 'qam', 16);
                    plot(h2dB, BER);
                    AddNames{end+1} = '16-QAM'; %#ok<AGROW>
                elseif k==3
                    h2dB = 0:0.1:20;
                    Shannon = log2(1 + 10.^(h2dB/10));
                    plot(h2dB, Shannon);
                end

            % Добавим легенду
                if k == 1
                    legend([Names, AddNames], 'FontSize', 14, 'Interpreter', 'none');
                else
                    legend(Names, 'FontSize', 14 ,'Interpreter', 'none');
                end
        end
end

function h2Target = findSNRatTargetBER(h2dB, BerValues)
    % Находит SNR для заданного BER методом интерполяции
    
    % Ищем точки вокруг целевого BER
    idxAbove = find(BerValues > 10^(-4), 1, 'last');
    idxBelow = find(BerValues < 10^(-4), 1, 'first');
    
    % Линейная интерполяция в логарифмической шкале
    if isempty(idxBelow)
        h2Target =  h2dB(idxAbove)+0.1;
    else
        logBerAbove = log10(BerValues(idxAbove));
        logBerBelow = log10(BerValues(idxBelow));
        weight = (logBerAbove - log10(10^(-4))) / (logBerAbove - logBerBelow);
        h2Target = h2dB(idxAbove) * (1 - weight) + h2dB(idxBelow) * weight;
    end
    
end