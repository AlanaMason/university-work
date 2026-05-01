% 
% % 3 test, PSK-4 
% 
% 
% Source.NumBitsPerFrame = 300;
% 
% Interleaver.isTransparent = true;
% Interleaver.N = 38400 / 256 * 2;
% 
% Mapper.isTransparent = false;
% Mapper.ModulationOrder = 4;   
% Mapper.Type = 'PSK';
% 
% 
% Sig.isTransparent = false;
% Sig.Expansion = 256;
% Sig.EqualizerOn = true;
% Sig.ScramblerOn = true;
% 
% Channel.isTransparent = false;
% Channel.FadingType = 'EPA';
% Channel.DopplerShift = 5;
% 
% 
% Common.SaveFileName = 'EPA Scr';
% 
% 
% 
% % End of Params
% % 3 test, PSK-4 
% 
% 
% Source.NumBitsPerFrame = 300;
% 
% Interleaver.isTransparent = true;
% Interleaver.N = 38400 / 256 * 2;
% 
% Mapper.isTransparent = false;
% Mapper.ModulationOrder = 4;  
% Mapper.Type = 'PSK';
% 
% Sig.isTransparent = false;
% Sig.Expansion = 256;
% Sig.EqualizerOn = true;
% Sig.ScramblerOn = true;
% 
% Channel.isTransparent = false;
% Channel.FadingType = 'EVA';
% Channel.DopplerShift = 5;
% 
% 
% Common.SaveFileName = 'EVA Scr';
% 
% 
% % End of Params
% % 3 test, PSK-4 
% 
% Source.NumBitsPerFrame = 300;
% 
% Interleaver.isTransparent = true;
% Interleaver.N = 38400 / 256 * 2;
% 
% Mapper.isTransparent = false;
% Mapper.ModulationOrder = 4;  
% Mapper.Type = 'PSK';
% 
% Sig.isTransparent = false;
% Sig.Expansion = 256;
% Sig.EqualizerOn = true;
% Sig.ScramblerOn = true;
% 
% Channel.isTransparent = false;
% Channel.FadingType = 'ETU';
% Channel.DopplerShift = 5;
% 
% 
% Common.SaveFileName = 'ETU Scr';
% 
% 
% 
% % End of Params
% 3 test, PSK-4 



Source.NumBitsPerFrame = 300;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.ModulationOrder = 4;  
Mapper.Type = 'PSK';

Sig.isTransparent = false;
Sig.Expansion = 256;
Sig.EqualizerOn = true;
Sig.ScramblerOn = false;

Channel.isTransparent = false;
Channel.FadingType = 'EPA';
Channel.DopplerShift = 5;
BER.h2dBInitStep = 1;   
BER.h2dBMaxStep = 3;
BER.h2dBInit = 15;
BER.h2dBMax = 30;

Common.SaveFileName = 'EPA Without Scr';



% End of Params
% 3 test, PSK-4 

Source.NumBitsPerFrame = 300;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.ModulationOrder = 4;  
Mapper.Type = 'PSK';

Sig.isTransparent = false;
Sig.Expansion = 256;
Sig.EqualizerOn = true;
Sig.ScramblerOn = false;

Channel.isTransparent = false;
Channel.FadingType = 'EVA';
Channel.DopplerShift = 5;


Common.SaveFileName = 'EVA Without Scr';


% End of Params
% 3 test, PSK-4 


Source.NumBitsPerFrame = 300;

Interleaver.isTransparent = true;
Interleaver.N = 38400 / 256 * 2;

Mapper.isTransparent = false;
Mapper.ModulationOrder = 4;  
Mapper.Type = 'PSK';

Sig.isTransparent = false;
Sig.Expansion = 256;
Sig.EqualizerOn = true;
Sig.ScramblerOn = false;

Channel.isTransparent = false;
Channel.FadingType = 'ETU';
Channel.DopplerShift = 5;


Common.SaveFileName = 'ETU Without Scr';