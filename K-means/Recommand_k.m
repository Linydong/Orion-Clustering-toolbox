function R_P = Recommand_k(X)
%����������������X�������Ƽ�������k��
eva=evalclusters(X,'kmeans','CalinskiHarabasz','KList',[1:9]);
R_P=eva.OptimalK;
end

