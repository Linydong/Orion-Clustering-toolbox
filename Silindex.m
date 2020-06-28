%用于计算轮廓系数(Silhouette Coefficient)的函数
%只要输入原始数据，已经聚类后的类别数据，就可以算出Sil
%si接近1，则说明样本i聚类合理。
%si接近-1，则说明样本i更应该分类到另外的簇。
%若si近似为0，则说明样本i在两个簇的边界上。
function Sil=Silindex(X,index)
Sil = silhouette(X,index);
Sil = mean(Sil);
end% mean Silhouette