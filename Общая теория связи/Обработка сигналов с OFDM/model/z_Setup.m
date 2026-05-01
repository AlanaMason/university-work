% OFDMPattern.isTransparent = false;
% Encoder.isTransparent = false;
% Interleaver.isTransparent = false;
% Mapper.isTransparent = false;
% Sig.isTransparent = false;
% Channel.isTransparent = false;
% Equalizer.isTransparent = false;
% 
% OFDMPattern.NFFt = 2048;
% OFDMPattern.PilotStep = 10;
% OFDMPattern.PilotModulationType = 'PSK';
% OFDMPattern.PilotModulationOrdder = 2;
% OFDMPattern.PilotPhaseOffset = 0;
% OFDMPattern.PilotSymbolMapping = 'Gray';
% OFDMPattern.TOFDM = 100e-6;
% OFDMPattern.FreqGuard = 184;
% 
% Interleaver.BlockLength = 100;
% 
% Encoder.CoderType = 'Conv';
% Encoder.DecisionType = 'Hard';
% Encoder.CodeRate = 1/2;
% 
% Mapper.ModulationOrder = 16;
% Mapper.Type = 'QAM';
% Mapper.DecisionMethod = 'Hard decision';
% 
% Channel.ChannelType = 'EPA';
% Channel.maxDopplerShift = 5;
% 
% Sig.nCP = 1/128;       
% 
% Equalizer.EqualizerType = 'ZF';
% Equalizer.InterpolationType = 'linear';
% 
% 
% Source.NumBitsPerFrame = 10000;
% Common.NumOneIterFrames = 100;
% BER.h2dBInit = 0;
% BER.h2dBMax = 40;
% Common.SaveFileName = 'EPA';
% 
% %End of Params

% OFDMPattern.isTransparent = false;
% Encoder.isTransparent = false;
% Interleaver.isTransparent = false;
% Mapper.isTransparent = false;
% Sig.isTransparent = false;
% Channel.isTransparent = false;
% Equalizer.isTransparent = false;
% 
% 
% OFDMPattern.NFFt = 2048;
% OFDMPattern.PilotStep = 10;
% OFDMPattern.PilotModulationType = 'PSK';
% OFDMPattern.PilotModulationOrdder = 2;
% OFDMPattern.PilotPhaseOffset = 0;
% OFDMPattern.PilotSymbolMapping = 'Gray';
% OFDMPattern.TOFDM = 100e-6;
% OFDMPattern.FreqGuard = 184;
% 
% Interleaver.BlockLength = 100;
% % 
% Encoder.CoderType = 'Conv';
% Encoder.DecisionType = 'Hard';
% Encoder.CodeRate = 1/2;
% 
% Mapper.ModulationOrder = 16;
% Mapper.Type = 'QAM';
% Mapper.DecisionMethod = 'Hard decision';
% Channel.ChannelType = 'EVA';
% Channel.maxDopplerShift = 70;
% 
% Sig.nCP = 1/32; %еще поменять на приемлемую длину
% 
% Equalizer.EqualizerType = 'ZF';
% Equalizer.InterpolationType = 'linear';
% %Equalizer.InterpolationType = 'makima';
% 
% Source.NumBitsPerFrame = 10000;
% Common.NumOneIterFrames = 100;
% 
% BER.h2dBInit = 0;
% BER.h2dBMax = 40;
% Common.SaveFileName = 'AWGN, second enc';
% 
% %End of Params

% OFDMPattern.isTransparent = false;
% Encoder.isTransparent = false;
% Interleaver.isTransparent = false;
% Mapper.isTransparent = false;
% Sig.isTransparent = false;
% Channel.isTransparent = false;
% Equalizer.isTransparent = false;
% 
% 
% OFDMPattern.NFFt = 2048;
% OFDMPattern.PilotStep = 5;
% OFDMPattern.PilotModulationType = 'PSK';
% OFDMPattern.PilotModulationOrdder = 2;
% OFDMPattern.PilotPhaseOffset = 0;
% OFDMPattern.PilotSymbolMapping = 'Gray';
% OFDMPattern.TOFDM = 100e-6;
% OFDMPattern.FreqGuard = 184;
% 
% Interleaver.BlockLength = 100;
% % 
% Encoder.CoderType = 'Conv';
% Encoder.DecisionType = 'Hard';
% Encoder.CodeRate = 1/2;
% 
% Mapper.ModulationOrder = 16;
% Mapper.Type = 'QAM';
% Mapper.DecisionMethod = 'Hard decision';
% Channel.ChannelType = 'ETU';
% Channel.maxDopplerShift = 300;
% 
% Sig.nCP = 1/16;  
% 
% Equalizer.EqualizerType = 'ZF';
% Equalizer.InterpolationType = 'linear';
% %Equalizer.InterpolationType = 'spline';
% 
% 
% Source.NumBitsPerFrame = 10000;
% Common.NumOneIterFrames = 100;
% 
% BER.h2dBInit = 0;
% BER.h2dBMax = 40;
% Common.SaveFileName = 'ETU 300';
% 
% %End of Params

OFDMPattern.isTransparent = false;
Encoder.isTransparent = false;
Interleaver.isTransparent = false;
Mapper.isTransparent = false;
Sig.isTransparent = false;
Channel.isTransparent = false;
Equalizer.isTransparent = false;


OFDMPattern.NFFt = 2048;
OFDMPattern.PilotNum = 200;
OFDMPattern.PilotModulationType = 'PSK';
OFDMPattern.PilotModulationOrdder = 2;
OFDMPattern.PilotPhaseOffset = 0;
OFDMPattern.PilotSymbolMapping = 'Gray';
OFDMPattern.TOFDM = 100e-6;
OFDMPattern.FreqGuard = 200;

%Interleaver.BlockLength = 100;
% 
Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'ETU';
Channel.maxDopplerShift = 0;

Sig.nCP = 1/128;  

Equalizer.EqualizerType = 'ZF';
Equalizer.InterpolationType = 'linear';
%Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'ETU 300';

%End of Params