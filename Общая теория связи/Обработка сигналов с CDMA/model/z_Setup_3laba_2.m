Source.NumBitsPerFrame = 38400 / 256 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 256;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'EPA';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'EPA, Expansion = 256';
Common.SaveDirName = 'punkt2_EPA';

% End of Params

Source.NumBitsPerFrame = 38400 / 128 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 128;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'EPA';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'EPA, Expansion 128';
Common.SaveDirName = 'punkt2_EPA';

% End of Params


Source.NumBitsPerFrame = 38400 / 64 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 256;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'EPA';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'EPA, Expansion 64';
Common.SaveDirName = 'punkt2_EPA';

% End of Params


Source.NumBitsPerFrame = 38400 / 32 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 2;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'EPA';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'EPA, Expansion 32';
Common.SaveDirName = 'punkt2_EPA';

% End of Params


Source.NumBitsPerFrame = 38400 / 16 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 16 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 16;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'EPA';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'EPA, Expansion 16';
Common.SaveDirName = 'punkt2_EPA';

% End of Params


Source.NumBitsPerFrame = 38400 / 8 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 8 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 8;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'EPA';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'EPA, Expansion 8';
Common.SaveDirName = 'punkt2_EPA';

% End of Params


%-----------------------------------------EVA CHANNEL-----------------------


Source.NumBitsPerFrame = 38400 / 256 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 256;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'EVA';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'EVA, Expansion 256';
Common.SaveDirName = 'punkt2_EVA';

% End of Params

Source.NumBitsPerFrame = 38400 / 128 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 128;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'EVA';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'EVA, Expansion 128';
Common.SaveDirName = 'punkt2_EVA';

% End of Params


Source.NumBitsPerFrame = 38400 / 64 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 256;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'EVA';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'EVA, Expansion 64';
Common.SaveDirName = 'punkt2_EVA';

% End of Params


Source.NumBitsPerFrame = 38400 / 32 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 2;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'EVA';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'EVA, Expansion 32';
Common.SaveDirName = 'punkt2_EVA';

% End of Params


Source.NumBitsPerFrame = 38400 / 16 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 16 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 16;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'EVA';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'EVA, Expansion 16';
Common.SaveDirName = 'punkt2_EVA';

% End of Params


Source.NumBitsPerFrame = 38400 / 8 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 8 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 8;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'EVA';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'EVA, Expansion 8';
Common.SaveDirName = 'punkt2_EVA';

% End of Params






%---------------------------------------ETU CHANNEl-----------------------
Source.NumBitsPerFrame = 38400 / 256 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 256;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'ETU';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'ETU, Expansion 256';
Common.SaveDirName = 'punkt2_ETU';

% End of Params

Source.NumBitsPerFrame = 38400 / 128 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 128;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'ETU';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'ETU, Expansion 128';
Common.SaveDirName = 'punkt2_ETU';

% End of Params


Source.NumBitsPerFrame = 38400 / 64 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 256;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'ETU';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'ETU, Expansion 64';
Common.SaveDirName = 'punkt2_ETU';

% End of Params


Source.NumBitsPerFrame = 38400 / 32 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 2;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'ETU';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'ETU, Expansion 32';
Common.SaveDirName = 'punkt2_ETU';

% End of Params


Source.NumBitsPerFrame = 38400 / 16 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 16 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 16;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'ETU';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'ETU, Expansion 16';
Common.SaveDirName = 'punkt2_ETU';

% End of Params


Source.NumBitsPerFrame = 38400 / 8 * 2;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 8 * 2;

Mapper.isTransparent = false;
Mapper.Type = 'PSK';
Mapper.ModulationOrder = 4;

Sig.isTransparent = false;
Sig.Expansion = 8;
Sig.EqualizerOn = true;
Sig.ScramblerOn = true;

Channel.isTransparent = false;
Channel.FadingType = 'ETU';


BER.h2dBInitStep = 1;   BER.h2dBMax = 30;
BER.h2dBMaxStep = 3;


Common.SaveFileName = 'ETU, Expansion 8';
Common.SaveDirName = 'punkt2_ETU';

% End of Params