function visible(hObject,handles,panel,state)
switch panel
    case 1
        set(handles.table1,'visible',state);
        set(handles.axes11,'visible',state);
        set(handles.panel2,'visible',state);
        set(handles.panel1,'visible',state);

end

        


end