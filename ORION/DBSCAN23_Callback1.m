function DBSCAN23_Callback1(hObject, eventdata, handles)
    if isempty(handles.data)
            load1_Callback(hObject, eventdata, handles);
    else
        if handles.map == 1
            Result(handles.mapdata,3,handles.show.language);
        else
            Result(handles.data,3,handles.show.language);
        end
    end
end