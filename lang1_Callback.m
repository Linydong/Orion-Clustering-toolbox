function lang1_Callback(hObject, eventdata, handles)
if strcmp(handles.show.language,'English')
    set(handles.load,'string','打开','FontWeight','bold');
    set(handles.save,'string','保存','FontWeight','bold');
    set(handles.path,'string','路径','FontWeight','bold');
    set(handles.help,'string','帮助','FontWeight','bold');
    set(handles.lang,'string','English','FontWeight','bold');
    set(handles.panel2,'Title','描述性统计','FontWeight','bold');
    set(handles.textD11,'string','特征数','FontWeight','bold');
    set(handles.textD21,'string','样本量','FontWeight','bold');
    set(handles.textD31,'string','偏度','FontWeight','bold');
    set(handles.textD41,'string','峰度','FontWeight','bold');
    set(handles.textD51,'string','X轴极值','FontWeight','bold');
    set(handles.textD61,'string','Y轴极值','FontWeight','bold');
    set(handles.textD71,'string','Z轴极值','FontWeight','bold');
    set(handles.text21,'string','Kmeans,默认使用k-means++算法初始化质心和平方欧式距离。该算法根据所提供的特性迭代地将每个数据点分配给K个组中的一个。');
    set(handles.text22,'string','AHC,层次聚类算法，它将较小的聚类按顺序组合成较大的聚类，直到有一个包含所有点/对象的大聚类为止。该算法的工作原理是将不同的物体组合在一起。');
    set(handles.text23,'string','DBSCAN,基于密度的空间聚类与噪声应用是一种基于密度的clusering算法。该算法可用于识别包含噪声和异常值的数据集中任何形状的簇。');
    if handles.show.panel1==0
        images(handles.axes520,handles.theme.t3);
    end
    
    set(handles.clustering,'string','聚类算法','FontWeight','bold');
    set(handles.load,'Tooltip','载入数据','FontWeight','bold');
    set(handles.save,'Tooltip','保存数据为mat格式','FontWeight','bold');
    set(handles.path,'Tooltip','在资源管理器中打开','FontWeight','bold');
    set(handles.help,'Tooltip','打开帮助文档','FontWeight','bold');
    set(handles.lang,'Tooltip','change language to English.','FontWeight','bold');
    set(handles.clustering,'Tooltip','显示算法介绍以及选择界面','FontWeight','bold');
    set(handles.textD11,'Tooltip','也就是列数','FontWeight','bold');
    set(handles.textD21,'Tooltip','也就是行数','FontWeight','bold');
    set(handles.textD31,'Tooltip','偏度','FontWeight','bold');
    set(handles.textD41,'Tooltip','峰度','FontWeight','bold');
    set(handles.textD51,'Tooltip','X轴极大极小值之差值','FontWeight','bold');
    set(handles.textD61,'Tooltip','Y轴极大极小值之差值','FontWeight','bold');
    set(handles.textD71,'Tooltip','Z轴极大极小值之差值','FontWeight','bold');
    
    
    
    handles.show.language = 'Chinese';
    guidata(hObject, handles);
else
    set(handles.load,'string','LOAD','FontWeight','bold');
    set(handles.save,'string','SAVE','FontWeight','bold');
    set(handles.path,'string','PATH','FontWeight','bold');
    set(handles.help,'string','HELP','FontWeight','bold');
    set(handles.lang,'string','中文','FontWeight','bold');
    set(handles.clustering,'string','CLUSTERIING');
    set(handles.panel2,'Title','Descriptive Statistics','FontWeight','bold');
    set(handles.textD11,'string','Feature','FontWeight','bold');
    set(handles.textD21,'string','Length','FontWeight','bold');
    set(handles.textD31,'string','Skewness','FontWeight','bold');
    set(handles.textD41,'string','Kurtosis','FontWeight','bold');
    set(handles.textD51,'string','X range','FontWeight','bold');
    set(handles.textD61,'string','Y range','FontWeight','bold');
    set(handles.textD71,'string','Z range','FontWeight','bold');
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
    set(handles.lang,'Tooltip','切换中英文');
    set(handles.clustering,'Tooltip','show clustering algorithms');
    set(handles.textD11,'Tooltip','column','FontWeight','bold');
    set(handles.textD21,'Tooltip','row','FontWeight','bold');
    set(handles.textD31,'Tooltip','Skewness','FontWeight','bold');
    set(handles.textD41,'Tooltip','Kurtosis','FontWeight','bold');
    set(handles.textD51,'Tooltip','X range','FontWeight','bold');
    set(handles.textD61,'Tooltip','Y range','FontWeight','bold');
    set(handles.textD71,'Tooltip','Z range','FontWeight','bold');
    
    
    handles.show.language = 'English';
    guidata(hObject, handles);
end
end