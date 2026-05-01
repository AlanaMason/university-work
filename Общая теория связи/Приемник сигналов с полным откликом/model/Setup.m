%% доп пункты для макса
% 1.1 PSK - 4
Encoder.isTransparent = true;  

Mapper.isTransparent = false; 
Mapper.Type = 'QAM';
Mapper.ModulationOrder = 16;
Mapper.DecisionMethod = 'Hard decision'; 

Sig.isTransparent = false;
Sig.beta = 0.35;
Sig.span = 8;
Sig.sps = 8;

Channel.isTransparent = false; 
Channel.Fs = 0;
Channel.TimeOffset = 0;

Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);

% End of Params

Encoder.isTransparent = true;  

Mapper.isTransparent = false; 
Mapper.Type = 'QAM';
Mapper.ModulationOrder = 16;
Mapper.DecisionMethod = 'Hard decision'; 

Sig.isTransparent = false;
Sig.beta = 0.35;
Sig.span = 8;
Sig.sps = 8;

Channel.isTransparent = false; 
Channel.Fs = 0;
Channel.TimeOffset = 1;

Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);

% End of Params

Encoder.isTransparent = true;  

Mapper.isTransparent = false; 
Mapper.Type = 'QAM';
Mapper.ModulationOrder = 16;
Mapper.DecisionMethod = 'Hard decision'; 

Sig.isTransparent = false;
Sig.beta = 0.35;
Sig.span = 8;
Sig.sps = 8;

Channel.isTransparent = false; 
Channel.TimeOffset = 3;
Channel.Fs = 0;

Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);

% End of Params






% % 1.1 QAM -16
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder = 16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 1;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% % End of Params

% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder = 16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 1;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% % End of Params

% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder = 16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 1;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% % End of Params



% %% 1_1 пункт
% % -------PSK - 4, beta - 0 ---------
% 
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %d span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 32;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %d span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 64;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);

% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 128;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);

% % End of Params
% 
% % --------------------------------PSK - 4, beta - 0.35--------------------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 16;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 4;
% Sig.sps = 4;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 4;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% % End of Params

% ------------------------------------------PSK - 4, beta - 0.5 ---------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);;
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 4;
% Sig.sps = 4;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);;
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 4;
% Sig.sps = 2;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);;
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 2;
% Sig.sps = 2;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);;
% 
% % End of Params




% %% 1_2 пункт
% -------QAM - 4, beta - 0 ---------


% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 32;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 64;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 128;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 128;
% Sig.sps = 16;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% % End of Params
% 
% % ---------------------------------------QAM -  16, beta - 0.35 ---------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);;
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 16;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);;
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 32;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);;
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 16;
% Sig.sps = 4;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);;
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 4;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);;
% 
% % End of Params
% 
% % ----------------------------------------QAM -  16, beta - 0.5 ---------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);;
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 8;
% Sig.sps = 4;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);;
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 4;
% Sig.sps = 4;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);;
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 2;
% Sig.sps = 2;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% % End of Params

% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder =  16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 4;
% Sig.sps = 2;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
% 
% % End of Params


%% 2 задание
%------------------------------------PSK - 4, beta = 0, 0.35, 0.5, offset = 0 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 64;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.32;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 4;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params



%------------------------------------PSK - 4, beta = 0, 0.35, 0.5, offset = 1 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 64;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 1;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 1;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 4;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 1;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params


%------------------------------------PSK - 4, beta = 0, 0.35, 0.5, offset = 3 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 64;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 3;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 3;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 4;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 3;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params




%------------------------------------QAM - 16, beta = 0, 0.35, 0.5, offset = 0 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder = 16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 128;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder = 16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.32;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder = 16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 4;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 0;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params



%------------------------------------QAM - 16, beta = 0, 0.35, 0.5, offset = 1 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder = 16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 128;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 1;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder = 16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 1;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder = 16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 4;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 1;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params


%------------------------------------QAM - 16, beta = 0, 0.35, 0.5, offset = 3 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder = 16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0;
% Sig.span = 128;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 3;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder = 16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 3;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'QAM';
% Mapper.ModulationOrder = 16;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.5;
% Sig.span = 4;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 0;
% Channel.TimeOffset = 3;
% 
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.TimeOffset);
% 
% % End of Params




%% 3 задание 
% %------------------------------------PSK - 4, beta = 0.35, offset = 8, 12, 20, NumBits = 1000 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 8;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 12;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 20;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params



%------------------------------------PSK - 4, beta = 0.35, offset = 8, 12, 20, NumBits = 100 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 50;
% 
% Source.NumBitsPerFrame = 100;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 70;
% 
% Source.NumBitsPerFrame = 100;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 90;
% 
% Source.NumBitsPerFrame = 100;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params




% %------------------------------------DPSK - 4, beta = 0.35, offset = 8, 12, 20, NumBits = 1000 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'DPSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 40;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'DPSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 60;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'DPSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 80;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params



% %------------------------------------DPSK - 4, beta = 0.35, offset = 8, 12, 20, NumBits = 100 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'DPSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 80;
% 
% Source.NumBitsPerFrame = 100;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'DPSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 100;
% 
% Source.NumBitsPerFrame = 100;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'DPSK';
% Mapper.ModulationOrder = 4;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 120;
% 
% Source.NumBitsPerFrame = 100;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params








% %------------------------------------PSK - 2, beta = 0.35, offset = 8, 12, 20, NumBits = 1000 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 8;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 12;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 20;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 14;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params


% %------------------------------------PSK - 2, beta = 0.35, offset = 8, 12, 20, NumBits = 100 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 50;
% 
% Source.NumBitsPerFrame = 100;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 70;
% 
% Source.NumBitsPerFrame = 100;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'PSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 90;
% 
% Source.NumBitsPerFrame = 100;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params




% %------------------------------------DPSK - 2, beta = 0.35, offset = 8, 12, 20, NumBits = 1000 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'DPSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 40;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'DPSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 60;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'DPSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 80;
% 
% Source.NumBitsPerFrame = 1000;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params



% % %------------------------------------DPSK - 2, beta = 0.35, offset = 8, 12, 20, NumBits = 100 --------
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'DPSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 90;
% 
% Source.NumBitsPerFrame = 100;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'DPSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 100;
% 
% Source.NumBitsPerFrame = 100;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params
% 
% Encoder.isTransparent = true;  
% 
% Mapper.isTransparent = false; 
% Mapper.Type = 'DPSK';
% Mapper.ModulationOrder = 2;
% Mapper.DecisionMethod = 'Hard decision'; 
% 
% Sig.isTransparent = false;
% Sig.beta = 0.35;
% Sig.span = 8;
% Sig.sps = 8;
% 
% Channel.isTransparent = false; 
% Channel.Fs = 1e6;
% Channel.FreqOffset = 120;
% 
% Source.NumBitsPerFrame = 100;
% Common.SaveFileName = sprintf('%s-%d beta %.2f span %d sps %d offset %d',Mapper.Type,Mapper.ModulationOrder, Sig.beta, Sig.span, Sig.sps, Channel.FreqOffset);
% 
% % End of Params