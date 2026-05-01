function DrawBERAndFER(DirName)

% Функция прорисовки кривых вероятности битовой и кадровой ошибок

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
        if ~Listing(k).isdir
            FName = Listing(k).name;
            if length(FName) > 4 && isequal(FName(end-3:end), '.mat')
                Names{end+1} = FName(1:end-4); %#ok<AGROW>
            end
        end
    end

    if isempty(Names)
        error('Не найдены файлы с результатами!');
    end

    % Прорисовка BER и FER
    f  = cell(2, 1);
    ax = cell(2, 1);
    for k = 1:2
        f{k} = figure;
        ax{k} = axes;
    end

    % Цикл по всем файлам
    for k = 1:length(Names)
        load([DirName, '\', Names{k}, '.mat'], 'Res', 'Params');
        
        % Прорисовка BER
        figure(f{1});
        hold on;
        plot(Res.h2dBs, Res.NumErBits ./ Res.NumTrBits, ...
            'LineWidth', 1, 'MarkerSize', 8, 'Marker', '.');

        % Прорисовка FER
        figure(f{2});
        hold on;
        plot(Res.h2dBs, Res.NumErFrames ./ Res.NumTrFrames, ...
            'LineWidth', 1, 'MarkerSize', 8, 'Marker', '.');
    end

    % Настройка графиков
    for k = 1:2
        figure(f{k});
        grid on;
        set(ax{k}, 'YScale', 'log');

        if k == 1
            title('BER');
            ylim([10^(-4), 10^0]);
        else
            title('FER');
        end
        xlabel('{\ith}^2 (dB)');

        % Добавим стандартные BER для сравнения
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

            legend([Names, AddNames], 'Interpreter', 'none');
        else
            legend(Names, 'Interpreter', 'none');
        end
    end
end
