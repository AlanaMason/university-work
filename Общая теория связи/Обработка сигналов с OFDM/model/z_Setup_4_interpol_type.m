% End of Params
% EPA linear
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

Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'EPA';
Channel.maxDopplerShift = 5;

Sig.nCP = 1/128;  

Equalizer.EqualizerType = 'ZF';
Equalizer.InterpolationType = 'linear';
%Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'EPA5, linear';

% End of Params
% EVA linear
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

Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'EVA';
Channel.maxDopplerShift = 70;

Sig.nCP = 1/32;  

Equalizer.EqualizerType = 'ZF';
Equalizer.InterpolationType = 'linear';
%Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'EVA70, linear';

% End of Params
% ETU linear
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

Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'ETU';
Channel.maxDopplerShift = 300;

Sig.nCP = 1/16;  

Equalizer.EqualizerType = 'ZF';
Equalizer.InterpolationType = 'linear';
%Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'ETU300, linear';


% End of Params
% EPA spline
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

Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'EPA';
Channel.maxDopplerShift = 5;

Sig.nCP = 1/128;  

Equalizer.EqualizerType = 'ZF';
%Equalizer.InterpolationType = 'linear';
Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'EPA5, spline';

% End of Params
% EVA spline
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

Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'EVA';
Channel.maxDopplerShift = 70;

Sig.nCP = 1/32;  

Equalizer.EqualizerType = 'ZF';
%Equalizer.InterpolationType = 'linear';
Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'EVA70, spline';

% End of Params
% ETU spline
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

Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'ETU';
Channel.maxDopplerShift = 300;

Sig.nCP = 1/16;  

Equalizer.EqualizerType = 'ZF';
%Equalizer.InterpolationType = 'linear';
Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'ETU300, spline';


% End of Params
% EPA makima
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

Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'EPA';
Channel.maxDopplerShift = 5;

Sig.nCP = 1/128;  

Equalizer.EqualizerType = 'ZF';
%Equalizer.InterpolationType = 'linear';
Equalizer.InterpolationType = 'makima';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'EPA5, makima';

% End of Params
% EVA makima
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

Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'EVA';
Channel.maxDopplerShift = 70;

Sig.nCP = 1/32;  

Equalizer.EqualizerType = 'ZF';
%Equalizer.InterpolationType = 'linear';
Equalizer.InterpolationType = 'makima';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'EVA70, makima';

% End of Params
% ETU makima
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

Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'ETU';
Channel.maxDopplerShift = 300;

Sig.nCP = 1/16;  

Equalizer.EqualizerType = 'ZF';
%Equalizer.InterpolationType = 'linear';
Equalizer.InterpolationType = 'makima';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'ETU300, makima';


% End of Params
% EPA pchip
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

Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'EPA';
Channel.maxDopplerShift = 5;

Sig.nCP = 1/128;  

Equalizer.EqualizerType = 'ZF';
%Equalizer.InterpolationType = 'linear';
Equalizer.InterpolationType = 'pchip';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'EPA5, pchip';

% End of Params
% EVA pchip
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

Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'EVA';
Channel.maxDopplerShift = 70;

Sig.nCP = 1/32;  

Equalizer.EqualizerType = 'ZF';
%Equalizer.InterpolationType = 'linear';
Equalizer.InterpolationType = 'pchip';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'EVA70, pchip';

% End of Params
% ETU pchip
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

Encoder.CoderType = 'Conv';
Encoder.DecisionType = 'Hard';
Encoder.CodeRate = 1/2;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'Hard decision';
Channel.ChannelType = 'ETU';
Channel.maxDopplerShift = 300;

Sig.nCP = 1/16;  

Equalizer.EqualizerType = 'ZF';
%Equalizer.InterpolationType = 'linear';
Equalizer.InterpolationType = 'pchip';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'ETU300, pchip';
