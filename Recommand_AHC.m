function R_P = Recommand_AHC(X)
%����������������X�������Ƽ�������k��
%���۲�ξ�����Ƽ������㷨
eva=evalclusters(X,'linkage','CalinskiHarabasz','KList',[1:9]);
R_P=eva.OptimalK;
end