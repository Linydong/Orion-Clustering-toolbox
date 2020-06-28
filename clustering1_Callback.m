function clustering1_Callback(hObject, eventdata, handles)
        if  handles.show.panel3 == 0
            set(handles.panel3,'visible','on');
            handles.show.panel3 = 1;
            if strcmp(handles.show.language,'English')
                set(handles.clustering,'string','CLOSE','BackgroundColor','r');
            else
                set(handles.clustering,'string','πÿ±’','BackgroundColor','r');
            end
            guidata(hObject, handles);
        else
            set(handles.panel3,'visible','off');
            if strcmp(handles.show.language,'English')
                set(handles.clustering,'string','CLUSTERING','BackgroundColor',handles.color);
            else
                set(handles.clustering,'string','æ€¿‡À„∑®','BackgroundColor',handles.color);
            end
            handles.show.panel3 = 0;
            guidata(hObject, handles);
        end