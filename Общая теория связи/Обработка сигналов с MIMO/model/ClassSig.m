classdef ClassSig < handle
    properties (SetAccess = private) % Переменные из параметров
        % Нужно ли выполнять формирование сигнала и выполнять его обработку
        % при приёме
            isTransparent;
        % Переменная управления языком вывода информации для пользователя
            LogLanguage;

            EnableMIMO;
            TypeOfDiversity; % MIMO, SIMO, MISO
            MethodForSIMO; % 
            MethodForMISO; % 
            MethodForMIMO; % ZF, ZF-SIC, ZF-SIC OO, MMSE, MMSE-SIC и MMSE-SIC O
            NumTransAnts;
            NumResAnts;
    end
    properties (SetAccess = private) % Вычисляемые переменные
        NumBits;
        ModulationOrder;
        PhaseOffset;
    end
    methods
        function obj = ClassSig(Params, LogLanguage, Objs) % Конструктор
            % Выделим поля Params, необходимые для инициализации
                Sig  = Params.Sig;
            % Инициализация значений переменных из параметров
                obj.isTransparent = Sig.isTransparent;
            % Переменная LogLanguage
                obj.LogLanguage = LogLanguage;

                obj.EnableMIMO = Sig.EnableMIMO;
                obj.TypeOfDiversity = Sig.TypeOfDiversity;
                obj.MethodForSIMO = Sig.MethodForSIMO;
                obj.MethodForMISO = Sig.MethodForMISO;
                obj.MethodForMIMO = Sig.MethodForMIMO;
                
                obj.NumTransAnts = Sig.NumTransAnts;
                obj.NumResAnts = Sig.NumResAnts;

                obj.NumBits = Objs.Source.NumBitsPerFrame/Objs.Mapper.log2M;
                obj.ModulationOrder = Objs.Mapper.ModulationOrder;
                obj.PhaseOffset = Objs.Mapper.PhaseOffset;

        end
        function OutData = StepTx(obj, InData)
            if obj.isTransparent
                OutData = InData;
             return
            end
            if (obj.EnableMIMO)
                switch obj.TypeOfDiversity
                    case 'SIMO'
                        OutData = InData;
                    case 'MISO'
                        switch obj.MethodForMISO
                            case 'ALAM'
                                OutData = reshape(InData, 2, []);
                            case 'BEAM'
                                OutData = InData;

                        end
                    case 'MIMO'
                        
                        OutData = reshape(InData, obj.NumTransAnts, []);

                end
            end
            % Здесь должна быть процедура формирования сигнала
           
        end
        function OutData = StepRx(obj, InData, InstChannelParams)
            if obj.isTransparent
                OutData = InData;
                return
            end
            if (obj.EnableMIMO) 
                switch obj.TypeOfDiversity
                    case 'SIMO'
                        switch obj.MethodForSIMO
                            case 'SC' %Selection Combining - выбор лучшей антенны 
                                    hPower = InstChannelParams.Hchannel.*conj(InstChannelParams.Hchannel);
                                    [hMaxVal, idx] = max(hPower, [], 1);   % выбор лучшей антенны
%                                     
                                    %ind = sub2ind(size(InstChannelParams.Hchannel), idx, 1:obj.NumBits);
                                    hMaxValMat = kron(ones(obj.NumResAnts, 1), hMaxVal);

                                    Htarget = InstChannelParams.Hchannel(hPower==hMaxValMat);
                                    RxTarget = InData(hPower==hMaxValMat);
                                    
                                    RxDataSC = RxTarget ./Htarget ;
                                    OutData = RxDataSC;

                            case 'EGC' % Equal Gane Combining - метод суммирования по всем антеннам 
                                     phase = exp(-1j*angle(InstChannelParams.Hchannel));
%                                   RxDataEGC = sum(InData.*phase, 1);
%                                     
%                                     gain_EGC = sum(abs(InstChannelParams.Hchannel), 1); 
%                                     RxDataEGC = RxDataEGC./ obj.NumResAnts  ;
                                    s_hat = sum(InData.* phase, 1) ./ sum(abs(InstChannelParams.Hchannel));
                                    OutData = s_hat.';

