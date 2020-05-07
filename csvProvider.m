function csvProvider(V, filename, label1, label2, valType)
    range = 1 : length(V);
    
    fileID = fopen(filename, 'w');
    fprintf(fileID, [label1, ',', label2, '\n']);
    
    for i = range
        fprintf(fileID, ['%d,', valType, '\n'], i, V(i));
    end
    fclose(fileID);
end

