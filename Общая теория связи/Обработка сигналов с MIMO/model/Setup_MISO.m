Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 4;
Mapper.Type = 'PSK';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'MIMO' ;
Sig.MethodForSIMO = 'none' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'MMSE-SIC-OO';
Sig.NumTransAnts = 2;
Sig.NumResAnts = 2;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'MIMO, MMSE-SIC-OO, PSK - 4';
% End of Params