%                                   
                            case 'MRC' % MAximum Ratio Combining - метод выбора лучшего отношения сигнал/шум
                                    weight = conj(InstChannelParams.Hchannel);
                                    RxDataMRC = sum(InData.*weight, 1);
                                    gain_EGC = sum(abs(InstChannelParams.Hchannel).^2, 1); 
                                    RxDataMRC = RxDataMRC ./ gain_EGC;
                                    OutData = RxDataMRC.';

                            otherwise

                        end
                       
                    case 'MISO'
                        switch obj.MethodForMISO
                            case 'ALAM' %Alamouti - схема Аламоути - для 2 антенн 
                                    RxFirstRow = conj(InstChannelParams.Hchannel1).*InData(1, :) + InstChannelParams.Hchannel2.*conj(InData(2, :));
                                    RxSecRow = conj(InstChannelParams.Hchannel2).*InData(1, :) - InstChannelParams.Hchannel1.*conj(InData(2, :));
                                
                                    normFactor = abs(InstChannelParams.Hchannel1).^2 + abs(InstChannelParams.Hchannel2).^2;
                                    RxFirstRow = RxFirstRow ./ normFactor;
                                    RxSecRow = RxSecRow ./ normFactor;
                                
                                    % Собираем обратно поток символов
                                    OutData = reshape([RxFirstRow; RxSecRow], 1, []).';
                                   
                            case 'BEAM' % Diagram - формирование диаграммы направленности - для 1,2,4 антенн
                                OutData = (InData ./ InstChannelParams.Hchannel).';
                            otherwise

                        end
                    

                    case 'MIMO'
                        switch obj.MethodForMIMO
                            case 'ZF'
                                X_hat_ZF = zeros(size(InData));
                                for k = 1:obj.NumBits/obj.NumTransAnts
                                    Hk = InstChannelParams.Hchannel(:,:,k);
                                    X_hat_ZF(:,k) = pinv(Hk)*InData(:,k);
                                end
                                OutData = X_hat_ZF(:);
                            case 'MMSE'
                                 X_hat_MMSE = zeros(size(InData));
                                for k = 1:obj.NumBits/obj.NumTransAnts
                                    Hk = InstChannelParams.Hchannel(:,:,k);
                                    X_hat_MMSE(:,k) = (Hk'*Hk + InstChannelParams.Variance*eye(obj.NumTransAnts)) \ (Hk'*InData(:,k));
                                end
                                OutData = X_hat_MMSE(:);

                            case 'ZF-SIC'
                                Nt = obj.NumTransAnts; 
                                NumSym = obj.NumBits / Nt;
                                s_ZF_SIC = zeros(Nt, NumSym);
                                for k = 1:NumSym
                                    yk = InData(:,k);                        
                                    Hk = InstChannelParams.Hchannel(:,:,k);    
                                    H_res = Hk;
                                    y_res = yk;
                                    indices = 1:Nt;                              
                                    x_soft_k = zeros(Nt,1);  
                                    for i = 1:Nt
                                        W = pinv(H_res); 
                                        idx_res = 1;
                                        idx_orig = indices(idx_res);
                                        z = W(idx_res,:) * y_res;
                                        x_soft_k(idx_orig) = z;
                                        z_hard = obj.Slice(z); 
                                        y_res = y_res - H_res(:,idx_res) * z_hard;
                                        H_res(:,idx_res) = [];
                                        indices(idx_res) = [];
                                    end
                                    s_ZF_SIC(:,k) = x_soft_k;
                                end
                                OutData = s_ZF_SIC(:);

                            case 'MMSE-SIC'
                                Nt = obj.NumTransAnts; 
                                NumSym = obj.NumBits / Nt;
                                s_MMSE_SIC = zeros(Nt, NumSym);
                                for k = 1:NumSym
                                    yk = InData(:,k);                     
                                    Hk = InstChannelParams.Hchannel(:,:,k); 
                                    H_res = Hk;
                                    y_res = yk;
                                    indices = 1:Nt;                            
                                    x_soft_k = zeros(Nt,1); 
                                    for i = 1:Nt
                                        W = (H_res' * H_res + InstChannelParams.Variance * eye(size(H_res, 2))) \ H_res';  % Nt_current x Nr
                                        idx_res = 1;
                                        idx_orig = indices(idx_res);
                                        z = W(idx_res,:) * y_res;
                                        x_soft_k(idx_orig) = z;
                                        z_hard = obj.Slice(z);  
                                        y_res = y_res - H_res(:,idx_res) * z_hard;
                                        H_res(:,idx_res) = [];
                                        indices(idx_res) = [];
                                    end
                                    s_MMSE_SIC(:,k) = x_soft_k;
                                end
                                OutData = s_MMSE_SIC(:);

                            case 'ZF-SIC-OO'  % ZF-SIC с оптимальным порядком (Optimal Ordering)
                                Nt = obj.NumTransAnts; 
                                NumSym = obj.NumBits / Nt; 
                                s_ZF_SIC_OO = zeros(Nt, NumSym);
                                for k = 1:NumSym
                                    yk = InData(:,k);                        
                                    Hk = InstChannelParams.Hchannel(:,:,k);  
                                    H_res = Hk;
                                    y_res = yk;
                                    indices = 1:Nt;                              
                                    x_soft_k = zeros(Nt,1); 
                                    for i = 1:Nt
                                        W = pinv(H_res); 
                                        norms = sum(abs(W).^2, 2);               
                                        [~, idx_res] = min(norms);                
                                        idx_orig = indices(idx_res);
                                        z = W(idx_res,:) * y_res;
                                        x_soft_k(idx_orig) = z;
                                        z_hard = obj.Slice(z);
                                        y_res = y_res - H_res(:,idx_res) * z_hard;
                                        H_res(:,idx_res) = [];
                                        indices(idx_res) = [];
                                    end
                                    s_ZF_SIC_OO(:,k) = x_soft_k;
                                end
                                OutData = s_ZF_SIC_OO(:);

                            case 'MMSE-SIC-OO'  % MMSE с SIC и Optimal Ordering

                                Nt = obj.NumTransAnts;        
                                NumSym = obj.NumBits / Nt; 
                                s_MMSE_SIC_OO = zeros(Nt, NumSym);
                                for k = 1:NumSym
                                    yk = InData(:,k);                           
                                    Hk = InstChannelParams.Hchannel(:,:,k); 
                                    y_res = yk;
                                    indices = 1:Nt;                      
                                    x_soft_k = zeros(Nt,1);
                                    for i = 1:Nt
                                        W = (H_res' * H_res + InstChannelParams.Variance * eye(size(H_res, 2))) \ H_res'; 
                                        InvMat = inv(H_res' * H_res + InstChannelParams.Variance * eye(size(H_res, 2)));
                                        mse_diags = diag(InvMat);
                                        [~, idx_res] = min(mse_diags);            
                                        idx_orig = indices(idx_res);
                                        z = W(idx_res,:) * y_res;
                                        x_soft_k(idx_orig) = z;
                                        z_hard = obj.Slice(z);
                                        y_res = y_res - H_res(:,idx_res) * z_hard;
                                        H_res(:,idx_res) = [];
                                        indices(idx_res) = [];
                                    end
                                    s_MMSE_SIC_OO(:,k) = x_soft_k;
                                end
                                OutData = s_MMSE_SIC_OO(:);
                            otherwise

                        end

                end
            end
        end
        function sliced = Slice(obj, x)
            
                sym_idx = pskdemod(x, obj.ModulationOrder, ...
                     obj.PhaseOffset);
                sliced = pskmod(sym_idx, obj.ModulationOrder, ...
                     obj.PhaseOffset);
             
            
        end
    end
end