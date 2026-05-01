Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent=false;

Encoder.CoderType='Conv';
Encoder.DecisionType='Hard';
Encoder.CodeRate=1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod='bit';

Source.NumBitsPerFrame = 64;
Common.NumOneIterFrames = 1563;

BER.h2dBInit = 0;
Common.SaveFileName = 'Conv, Hard, 16-QAM, 32 BpF';
% End of Params

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent=false;

Encoder.CoderType='Conv';
Encoder.DecisionType='Hard';
Encoder.CodeRate=1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod='bit';

Source.NumBitsPerFrame = 100;
Common.NumOneIterFrames = 1000;

BER.h2dBInit = 0;
Common.SaveFileName = 'Conv, Hard, 16-QAM, 100 BpF';
% End of Params

% Mapper.isTransparent = false;
% Channel.isTransparent = false;
% Encoder.isTransparent=false;
% 
% Encoder.CoderType='Conv';
% Encoder.DecisionType='Hard';
% Encoder.CodeRate=1/2;
% 
% Mapper.ModulationOrder = 16;
% Mapper.Type = 'QAM';
% Mapper.DecisionMethod='bit';
% 
% Source.NumBitsPerFrame = 500;
% Common.NumOneIterFrames = 200;
% 
% BER.h2dBInit = 0;
% Common.SaveFileName = 'Conv, Hard, 16-QAM, 500 BpF';
% % End of Params
% 
% Mapper.isTransparent = false;
% Channel.isTransparent = false;
% Encoder.isTransparent=false;
% 
% Encoder.CoderType='Conv';
% Encoder.DecisionType='Hard';
% Encoder.CodeRate=1/2;
% 
% Mapper.ModulationOrder = 16;
% Mapper.Type = 'QAM';
% Mapper.DecisionMethod='bit';
% 
% Source.NumBitsPerFrame = 1000;
% Common.NumOneIterFrames = 100;
% 
% BER.h2dBInit = 0;
% Common.SaveFileName = 'Conv, Hard, 16-QAM, 1000 BpF';
% % End of Params
% 
% Mapper.isTransparent = false;
% Channel.isTransparent = false;
% Encoder.isTransparent=false;
% 
% Encoder.CoderType='Conv';
% Encoder.DecisionType='Hard';
% Encoder.CodeRate=1/2;
% 
% Mapper.ModulationOrder = 16;
% Mapper.Type = 'QAM';
% Mapper.DecisionMethod='bit';
% 
% Source.NumBitsPerFrame = 5000;
% Common.NumOneIterFrames = 200;
% 
% BER.h2dBInit = 0;
% Common.SaveFileName = 'Conv, Hard, 16-QAM, 5000 BpF';
% % End of Params