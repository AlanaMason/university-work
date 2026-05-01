%---------------------------------SC , QAM - 16 ---------------------------

% Mapper.isTransparent = false;
% Channel.isTransparent = false;
% Encoder.isTransparent = true;
% Sig.isTransparent = false;
% 
% Encoder.CodeRate = 1;
% 
% Mapper.ModulationOrder = 16;
% Mapper.Type = 'QAM';
% Mapper.DecisionMethod = 'bit';
% 
% Sig.EnableMIMO = true;
% Sig.TypeOfDiversity = 'SIMO' ;
% Sig.MethodForSIMO = 'SC' ;
% Sig.MethodForMISO = 'none';
% Sig.MethodForMIMO = 'none';
% Sig.NumTransAnts = 1;
% Sig.NumResAnts = 1;
% 
% 
% Source.NumBitsPerFrame = 1000;
% 
% 
% BER.h2dBInit = 0;
% BER.h2dBMax = 30;
% BER.MinBER = 10^-3;
% Common.SaveFileName = 'SIMO, SC, nRx - 1, QAM-16';
% % End of Params


% Mapper.isTransparent = false;
% Channel.isTransparent = false;
% Encoder.isTransparent = true;
% Sig.isTransparent = false;
% 
% Encoder.CodeRate = 1;
% 
% Mapper.ModulationOrder = 16;
% Mapper.Type = 'QAM';
% Mapper.DecisionMethod = 'bit';
% 
% Sig.EnableMIMO = true;
% Sig.TypeOfDiversity = 'SIMO' ;
% Sig.MethodForSIMO = 'SC' ;
% Sig.MethodForMISO = 'none';
% Sig.MethodForMIMO = 'none';
% Sig.NumTransAnts = 1;
% Sig.NumResAnts = 2;
% 
% 
% Source.NumBitsPerFrame = 1000;
% 
% 
% BER.h2dBInit = 0;
% BER.h2dBMax = 30;
% BER.MinBER = 10^-3;
% Common.SaveFileName = 'SIMO, SC, nRx - 2, QAM-16';
% % End of Params
% 
% Mapper.isTransparent = false;
% Channel.isTransparent = false;
% Encoder.isTransparent = true;
% Sig.isTransparent = false;
% 
% Encoder.CodeRate = 1;
% 
% Mapper.ModulationOrder = 16;
% Mapper.Type = 'QAM';
% Mapper.DecisionMethod = 'bit';
% 
% Sig.EnableMIMO = true;
% Sig.TypeOfDiversity = 'SIMO' ;
% Sig.MethodForSIMO = 'SC' ;
% Sig.MethodForMISO = 'none';
% Sig.MethodForMIMO = 'none';
% Sig.NumTransAnts = 1;
% Sig.NumResAnts = 3;
% 
% 
% Source.NumBitsPerFrame = 1000;
% 
% 
% BER.h2dBInit = 0;
% BER.h2dBMax = 30;
% BER.MinBER = 10^-3;
% Common.SaveFileName = 'SIMO, SC, nRx - 3, QAM-16';
% % End of Params
% 
% Mapper.isTransparent = false;
% Channel.isTransparent = false;
% Encoder.isTransparent = true;
% Sig.isTransparent = false;
% 
% Encoder.CodeRate = 1;
% 
% Mapper.ModulationOrder = 16;
% Mapper.Type = 'QAM';
% Mapper.DecisionMethod = 'bit';
% 
% Sig.EnableMIMO = true;
% Sig.TypeOfDiversity = 'SIMO' ;
% Sig.MethodForSIMO = 'SC' ;
% Sig.MethodForMISO = 'none';
% Sig.MethodForMIMO = 'none';
% Sig.NumTransAnts = 1;
% Sig.NumResAnts = 4;
% 
% 
% Source.NumBitsPerFrame = 1000;
% 
% 
% BER.h2dBInit = 0;
% BER.h2dBMax = 30;
% BER.MinBER = 10^-3;
% Common.SaveFileName = 'SIMO, SC, nRx - 4, QAM-16';
% % End of Params



%---------------------------------SC , PSK - 4 ---------------------------

