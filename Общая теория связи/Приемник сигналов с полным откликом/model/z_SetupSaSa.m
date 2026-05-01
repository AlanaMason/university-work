%% 1
    % %% 1.1 psk-4
    % % sps = 16
    % 
    % % b=0.2,0.5,0.8 span=1
	Encoder.isTransparent = true; % без кодирования
    
	Mapper.isTransparent = false; 
    Mapper.Type = 'PSK';
	Mapper.ModulationOrder = 4;
	Mapper.DecisionMethod = 'Hard decision'; 
    
    Sig.isTransparent = false;
    Sig.beta = 0.2;
    Sig.span = 1;
    Sig.sps = 16;
    
	Channel.isTransparent = false; 
    Channel.Fs = 0;
    
    Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    Common.NumWorkers = 6;
    % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 1;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 1;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % 
    % % b=0.2,0.5,0.8 span=5
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 5;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 5;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 5;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % % b=0.2,0.5,0.8 span=10
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 10;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 10;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 10;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % %% 1.1 QAM-16
    % % sps = 16
    % 
    % % b=0.2,0.5,0.8 span=1
	% Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 1;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 1;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 1;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % 
    % % b=0.2,0.5,0.8 span=5
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 5;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 5;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 5;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % % b=0.2,0.5,0.8 span=10
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 10;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 10;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 10;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_1_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % %% 1.2 psk-4
    % %span = 10
    % 
    % % sps = 2 b=0.2,0.5,0.8
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 10;
    % Sig.sps = 2;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 10;
    % Sig.sps = 2;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 10;
    % Sig.sps = 2;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % % sps = 8 b=0.2,0.5,0.8
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 10;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 10;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 10;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % % sps = 16 b=0.2,0.5,0.8
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 10;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 10;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 10;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % 
    % %% 1.2 qam-16
    % %span = 10
    % 
    % % sps = 2 b=0.2,0.5,0.8
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 10;
    % Sig.sps = 2;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 10;
    % Sig.sps = 2;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 10;
    % Sig.sps = 2;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % % sps = 8 b=0.2,0.5,0.8
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 10;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 10;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 10;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % % sps = 16 b=0.2,0.5,0.8
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 10;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 10;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 10;
    % Sig.sps = 16;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_2_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % %% 1.3 psk-4
    % 
    % % sps = 2 span=10
    % 
    % % b=0.2,0.5,0.8 
	% Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 10;
    % Sig.sps = 2;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_3_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 10;
    % Sig.sps = 2;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_3_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 10;
    % Sig.sps = 2;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_3_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % %% 1.3 qam-16
    % 
    % % sps = 2 span=10
    % 
    % % b=0.2,0.5,0.8 
	% Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 10;
    % Sig.sps = 2;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_3_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 10;
    % Sig.sps = 2;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_3_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 10;
    % Sig.sps = 2;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % 
    % Common.SaveFileName = sprintf('p1_3_%s-%d_beta_%f_span_%d_sps_%d',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps);
    % Common.NumWorkers = 6;
    % % End of Params

