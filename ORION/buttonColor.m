function buttonColor(handles,color)

    set(handles.load,'BackgroundColor',color);
    set(handles.save,'BackgroundColor',color);
    set(handles.path,'BackgroundColor',color);
%     set(handles.pathText,'BackgroundColor',color);
    set(handles.help,'BackgroundColor',color);
    set(handles.lang,'BackgroundColor',color);
    set(handles.clustering,'BackgroundColor',color);
    set(handles.normalized,'BackgroundColor',color);
    
    set(handles.textD11,'BackgroundColor',color);
    set(handles.textD21,'BackgroundColor',color);
    set(handles.textD31,'BackgroundColor',color);
    set(handles.textD41,'BackgroundColor',color);
    set(handles.textD51,'BackgroundColor',color);
    set(handles.textD61,'BackgroundColor',color);
    set(handles.textD71,'BackgroundColor',color);
end