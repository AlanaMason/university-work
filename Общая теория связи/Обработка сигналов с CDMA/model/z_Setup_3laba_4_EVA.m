% 1 test, QAM-16 


Interleaver.isTransparent = false;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.ModulationOrder = 4;

CDMA.isTransparent = false;
CDMA.isNOTEQ = false;
CDMA.isNOTScramb = false;
CDMA.RayCount = 1;

Channel.isTransparent = false;
Channel.FadingType = 'EVA';
Channel.DopplerShift = 70;

Common.SaveFileName = 'EVA, Ray = 1';

% End of Params
% 2 test, QAM-16 

Interleaver.isTransparent = false;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.ModulationOrder = 4;

CDMA.isTransparent = false;
CDMA.isNOTEQ = false;
CDMA.isNOTScramb = false;
CDMA.RayCount = 2;

Channel.isTransparent = false;
Channel.FadingType = 'EVA';
Channel.DopplerShift = 70;

Common.SaveFileName = 'EVA, Ray = 2';

% End of Params
% 3 test, QAM-16 

Interleaver.isTransparent = false;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.ModulationOrder = 4;

CDMA.isTransparent = false;
CDMA.isNOTEQ = false;
CDMA.isNOTScramb = false;
CDMA.RayCount = 3;

Channel.isTransparent = false;
Channel.FadingType = 'EVA';
Channel.DopplerShift = 70;

Common.SaveFileName = 'EVA, Ray = 3';

% End of Params
% 3 test, QAM-16 

Source.NumBitsPerFrame = 38400 / 256 * 2;

Interleaver.isTransparent = false;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.ModulationOrder = 4;

CDMA.isTransparent = false;
CDMA.isNOTEQ = false;
CDMA.isNOTScramb = false;
CDMA.RayCount = 4;

Channel.isTransparent = false;
Channel.FadingType = 'EVA';
Channel.DopplerShift = 70;

Common.SaveFileName = 'EVA, Ray = 4';