% Mapper.isTransparent = false;
% Channel.isTransparent = false;
% Encoder.isTransparent = true;
% Sig.isTransparent = false;
% 
% Encoder.CodeRate = 1;
% 
% Mapper.ModulationOrder = 4;
% Mapper.Type = 'PSK';
% Mapper.DecisionMethod = 'bit';
% 
% Sig.EnableMIMO = true;
% Sig.TypeOfDiversity = 'SIMO' ;
% Sig.MethodForSIMO = 'SC' ;
% Sig.MethodForMISO = 'none';
% Sig.MethodForMIMO = 'none';
% Sig.NumTransAnts = 1;
% Sig.NumResAnts = 1;
% 
% 
% Source.NumBitsPerFrame = 1000;
% 
% 
% BER.h2dBInit = 0;
% BER.h2dBMax = 30;
% BER.MinBER = 10^-3;
% Common.SaveFileName = 'SIMO, SC, nRx - 1, PSK-4';
% % End of Params


Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 4;
Mapper.Type = 'PSK';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'SC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 2;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, SC, nRx - 2, PSK-4';
% End of Params

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 4;
Mapper.Type = 'PSK';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'SC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 3;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, SC, nRx - 3, PSK-4';
% End of Params

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 4;
Mapper.Type = 'PSK';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'SC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 4;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, SC, nRx - 4, PSK-4';
% End of Params






%----------------------------------------------------EGC-------------------------
%---------------------------------EGC , QAM - 16 ---------------------------

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'EGC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 1;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, EGC, nRx - 1, QAM-16';
% End of Params


Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'EGC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 2;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, EGC, nRx - 2, QAM-16';
% End of Params

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'EGC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 3;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, EGC, nRx - 3, QAM-16';
% End of Params

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'EGC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 4;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, EGC, nRx - 4, QAM-16';
% End of Params



%---------------------------------EGC , PSK - 4 ---------------------------

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 4;
Mapper.Type = 'PSK';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'EGC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 1;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, EGC, nRx - 1, PSK-4';
% End of Params


Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 4;
Mapper.Type = 'PSK';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'EGC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 2;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, EGC, nRx - 2, PSK-4';
% End of Params

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 4;
Mapper.Type = 'PSK';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'EGC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 3;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, EGC, nRx - 3, PSK-4';
% End of Params

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 4;
Mapper.Type = 'PSK';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'EGC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 4;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, EGC, nRx - 4, PSK-4';
% End of Params




%----------------------------------------------------------M R C-------------

%---------------------------------MRC , QAM - 16 ---------------------------

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'MRC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 1;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, MRC, nRx - 1, QAM-16';
% End of Params


Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'MRC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 2;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, MRC, nRx - 2, QAM-16';
% End of Params

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'MRC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 3;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, MRC, nRx - 3, QAM-16';
% End of Params

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 16;
Mapper.Type = 'QAM';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'MRC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 4;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, MRC, nRx - 4, QAM-16';
% End of Params



%---------------------------------MRC , PSK - 4 ---------------------------

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 4;
Mapper.Type = 'PSK';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'MRC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 1;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, MRC, nRx - 1, PSK-4';
% End of Params


Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 4;
Mapper.Type = 'PSK';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'MRC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 2;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, MRC, nRx - 2, PSK-4';
% End of Params

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 4;
Mapper.Type = 'PSK';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'MRC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 3;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, MRC, nRx - 3, PSK-4';
% End of Params

Mapper.isTransparent = false;
Channel.isTransparent = false;
Encoder.isTransparent = true;
Sig.isTransparent = false;

Encoder.CodeRate = 1;

Mapper.ModulationOrder = 4;
Mapper.Type = 'PSK';
Mapper.DecisionMethod = 'bit';

Sig.EnableMIMO = true;
Sig.TypeOfDiversity = 'SIMO' ;
Sig.MethodForSIMO = 'MRC' ;
Sig.MethodForMISO = 'none';
Sig.MethodForMIMO = 'none';
Sig.NumTransAnts = 1;
Sig.NumResAnts = 4;


Source.NumBitsPerFrame = 1000;


BER.h2dBInit = 0;
BER.h2dBMax = 30;
BER.MinBER = 10^-3;
Common.SaveFileName = 'SIMO, MRC, nRx - 4, PSK-4';
% End of Params
