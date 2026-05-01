classdef ClassInterleaver < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли выполнять перемежение и деперемежение
            isTransparent;
        % Параметры перемежения DVB-S2
            MODCOD;
            BlockLength;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;
    end

    properties (SetAccess = private) % Вычисляемые переменные
        % Параметры перемежения из таблицы MATLAB (Normal frames)
            nRows;
            nCols;
            permutationVector;
            depermutationVector;
    end

    methods
        function obj = ClassInterleaver(Params, LogLanguage) % Конструктор
            % Выделим поля Params, необходимые для инициализации
                Interleaver  = Params.Interleaver;
            % Инициализация значений переменных из параметров
                obj.isTransparent = Interleaver.isTransparent;
                obj.MODCOD = Params.Mapper.MODCOD;
                obj.BlockLength = 64800; % Normal frame
            % Переменная LogLanguage
                obj.LogLanguage = LogLanguage;
            
            if ~obj.isTransparent
                obj.calcInterleaverParams();
            end
        end
        
        function calcInterleaverParams(obj)
            % Расчет параметров перемежения для DVB-S2 HDL Receiver
            switch obj.MODCOD
                case {1} % QPSK
                    obj.nRows = 64800; 
                    obj.nCols = 1;     % 1 column
                case {2} % 8-PSK
                    obj.nRows = 21600;   
                    obj.nCols = 3;     % 3 columns
                case {3} % 16-APSK
                    obj.nRows = 16200;
                    obj.nCols = 4;     % 4 columns
                case {4} % 32-APSK
                    obj.nRows = 12960; 
                    obj.nCols = 5;     % 5 columns
            end
            
            % Создание векторов перемежения/деперемежения
            obj.createPermutationVectors();
        end
        
        function createPermutationVectors(obj)
            % Матричное перемежение согласно DVB-S2
            if obj.isTransparent
                return;
            end
            
            % Для QPSK (1 столбец) - перемежение не требуется
            if obj.nCols == 1
                obj.permutationVector = 1:obj.BlockLength;
                obj.depermutationVector = 1:obj.BlockLength;
                return;
            end
            
            % Создаем матрицу индексов (запись по строкам)
            matrix = reshape(1:obj.nRows*obj.nCols, obj.nRows, obj.nCols);
            
            % Перемежение: чтение по столбцам
            interleavedMatrix = matrix';
            obj.permutationVector = interleavedMatrix(:);
            
            % Деперемежение: обратная операция
            [~, obj.depermutationVector] = sort(obj.permutationVector);
        end

        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % Проверка размера входных данных
            if length(InData) ~= obj.BlockLength
                if strcmp(obj.LogLanguage, 'Russian')
                    error(['Размер входных данных (%d) не соответствует '...
                        'длине блока (%d)'], length(InData), obj.BlockLength);
                else
                    error(['Input data size (%d) does not match '...
                        'block length (%d)'], length(InData), obj.BlockLength);
                end
            end
            
            % Применение перемежения
            OutData = InData(obj.permutationVector);
        end

        function OutData = StepRx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % Проверка размера входных данных
            if length(InData) ~= obj.BlockLength
                if strcmp(obj.LogLanguage, 'Russian')
                    error(['Размер входных данных (%d) не соответствует '...
                        'длине блока (%d)'], length(InData), obj.BlockLength);
                else
                    error(['Input data size (%d) does not match '...
                        'block length (%d)'], length(InData), obj.BlockLength);
                end
            end
            
            % Применение деперемежения
            OutData = InData(obj.depermutationVector);
        end
    end
end