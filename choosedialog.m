function choice = choosedialog(msg ,title,modal)
if(nargin < 2)
    title = 'Ьсаб';
end
if(nargin < 3)
    modal = 'modal';
end
    d = dialog('Name',title,'Position',[500 500 300 200],'WindowStyle',modal);
    txt = uicontrol('Parent',d,...
           'Style','text',...
           'Position',[30 80 210 50],...
           'String',msg);
       
    btn1 = uicontrol('Parent',d,...
           'Position',[50 50 70 25],...
           'String','YES',...
           'Callback',@myDeleteFcn1);
       
    btn2 = uicontrol('Parent',d,...
           'Position',[170 50 70 25],...
           'String','NO',...
           'Callback',@myDeleteFcn2);
       
    uiwait(d);
    function myDeleteFcn1(~,~)
        choice = 'YES';
        delete(gcf);
    end

    function myDeleteFcn2(~,~)
        choice = 'NO';
        delete(gcf);
    end


end
















