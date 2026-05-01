
% 1 test, QAM-16 

Mapper.isTransparent = false;
Mapper.ModulationOrder = 4;

CDMA.isTransparent = false;

Channel.isTransparent = false;

Common.SaveFileName = 'QPSK';


% End of Params

% 1 test, QAM-16 

Source.NumBitsPerFrame = 38400 / 256 * 4;

Mapper.isTransparent = false;
Mapper.ModulationOrder = 16;

CDMA.isTransparent = false;

Channel.isTransparent = false;

Common.SaveFileName = '16-QAM';