%% 2
    % %% 2.1 psk-4
    % %sps = 8
    % 
    % % b=0.2,0.5,0.8  t_o = 0
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 0;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 0;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 0;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % % b=0.2,0.5,0.8  t_o = 1
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 1;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 1;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 1;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % % b=0.2,0.5,0.8  t_o = 3
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 3;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 3;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 3;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % %% 2.1 qam-16
    % 
    % %sps = 8
    % 
    % % b=0.2,0.5,0.8  t_o = 0
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 0;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 0;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 0;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % % b=0.2,0.5,0.8  t_o = 1
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 1;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 1;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 1;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % % b=0.2,0.5,0.8  t_o = 3
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 3;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.5;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 3;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'QAM';
	% Mapper.ModulationOrder = 16;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.8;
    % Sig.span = 5;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 0;
    % Channel.TimeOffset = 3;
    % 
    % Common.SaveFileName = sprintf('p2_1_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    %% 2.2 psk-4
    % span=5
    % b=0.5

    % sps = 2, 4, 8   t_o = 2
    Encoder.isTransparent = true; % без кодирования

	Mapper.isTransparent = false; 
    Mapper.Type = 'PSK';
	Mapper.ModulationOrder = 4;
	Mapper.DecisionMethod = 'Hard decision'; 

    Sig.isTransparent = false;
    Sig.beta = 0.5;
    Sig.span = 5;
    Sig.sps = 2;

	Channel.isTransparent = false; 
    Channel.Fs = 0;
    Channel.TimeOffset = 2;

    Common.SaveFileName = sprintf('p2_2_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    Common.NumWorkers = 6;
    % End of Params

    Encoder.isTransparent = true; % без кодирования

	Mapper.isTransparent = false; 
    Mapper.Type = 'PSK';
	Mapper.ModulationOrder = 4;
	Mapper.DecisionMethod = 'Hard decision'; 

    Sig.isTransparent = false;
    Sig.beta = 0.5;
    Sig.span = 5;
    Sig.sps = 6;

	Channel.isTransparent = false; 
    Channel.Fs = 0;
    Channel.TimeOffset = 2;

    Common.SaveFileName = sprintf('p2_2_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    Common.NumWorkers = 6;
    % End of Params

    Encoder.isTransparent = true; % без кодирования

	Mapper.isTransparent = false; 
    Mapper.Type = 'PSK';
	Mapper.ModulationOrder = 4;
	Mapper.DecisionMethod = 'Hard decision'; 

    Sig.isTransparent = false;
    Sig.beta = 0.5;
    Sig.span = 5;
    Sig.sps = 8;

	Channel.isTransparent = false; 
    Channel.Fs = 0;
    Channel.TimeOffset = 2;

    Common.SaveFileName = sprintf('p2_2_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    Common.NumWorkers = 6;
    % End of Params

    %% 2.2 qam-16

    % sps = 2, 4, 8   t_o = 2
    Encoder.isTransparent = true; % без кодирования

	Mapper.isTransparent = false; 
    Mapper.Type = 'QAM';
	Mapper.ModulationOrder = 16;
	Mapper.DecisionMethod = 'Hard decision'; 

    Sig.isTransparent = false;
    Sig.beta = 0.5;
    Sig.span = 5;
    Sig.sps = 2;

	Channel.isTransparent = false; 
    Channel.Fs = 0;
    Channel.TimeOffset = 2;

    Common.SaveFileName = sprintf('p2_2_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    Common.NumWorkers = 6;
    % End of Params

    Encoder.isTransparent = true; % без кодирования

	Mapper.isTransparent = false; 
    Mapper.Type = 'QAM';
	Mapper.ModulationOrder = 16;
	Mapper.DecisionMethod = 'Hard decision'; 

    Sig.isTransparent = false;
    Sig.beta = 0.5;
    Sig.span = 5;
    Sig.sps = 6;

	Channel.isTransparent = false; 
    Channel.Fs = 0;
    Channel.TimeOffset = 2;

    Common.SaveFileName = sprintf('p2_2_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    Common.NumWorkers = 6;
    % End of Params

    Encoder.isTransparent = true; % без кодирования

	Mapper.isTransparent = false; 
    Mapper.Type = 'QAM';
	Mapper.ModulationOrder = 16;
	Mapper.DecisionMethod = 'Hard decision'; 

    Sig.isTransparent = false;
    Sig.beta = 0.5;
    Sig.span = 5;
    Sig.sps = 8;

	Channel.isTransparent = false; 
    Channel.Fs = 0;
    Channel.TimeOffset = 2;

    Common.SaveFileName = sprintf('p2_2_%s-%d_beta_%f_span_%d_sps_%d_to_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.TimeOffset);
    Common.NumWorkers = 6;
    % End of Params

%% 3
    % %% 3 PSK-4
    % 
    % % fo = 10, 20, 50
	% Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 8;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 1e6;
    % Channel.FreqOffset = 10;
    % Source.NumBitsPerFrame = 1000;
    % 
    % Common.SaveFileName = sprintf('p3_%s-%d_beta_%f_span_%d_sps_%d_fo_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.FreqOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 8;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 1e6;
    % Channel.FreqOffset = 20;
    % Source.NumBitsPerFrame = 1000;
    % 
    % Common.SaveFileName = sprintf('p3_%s-%d_beta_%f_span_%d_sps_%d_fo_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.FreqOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'PSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 8;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 1e6;
    % Channel.FreqOffset = 50;
    % Source.NumBitsPerFrame = 1000;
    % 
    % Common.SaveFileName = sprintf('p3_%s-%d_beta_%f_span_%d_sps_%d_fo_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.FreqOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % %% 3 DPSK
    % 
    % % fo = 10, 20, 50
	% Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'DPSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 8;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 1e6;
    % Channel.FreqOffset = 10;
    % Source.NumBitsPerFrame = 1000;
    % 
    % Common.SaveFileName = sprintf('p3_%s-%d_beta_%f_span_%d_sps_%d_fo_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.FreqOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'DPSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 8;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 1e6;
    % Channel.FreqOffset = 20;
    % Source.NumBitsPerFrame = 1000;
    % 
    % Common.SaveFileName = sprintf('p3_%s-%d_beta_%f_span_%d_sps_%d_fo_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.FreqOffset);
    % Common.NumWorkers = 6;
    % % End of Params
    % 
    % Encoder.isTransparent = true; % без кодирования
    % 
	% Mapper.isTransparent = false; 
    % Mapper.Type = 'DPSK';
	% Mapper.ModulationOrder = 4;
	% Mapper.DecisionMethod = 'Hard decision'; 
    % 
    % Sig.isTransparent = false;
    % Sig.beta = 0.2;
    % Sig.span = 8;
    % Sig.sps = 8;
    % 
	% Channel.isTransparent = false; 
    % Channel.Fs = 1e6;
    % Channel.FreqOffset = 50;
    % Source.NumBitsPerFrame = 1000;
    % 
    % Common.SaveFileName = sprintf('p3_%s-%d_beta_%f_span_%d_sps_%d_fo_%f',Mapper.Type,Mapper.ModulationOrder, Sig.beta,Sig.span,Sig.sps,Channel.FreqOffset);
    % Common.NumWorkers = 6;
    % % End of Params