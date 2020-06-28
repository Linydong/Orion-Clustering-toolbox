function varargout = ORION(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ORION_OpeningFcn, ...
                   'gui_OutputFcn',  @ORION_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% 初始化代码，别改动

% --- Executes just before ORION is made visible.
function ORION_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    guidata(hObject, handles);
    handles.theme.t1 = 'Logos/icon1.jpg';
    handles.theme.t11 = 'Logos/icon11.jpg';
    handles.theme.t2 = 'Logos/icon2.jpg';
    handles.theme.t2e = 'Logos/icon2e.jpg';
    handles.theme.t21 = 'Logos/icon21.jpg';
    handles.theme.t3 = 'Logos/icon3.jpg';
    handles.theme.t3e = 'Logos/icon3e.jpg';
    handles.theme.t31 = 'Logos/icon31.jpg';
    handles.show.theme.startimage = 'Logos/icon0.jpg';
    handles.show.panel1 = 0;
    handles.show.panel2 = 0;
    handles.show.panel3 = 0;
    handles.show.load = 0;
    handles.map = 0;
    handles.show.language = 'English';
    handles.data = [];
    images(handles.axes520,handles.show.theme.startimage);
    pause(1);
    images(handles.axes520,handles.theme.t3e); 
    
    a = 'Logos/a.jpg';
    images(handles.axes21,a);
    
    b = 'Logos/b.jpg';
    images(handles.axes22,b);
    
    c = 'Logos/c.jpg';
    images(handles.axes23,c);
    
    set(handles.load,'visible','on');
    set(handles.save,'visible','on');
    set(handles.path,'visible','on');
    set(handles.pathText,'visible','on');
    set(handles.help,'visible','on');
    set(handles.lang,'visible','on');
    set(handles.clustering,'visible','on');
    set(handles.normalized,'visible','on');
    handles.color = '#5981b6';
    buttonColor(handles,handles.color);
    guidata(hObject, handles);
    
% --- Outputs from this function are returned to the command line.
function varargout = ORION_OutputFcn(hObject, evEnglishtdata, handles) 

function path_Callback(hObject, eventdata, handles)
    winopen 'Data';

% --- Executes during object creation, after lang all properties.
function pathText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function table1_CreateFcn(hObject, eventdata, handles)

% --- Executes on button press in path.
function pathButton_Callback(hObject, eventdata, handles)

% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
    load1_Callback(hObject, eventdata, handles);

% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
    winopen 'help.txt';
    
% --- Executes on button press in clustering.
function clustering_Callback(hObject, eventdata, handles)
clustering1_Callback(hObject, eventdata, handles);

% --- Executes during object deletion, before destroying properties.
function clustering_DeleteFcn(hObject, eventdata, handles)


function pathText_Callback(hObject, eventdata, handles)


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)



% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
    data = handles.data;
    if isempty(data)
        if strcmp(handles.show.language,'English')
            warndialog('There is no data set.','WARNING','modal');
        else
            warndialog('工作区没有载入数据！','警告','modal');
        end
    else
        uisave('data','Orion_.mat');
    end


% --- Executes on button press in lang.
function lang_Callback(hObject, eventdata, handles)
lang1_Callback(hObject, eventdata, handles);

% --- Executes on button press in hiden.
function hiden_Callback(hObject, eventdata, handles)
h =  rand(1);
if h>0.66
    color = '#0072bd';
else
    if h >0.33
        color = '#ffff00';
    else
        color = '#00ff00';
    end
end
set(handles.K_means21,'BackgroundColor',color);
set(handles.ACH24,'BackgroundColor',color);
set(handles.DBSCAN23,'BackgroundColor',color);


% --- Executes on button press in DBSCAN23.
function DBSCAN23_Callback(hObject, eventdata, handles) 
DBSCAN23_Callback1(hObject, eventdata, handles) ;
  


% --- Executes on button press in ACH24.
function ACH24_Callback(hObject, eventdata, handles)
ACH24_Callback1(hObject, eventdata, handles);


% --- Executes on button press in K_means21.
function K_means21_Callback(hObject, eventdata, handles)
K_means21_Callback1(hObject, eventdata, handles);



% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)



% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
ctrl=eventdata.Modifier;
if isempty(ctrl)
    ctrl = '';
else
    ctrl = ctrl{1};
end
key = eventdata.Key;
switch ctrl
    case 'control'
        switch key
            case 'o' 
                load1_Callback(hObject, eventdata, handles);
            case 's'
                data = handles.data;
                if isempty(data)
                    if strcmp(handles.show.language,'English')
                        warndialog('There is no data set.','WARNING','modal');
                    else
                        warndialog('工作区没有载入数据！','警告','modal');
                    end
                else
                    uisave('data','Orion.mat');
                end
            case 'h'
                 winopen 'help.txt';
            case 'l'
                lang1_Callback(hObject, eventdata, handles);
            case 'c'
                clustering1_Callback(hObject, eventdata, handles);
            case 'k'
                K_means21_Callback1(hObject, eventdata, handles);
            case 'a'
                ACH24_Callback1(hObject, eventdata, handles);
            case 'd'
                 DBSCAN23_Callback1(hObject, eventdata, handles);
        end
end
guidata(hObject, handles);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
delete(gcf);


% --- Executes on button press in normalized.
function normalized_Callback(hObject, eventdata, handles)
    X = handles.data;
    if isempty(X)
        if strcmp(handles.show.language,'English')
            warndialog('There is no data set.','WARNING','modal');
        else
            warndialog('工作区没有载入数据！','警告','modal');
        end
    else
        if handles.map == 0
            [X,~]=mapminmax(X');
            X = X';
            handles.mapdata = X;
            set(handles.table1,'Data',handles.mapdata);
            plot_data(handles,1);
            handles.map = 1;
        else
            set(handles.table1,'Data',handles.data);
            plot_data(handles);
            handles.map = 0;
        end
            guidata(hObject, handles);
    end
