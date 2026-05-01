% End of Params
% EPA 200 pilot
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
Common.SaveFileName = 'EPA5, 200 pilotnum';

% End of Params
% EVA 200 pilotnum
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
Common.SaveFileName = 'EVA70, 200 pilotnum';

% End of Params
% ETU 200 pilotnum
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
Common.SaveFileName = 'ETU300, 200 pilotnum';


% End of Params
% EPA 50 pilot
OFDMPattern.isTransparent = false;
Encoder.isTransparent = false;
Interleaver.isTransparent = false;
Mapper.isTransparent = false;
Sig.isTransparent = false;
Channel.isTransparent = false;
Equalizer.isTransparent = false;

OFDMPattern.NFFt = 2048;
OFDMPattern.PilotNum = 50;
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
Common.SaveFileName = 'EPA5, 50 pilotnum';

% End of Params
% EVA 50 pilotnum
OFDMPattern.isTransparent = false;
Encoder.isTransparent = false;
Interleaver.isTransparent = false;
Mapper.isTransparent = false;
Sig.isTransparent = false;
Channel.isTransparent = false;
Equalizer.isTransparent = false;

OFDMPattern.NFFt = 2048;
OFDMPattern.PilotNum = 50;
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
Common.SaveFileName = 'EVA70, 50 pilotnum';

% End of Params
% ETU 50 pilotnum
OFDMPattern.isTransparent = false;
Encoder.isTransparent = false;
Interleaver.isTransparent = false;
Mapper.isTransparent = false;
Sig.isTransparent = false;
Channel.isTransparent = false;
Equalizer.isTransparent = false;

OFDMPattern.NFFt = 2048;
OFDMPattern.PilotNum = 50;
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
Common.SaveFileName = 'ETU300, 50 pilotnum';


% End of Params
% EPA 350 pilot
OFDMPattern.isTransparent = false;
Encoder.isTransparent = false;
Interleaver.isTransparent = false;
Mapper.isTransparent = false;
Sig.isTransparent = false;
Channel.isTransparent = false;
Equalizer.isTransparent = false;

OFDMPattern.NFFt = 2048;
OFDMPattern.PilotNum = 350;
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
Common.SaveFileName = 'EPA5, 350 pilotnum';

% End of Params
% EVA 350 pilotnum
OFDMPattern.isTransparent = false;
Encoder.isTransparent = false;
Interleaver.isTransparent = false;
Mapper.isTransparent = false;
Sig.isTransparent = false;
Channel.isTransparent = false;
Equalizer.isTransparent = false;

OFDMPattern.NFFt = 2048;
OFDMPattern.PilotNum = 350;
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
Common.SaveFileName = 'EVA70, 350 pilotnum';

% End of Params
% ETU 350 pilotnum
OFDMPattern.isTransparent = false;
Encoder.isTransparent = false;
Interleaver.isTransparent = false;
Mapper.isTransparent = false;
Sig.isTransparent = false;
Channel.isTransparent = false;
Equalizer.isTransparent = false;

OFDMPattern.NFFt = 2048;
OFDMPattern.PilotNum = 350;
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
Common.SaveFileName = 'ETU300, 350 pilotnum';