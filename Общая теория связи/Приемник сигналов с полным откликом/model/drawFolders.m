function drawFolders(folderList,sortByDate, subPlotNum ,lineParams ,colorParams)
    
    if nargin < 2
        sortByDate = false;
    end

    if nargin < 3
        subPlotNum = 1;
    end

    if nargin < 4
        lineParams = [];
    end

    if nargin < 5
        colorParams = [];
    end


    
    for searchN = 1:length(folderList)
        temp = dir(sprintf("Results/%s",folderList(searchN)));
        
        DrawBERAndFER_extended(temp(1).folder,lineParams,colorParams,sortByDate, subPlotNum)
    end
end