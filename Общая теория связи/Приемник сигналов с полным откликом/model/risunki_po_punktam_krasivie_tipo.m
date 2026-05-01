% searchListMove и folderListMove нужны чтобы распихать файлы содержащие searchListMove
% в соответствующие папки folderListMove
% 
% folderList - папки из которых рисовать
% 
% lineParams - параметры линий, которые будут циклически менятся при рисовании
% 
% colorParams - аналагично lineParams, но для цвета
% 
% второй аргумет drawFolders - sortByDate. Если true, то файлы будут
% отсортированы по дате при рисовании
%
% третий аргумент drawFolders - subPlotNum. Количество подграфиков по
% горизонтали, ряд только 1, можно сделать задание и по вертикали, но мне
% лень и не надо вроде

%% 1
searchListMove = ["p1_1" "p1_2" "p1_3"];
folderListMove = ["1_1"   "1_2" "1_3" ];

moveFiles(searchListMove,folderListMove)

%% 1.1 1.2
folderList = ["1_1" "1_2"];
lineParams = ["-" "--" ":"];
colorParams = ["r" "r" "r" "g" "g" "g" "b" "b" "b"];

% вариант для sortByDate = false
%lineParams = ["-" "-" "-" "--" "--" "--" ":" ":" ":"]; 
%colorParams = ["r" "g" "b"];

drawFolders(folderList, true, 2,lineParams,colorParams)

%% 1.3
drawFolders("1_3", true, 2);

%% 2
searchListMove = ["p2_1" "p2_2"];
folderListMove = ["2_1"   "2_2"];

moveFiles(searchListMove,folderListMove)

%% 2.1
folderList = ["2_1"];
%lineParams = ["-" "--" ":"];
%colorParams = ["r" "r" "r" "g" "g" "g" "b" "b" "b"];

% вариант для sortByDate = false
lineParams = ["-" "-" "-" "--" "--" "--" ":" ":" ":"]; 
colorParams = ["r" "g" "b"];

drawFolders(folderList, false, 2, lineParams, colorParams)

%% 2.2

drawFolders("2_2", true, 2);

%% 3
searchListMove = ["p3_"];
folderListMove = ["3"  ];

moveFiles(searchListMove,folderListMove)

folderList = ["3"];

lineParams = ["-" "-" "-" "--" "--" "--"];
colorParams = [];

drawFolders(folderList, false, 1, lineParams, colorParams)
