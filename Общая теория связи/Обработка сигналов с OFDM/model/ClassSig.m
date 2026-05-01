classdef ClassSig < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли выполнять формирование сигнала и выполнять его обработку
        % при приёме
            isTransparent;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;
            %количество ресурсных блоков
            ResorsBlockNum;
            %длина цикличиского префикса
            nCP;
    end
    properties (SetAccess = private) % Вычисляемые переменные
        
        NFFt;
        NOFDMSimbols;
        idData;
        idPilot;
        PilotData;
       
     



    end
    methods
        function obj = ClassSig(Params, LogLanguage, Objs) % Конструктор
            % Выделим поля Params, необходимые для инициализации
                Sig  = Params.Sig;
            % Инициализация значений переменных из параметров
                obj.isTransparent = Sig.isTransparent;
                obj.nCP = Sig.nCP;
                
                obj.NFFt = Objs.OFDMPattern.NFFt;
                obj.NOFDMSimbols = Objs.OFDMPattern.NOFDMSimbols;
                obj.idData = Objs.OFDMPattern.idData;
                obj.idPilot = Objs.OFDMPattern.idPilot;
                obj.PilotData = Objs.OFDMPattern.PilotData;

            % Переменная LogLanguage
                obj.LogLanguage = LogLanguage;
        end
        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
            CP=round(obj.nCP*obj.NFFt);
           
            DataLen=size(InData,1);
            SymPerOFDM= length(obj.idData);
            %NOFDMSimbols=ceil(DataLen/SymPerOFDM);
            PadBits=obj.NOFDMSimbols*SymPerOFDM-DataLen;
            if (PadBits>0)
                txData = [InData(:);zeros(PadBits,1)]; % добавили нули если надо
            else
                txData = InData(:);
            end

            resors=zeros(obj.NFFt, obj.NOFDMSimbols);

            txSigDataReshape = reshape(txData,length(obj.idData),...
                obj.NOFDMSimbols);
            txSigPilotReshape = reshape(obj.PilotData,...
                length(obj.idPilot),obj.NOFDMSimbols);
            
            resors(obj.idData,:) = txSigDataReshape;
            resors(obj.idPilot,:) = txSigPilotReshape;
            ofdmTimeGrid = ifft(resors, obj.NFFt, 1)*sqrt(obj.NFFt);

            if(obj.nCP~=0)
                   addednCP = zeros(obj.NFFt+CP, obj.NOFDMSimbols);
                   addednCP(CP+1:end,:) = ofdmTimeGrid;
                   OutData = reshape(addednCP, [], 1);
            else
                OutData = reshape(ofdmTimeGrid, [], 1);
            end

      
        end

        function OutData = StepRx(obj, InData)
            if obj.isTransparent
                OutData = InData;
                return
            end
              CP = round(obj.nCP*obj.NFFt);

            rxSignalBeforeFFT = reshape(InData, obj.NFFt+ CP,...
                obj.NOFDMSimbols);
            rxSignalWithoutCP = rxSignalBeforeFFT(CP+1:end, :);
            rxSignalFFT = fft(rxSignalWithoutCP,obj.NFFt,1)/sqrt(obj.NFFt);
            % все таки тутпридется делать проверку на тип канала, чтобы в
            % ммаппер правильно передать инфу или нет
            OutData = rxSignalFFT;
          
        end
    end
end