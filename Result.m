function varargout = Result(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Result_OpeningFcn, ...
                   'gui_OutputFcn',  @Result_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before Result is made visible.
function Result_OpeningFcn(hObject, eventdata, handles, varargin)
handles.data = varargin{1};
method = varargin{2};
handles.language = varargin{3};
handles.method = method;
handles.output = hObject;
guidata(hObject, handles);
if strcmp(handles.language,'English')
   set(handles.text7,'string','DATA with Lables'); 
   set(handles.text8,'string','RESULT Figure'); 
   set(handles.text9,'string','PARAMETER Figure'); 
   set(handles.text22,'string','INDICATORS OF Result'); 
   set(handles.text13,'string','DESCRIPTION'); 
   set(handles.panel1,'Title','ANALYSIS and EVELUATION'); 
   set(handles.pushbutton1,'string','OK'); 
   set(handles.pushbutton2,'string','BACK'); 
   set(handles.save,'string','SAVE'); 
   set(handles.back,'string','BACK'); 
end
switch method
    case 1
        set(handles.textm,'visible','on');
        set(handles.editm,'visible','on');
        K = Recommand_k(handles.data);
        set(handles.textm,'string','K value');
        set(handles.editm,'string',K);
    case 2
        set(handles.texte,'visible','on');
        set(handles.textm,'visible','on');
        set(handles.textd,'visible','on');
        set(handles.editm,'visible','on');
        set(handles.textm,'string','K value');
        set(handles.texte,'string','Method');
        K = Recommand_AHC(handles.data);
        set(handles.editm,'string',K);
        set(handles.popupmenu1,'visible','on',...
            'string','euclidean|squaredeuclidean|seuclidean|mahalanobis');
        set(handles.popupmenu2,'visible','on',...
            'String','average|centroid|complete|median|single|ward|weighted');
    case 3
        set(handles.textm,'visible','on');
        set(handles.texte,'visible','on');
        set(handles.editm,'visible','on');
        set(handles.edite,'visible','on');
        [Minpts,Eps] = Recommand_DBSCAN(handles.data);
        set(handles.editm,'string',Minpts);
        set(handles.edite,'string',Eps);
end
guidata(hObject, handles);




% --- Outputs from this function are returned to the command line.
function varargout = Result_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function editk_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editk_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editm_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editm_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edite_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edite_CreateFcn(hObject, eventdata, handles)
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
if handles.method == 3
    handles.Minpts = get(handles.editm,'string');
    handles.Eps = get(handles.edite,'string');
    Minpts = str2double(handles.Minpts);
    Eps = str2double(handles.Eps);
    if Eps < 0 || Minpts~=fix(Minpts)
        choice = warndialog('Minpts 必须是正整数, Eps必须是正数 ','提醒','modal');
    else
        if Eps > 1
        choice = choosedialog('Eps取值过大时，聚类效果可能不佳，是否继续?','提示','modal');
        end
    end
else
    handles.K = get(handles.editm,'string');
    K = str2double(handles.K);
    if K < 0 || K~=fix(K)
        choice = warndialog('请输入正整数作为参数 K ','提醒','modal');
    else
        if K==1 || K>=10
            choice = choosedialog('建议K值取2~9之间的值，是否继续?','提示','modal');
        end
    end
end
choice = 'YES';
if strcmp(choice,'NO')
else
set(handles.panel2,'visible','off');
set(handles.table1,'visible','on');
set(handles.axes1,'visible','on');
set(handles.axes2,'visible','on');
set(handles.panel1,'visible','on');
set(handles.texttitle,'visible','on');
set(handles.text7,'visible','on');
set(handles.text8,'visible','on');
set(handles.text9,'visible','on');
set(handles.text28,'visible','on');
set(handles.save,'visible','on');
set(handles.back,'visible','on');
set(handles.figure1,'color',[0.94 0.94 0.94]);
set(handles.text7,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.text8,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.text9,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.texttitle,'BackgroundColor',[0.94 0.94 0.94]);
switch handles.method
    case 1
        K = str2double(get(handles.editm,'string'));
        [new_X,note,SSE,h2,eva] = K_means(handles.data,K);
        axes(handles.axes2); 
        silhouette(handles.data,new_X(:,end),'sqeuclidean');
        data = new_X;
        para = [num2str(K),'(K)'];
    case 2
        disval1=get(handles.popupmenu1,'Value');
        metval2=get(handles.popupmenu2,'Value');
        switch metval2
            case 1
                Method = 'average';
            case 2
                Method = 'centroid';
            case 3
                Method = 'complete';
            case 4
                Method = 'median';
            case 5
                Method = 'single';
            case 6
                Method = 'ward';
            case 7
                Method = 'weighted';
        end
        switch disval1
            case 1
                Distance = 'euclidean';
            case 2
                Distance = 'squaredeuclidean';
            case 3
                Distance = 'seuclidean';
            case 4
                Distance = 'mahalanobis';
        end
        handles.Method = Method;
        handles.Distance = Distance;
        guidata(hObject, handles);
        data = handles.data;
        K = str2double(handles.K);
        Distance = handles.Distance;
        Method = handles.Method;
        [Z,T] = AHC(handles.data,K,Method,Distance);
        data = [data,T];
        axes(handles.axes2);
        cutoff = median([Z(end-2,3) Z(end-1,3)]);
        dendrogram(Z,'ColorThreshold',cutoff);
        para = [num2str(K),'(K) ',Method,'(m) ',' ',Distance,'(d)'];
        
    case 3
        data = handles.data;
        Eps = str2double(handles.Eps);
        Minpts = str2double(handles.Minpts);
        if rand(1)>0.5
            data = DBSCANBYLI(data,Eps,Minpts);
        else
            data = DBSCANBYLIN(data,Eps,Minpts);
        end
        para = [num2str(Eps),'(Eps) ',num2str(Minpts),'(Minpts)'];
        images(handles.axes2,'Logos/icon0.jpg'); 
end
        set(handles.table1,'Data',data);
        handles.data = data;
        guidata(hObject, handles);
        axes(handles.axes1);
        draw(handles,false);
        DB = DBIndex(data(:,1:end-1),data(:,end));
        set(handles.text11,'string',DB);
        Sil=Silindex(data(:,1:end-1),data(:,end));
        set(handles.text17,'string',Sil);
        set(handles.class,'string',num2str(length(tabulate(data(:,end)))));
        [r,c] = size(data);
        str = [num2str(r)  ' * '  num2str(c-1)]; 
        set(handles.size,'string',str);
        set(handles.text27,'string',para);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
    close(gcf);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over editm.
function editm_ButtonDownFcn(hObject, eventdata, handles)
switch (get(handles.editm,'SelectionType'))
    case 'normal'
        set(handles.editm,'ForegroundColor','k');
        uicontrol(hObj);
end



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edite.
function edite_ButtonDownFcn(hObject, eventdata, handles)


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
   data = handles.data;
   uisave('data','Orion.mat');

% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
close(gcf);

% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
delete(gcf);


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
            case 's'
                data = handles.data;
                uisave('data','Orion.mat');
        end
end


% --- Executes on key press with focus on editm and none of its controls.
function editm_KeyPressFcn(hObject, eventdata, handles)
switch double(get(gcf,'CurrentCharacter'))
    case 13   %如果按下的是回车(13)
        Minpts = str2double(get(handles.editm,'string'));
        [Minpts,Eps] = Recommand_DBSCAN(handles.data,Minpts);
        set(handles.edite,'string',Eps);
        set(handles.edite,'ForegroundColor','k');
    case 8
        set(handles.editm,'ForegroundColor','k');
    case 46
        set(handles.editm,'ForegroundColor','k');
        
end


% --- Executes on key press with focus on edite and none of its controls.
function edite_KeyPressFcn(hObject, eventdata, handles)
