classdef ClassSig < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли выполнять формирование сигнала и выполнять его обработку
        % при приёме
            isTransparent;
        % Параметры для RRC импульса
			% Коэффициент сглаживания
				beta;
			% Длина импульса 
				span;
			% Количество отсчётов для каждого символа
				sps;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;
    end
    properties (SetAccess = private) % Вычисляемые переменные
    end
    methods
        function obj = ClassSig(Params, LogLanguage) % Конструктор
            % Выделим поля Params, необходимые для инициализации
                Sig  = Params.Sig;
            % Инициализация значений переменных из параметров
                obj.isTransparent = Sig.isTransparent;
				obj.beta = Sig.beta;
				obj.span = Sig.span;
				obj.sps = Sig.sps;
            % Переменная LogLanguage
                obj.LogLanguage = LogLanguage;
        end
        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % Здесь должна быть процедура формирования сигнала
				% Выполним передискретизацию сигнала в sps раз, вставив sps-1
                % нулей между модуляционными символами    
					Buf = zeros(obj.sps, length(InData));
                    Buf(1,:) = InData;
                    InData = reshape(Buf, 1, []);	
				% Инициализируем формирующий RRC-фильтр
                    b = rcosdesign(obj.beta,obj.span,obj.sps); % коэффициенты КИХ-фильтра
                % Каждому модуляционному символу соответствует span*sps+1 отсчетов,
                % и функция filter выдает выходные данные, размер которых
                % соответствует входным,
                % Поэтому добавляем ко входным данным span*sps нулей
                   
                    InData = [InData, zeros(1,obj.span*obj.sps)];
                % Пропускаем модуляционные символы через формирующий фильтр
                    OutData = filter(b, 1, InData).';
                   
                    % energy = sum(OutData.^2);
                    % OutData = OutData/sqrt(energy);
                    % 
        end
        function OutData = StepRx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            
            % Здесь должна быть процедура, обратная поцедуре формирования
            % сигнала
				% Инициализируем RRC-фильтр с теми же входными аргументами
                    b = rcosdesign(obj.beta,obj.span,obj.sps);
                % Пропускаем данные через согласованный фильтр (с такой же
                % импульсной характеристикой - коэффициентами b, что и формирующий
                % фильтр) для дальнейшей демодуляции    
                    OutData = filter(b, 1, InData);
                % Отбрасываем отсчеты, соответствующие задержке КИХ -
                % фильтра,
                % и понижаем частоту дискретизации в sps раз
                    OutData = OutData(obj.span*obj.sps+1 : obj.sps : end);
        end
    end
end