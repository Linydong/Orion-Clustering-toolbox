function choice = warndialog(msg ,title,modal)
if(nargin < 2)
    title = 'Ьсаб';
end
if(nargin < 3)
    modal = 'modal';
end
    d = dialog('Name',title,'Position',[500 500 300 200],'WindowStyle',modal);
    choice = 'NO';
    txt = uicontrol('Parent',d,...
           'Style','text',...
           'Position',[30 80 210 50],...
           'String',msg);
       
    btn = uicontrol('Parent',d,...
           'Position',[115 50 70 25],...
           'String','OK',...
           'Callback','delete(gcf)');
       
    uiwait(d);

end
















