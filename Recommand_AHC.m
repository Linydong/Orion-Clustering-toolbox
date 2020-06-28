function R_P = Recommand_AHC(X)
%输入待分类矩阵名称X，返回推荐分类数k；
%凝聚层次聚类的推荐参数算法
eva=evalclusters(X,'linkage','CalinskiHarabasz','KList',[1:9]);
R_P=eva.OptimalK;
end