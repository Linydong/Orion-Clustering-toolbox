function load1_Callback(hObject, eventdata, handles)
    [filename,path] = uigetfile('*.txt;*.csv;*.mat;*.xls;*.xlsb;*.xlsx','请选择一个数据文件','Data\4-D');
    file = fullfile(path,filename);
    if path ~= 0
    data = loadData(file);
    handles.show.load = 1;
    visible(hObject,handles,1,'on');        
    handles.show.panel1 = 1;
    handles.show.panel2 = 1;
    handles.data = data;
    images(handles.axes520,handles.theme.t31);
    if handles.show.panel3 == 1
        set(handles.panel3,'visible','off');
        set(handles.clustering,'string','CLUSTERING','BackgroundColor','#0072bd');
        handles.show.panel3 = 0;
        guidata(hObject, handles);
    end
        set(handles.pathText,'ForegroundColor','k','string',path,'style','edit');
    
        guidata(hObject, handles);
        %设置表格数据写到gui表格和坐标轴控件中
        set(handles.table1,'Data',handles.data);
        statistics(handles);
        plot_data(handles);
    end
end





