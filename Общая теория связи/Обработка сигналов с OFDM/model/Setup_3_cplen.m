% End of Params
% EPA 1/128 CP
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
Common.SaveFileName = 'EPA5, 16 CP';

% End of Params
% EVA 1/128 CP
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

Sig.nCP = 1/128;  

Equalizer.EqualizerType = 'ZF';
Equalizer.InterpolationType = 'linear';
%Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'EVA70, 16 CP';

% End of Params
% ETU 1/128 CP
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

Sig.nCP = 1/128;  

Equalizer.EqualizerType = 'ZF';
Equalizer.InterpolationType = 'linear';
%Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'ETU300, 16 CP';

% End of Params
% EPA 1/32 CP
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

Sig.nCP = 1/32;  

Equalizer.EqualizerType = 'ZF';
Equalizer.InterpolationType = 'linear';
%Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'EPA5, 64 CP';

% End of Params
% EVA 1/32 CP
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
Common.SaveFileName = 'EVA70, 64 CP';

% End of Params
% ETU 1/32 CP
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

Sig.nCP = 1/32;  

Equalizer.EqualizerType = 'ZF';
Equalizer.InterpolationType = 'linear';
%Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'ETU300, 64 CP';

% End of Params
% EPA 1/16 CP
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

Sig.nCP = 1/16;  

Equalizer.EqualizerType = 'ZF';
Equalizer.InterpolationType = 'linear';
%Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'EPA5, 128 CP';

% End of Params
% EVA 1/16 CP
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

Sig.nCP = 1/16;  

Equalizer.EqualizerType = 'ZF';
Equalizer.InterpolationType = 'linear';
%Equalizer.InterpolationType = 'spline';


Source.NumBitsPerFrame = 10000;
Common.NumOneIterFrames = 100;

BER.h2dBInit = 0;
BER.h2dBMax = 40;
Common.SaveFileName = 'EVA70, 128 CP';

% End of Params
% ETU 1/16 CP
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
Common.SaveFileName = 'ETU300, 128 CP';