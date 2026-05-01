classdef ClassInterleaver < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли выполнять перемежение и деперемежение
            isTransparent;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;

            N;
    end
    properties (SetAccess = private) % Вычисляемые переменные

            Perm;
            
    end
    methods
        function obj = ClassInterleaver(Params, LogLanguage) % Конструктор
            % Выделим поля Params, необходимые для инициализации
                Interleaver  = Params.Interleaver;
            % Инициализация значений переменных из параметров
                obj.isTransparent = Interleaver.isTransparent;
            % Переменная LogLanguage
                obj.LogLanguage = LogLanguage;
                
                obj.N = Interleaver.N;
                obj.Perm = randperm(obj.N ).';
        end
        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % Здесь должна быть процедура перемежения
            OutData = InData(obj.Perm);
        end
        function OutData = StepRx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % Здесь должна быть процедура деперемежения
            deperm = zeros(size(obj.Perm));
            deperm(obj.Perm) = (1:obj.N).';

            OutData = InData(deperm);
        end
    end
end