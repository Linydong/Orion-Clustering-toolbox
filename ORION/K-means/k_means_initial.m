function initial_X = k_means_initial(X,k)
% kmeans聚类算法初始点优化
%  输入待分类数据名X，及预分类数k；

initial_X=[];%用于存储初始簇中心的矩阵；
mean_X=mean(X); %取距离所有点中心作为第一个初始簇中心；
distance=dist(X,mean_X');
[~,I]=sort(distance,'descend');
Xi=X(I(1),:);%第1个初始聚类中心；
X=X(I(2:end),:); %从X中去掉已经作为初始簇中心的点；
initial_X=[initial_X;Xi];
%找出其它初始簇中心；
for i=2:k
    distance=dist(X,initial_X'); %分别算每个点与已有初始簇中心的距离，取出每一点在不同初始簇中心上距离的最小值；
%     for n=1:size(distance,2)
        [value,~]=sort(distance,2);
%     end
    %取出所有最小值中最大值，按其索引找到对应点；
    [~,I]=sort(value,'descend');
    Xi=X(I(1),:);
    initial_X=[initial_X;Xi];
    X=X(I(2:end,1),:); %从X中去掉已经作为初始簇中心的点；
end
end

