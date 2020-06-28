function K_means21_Callback1(hObject, eventdata, handles)
    if isempty(handles.data)
            load1_Callback(hObject, eventdata, handles);
    end
    if handles.map == 1
        Result(handles.mapdata,1,handles.show.language);
    else
        Result(handles.data,1,handles.show.language);
    end
end