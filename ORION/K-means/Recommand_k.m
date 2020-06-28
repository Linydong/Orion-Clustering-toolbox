function R_P = Recommand_k(X)
%输入待分类矩阵名称X，返回推荐分类数k；
eva=evalclusters(X,'kmeans','CalinskiHarabasz','KList',[1:9]);
R_P=eva.OptimalK;
end

