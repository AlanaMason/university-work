function moveFiles(searchList,folderList)

for searchN = 1:length(searchList)
    if ~isfolder(sprintf("Results/%s",folderList(searchN)))
        mkdir(sprintf("Results/%s",folderList(searchN)))
    end
    
    temp = dir(sprintf("Results/*%s*",searchList(searchN)));
    for i = 1:length(temp)
        movefile(sprintf("Results/%s",temp(i).name), sprintf("Results/%s",folderList(searchN)));
    end
end
