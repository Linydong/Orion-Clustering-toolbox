function lang1_Callback(hObject, eventdata, handles)
if strcmp(handles.show.language,'English')
    fontWeight = 'bold';
    set(handles.load,'string','��','FontWeight',fontWeight);
    set(handles.save,'string','����','FontWeight',fontWeight);
    set(handles.path,'string','·��','FontWeight',fontWeight);
    set(handles.help,'string','����','FontWeight',fontWeight);
    set(handles.lang,'string','English');
    set(handles.panel2,'Title','������ͳ��','FontWeight',fontWeight);
    set(handles.textD11,'string','������','FontWeight',fontWeight);
    set(handles.textD21,'string','������','FontWeight',fontWeight);
    set(handles.textD31,'string','ƫ��','FontWeight',fontWeight);
    set(handles.textD41,'string','���','FontWeight',fontWeight);
    set(handles.textD51,'string','X�Ἣֵ','FontWeight',fontWeight);
    set(handles.textD61,'string','Y�Ἣֵ','FontWeight',fontWeight);
    set(handles.textD71,'string','Z�Ἣֵ','FontWeight',fontWeight);
    set(handles.text21,'string','Kmeans,Ĭ��ʹ��k-means++�㷨��ʼ�����ĺ�ƽ��ŷʽ���롣���㷨�������ṩ�����Ե����ؽ�ÿ�����ݵ�����K�����е�һ����');
    set(handles.text22,'string','AHC,��ξ����㷨��������С�ľ��ఴ˳����ϳɽϴ�ľ��ֱ࣬����һ���������е�/����Ĵ����Ϊֹ�����㷨�Ĺ���ԭ���ǽ���ͬ�����������һ��');
    set(handles.text23,'string','DBSCAN,�����ܶȵĿռ����������Ӧ����һ�ֻ����ܶȵ�clusering�㷨�����㷨������ʶ������������쳣ֵ�����ݼ����κ���״�Ĵء�');
    if handles.show.panel1==0
        images(handles.axes520,handles.theme.t3);
    end
    
    set(handles.clustering,'string','�����㷨','FontWeight',fontWeight);
    set(handles.load,'Tooltip','��������','FontWeight',fontWeight);
    set(handles.save,'Tooltip','��������Ϊmat��ʽ','FontWeight',fontWeight);
    set(handles.path,'Tooltip','����Դ�������д�','FontWeight',fontWeight);
    set(handles.help,'Tooltip','�򿪰����ĵ�','FontWeight',fontWeight);
    set(handles.lang,'Tooltip','change language to English.','FontWeight',fontWeight);
    set(handles.clustering,'Tooltip','��ʾ�㷨�����Լ�ѡ�����','FontWeight',fontWeight);
    set(handles.textD11,'Tooltip','Ҳ��������','FontWeight',fontWeight);
    set(handles.textD21,'Tooltip','Ҳ��������','FontWeight',fontWeight);
    set(handles.textD31,'Tooltip','ƫ��','FontWeight',fontWeight);
    set(handles.textD41,'Tooltip','���','FontWeight',fontWeight);
    set(handles.textD51,'Tooltip','X�Ἣ��Сֵ֮��ֵ','FontWeight',fontWeight);
    set(handles.textD61,'Tooltip','Y�Ἣ��Сֵ֮��ֵ','FontWeight',fontWeight);
    set(handles.textD71,'Tooltip','Z�Ἣ��Сֵ֮��ֵ','FontWeight',fontWeight);
    
    
    
    handles.show.language = 'Chinese';
    guidata(hObject, handles);
else
    fontWeight = 'normal';
    set(handles.load,'string','LOAD');
    set(handles.save,'string','SAVE');
    set(handles.path,'string','PATH');
    set(handles.help,'string','HELP');
    set(handles.lang,'string','����');
    set(handles.clustering,'string','CLUSTERIING');
    set(handles.panel2,'Title','Descriptive Statistics');
    set(handles.textD11,'string','Feature');
    set(handles.textD21,'string','Length');
    set(handles.textD31,'string','Skewness');
    set(handles.textD41,'string','Kurtosis');
    set(handles.textD51,'string','X range');
    set(handles.textD61,'string','Y range');
    set(handles.textD71,'string','Z range');
    set(handles.text21,'string','Our Kmeans uses the k-means++ algorithm for centroid initialization and squared Euclidean distance by default.The algorithm works iteratively to assign each data point to one of K groups based on the features that are provided.');
    set(handles.text22,'string','AHC is a clustering algorithm which sequentially combines smaller clusters into larger ones until we have one big cluster which includes all points/objects.The algorithm works from the dissimilarities between the objects to be grouped together.');
    set(handles.text23,'string','Density-Based Spatial Clustering and Application with Noise is a density-based clusering algorithm.The algorithm  can be used to identify clusters of any shape in a data set containing noise and outliers.');
     if handles.show.panel1==0
        images(handles.axes520,handles.theme.t3e);
     end
    
    set(handles.load,'Tooltip','Load Data.');
    set(handles.save,'Tooltip','save data as .mat');
    set(handles.path,'Tooltip','open in folder');
    set(handles.help,'Tooltip','get more help.');
    set(handles.lang,'Tooltip','�л���Ӣ��');
    set(handles.clustering,'Tooltip','show clustering algorithms');
    set(handles.textD11,'Tooltip','column','FontWeight',fontWeight);
    set(handles.textD21,'Tooltip','row','FontWeight',fontWeight);
    set(handles.textD31,'Tooltip','Skewness','FontWeight',fontWeight);
    set(handles.textD41,'Tooltip','Kurtosis','FontWeight',fontWeight);
    set(handles.textD51,'Tooltip','X range','FontWeight',fontWeight);
    set(handles.textD61,'Tooltip','Y range','FontWeight',fontWeight);
    set(handles.textD71,'Tooltip','Z range','FontWeight',fontWeight);
    
    
    handles.show.language = 'English';
    guidata(hObject, handles);
end
end