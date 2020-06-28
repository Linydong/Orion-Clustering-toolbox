function data = loadData(file)
if strcmp(file(end-3:end),'.mat')
    Y = load(file);
else
    if strcmp(file(end-4:end-1),'.xls')
        Y = xlsread(file);
    else
    Y = uiimport(file);
    end
end
    names = fieldnames(Y);
    data = getfield(Y,names{1});
    for num = 2:length(names)
        data = [data getfield(Y,names{num})];
    end
end

