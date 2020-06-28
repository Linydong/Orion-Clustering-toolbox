function statistics(handles)
%------------------------------------------ÃèÊöÐÔÍ³¼Æ
  data = handles.data;
  [~, nc] = size(data);
  if size(handles.data,2)>3
        D = pca_of_data(data',2);
        D = D';
  else
        D = data;
  end
  set(handles.textD12,'String',(size(data,2)));
  set(handles.textD22,'String',(size(data,1)));
  set(handles.textD32,'String',mean(skewness(data)));
  set(handles.textD42,'String',mean(kurtosis(data)));
  A = range(D);
     set(handles.textD52,'String',A(1));
     set(handles.textD62,'String',A(2));
  if nc == 3
     set(handles.textD72,'String',A(3));
  else
     set(handles.textD72,'String','None');  
  end
  
end