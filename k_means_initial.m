function initial_X = k_means_initial(X,k)
% kmeans�����㷨��ʼ���Ż�
%  ���������������X����Ԥ������k��

initial_X=[];%���ڴ洢��ʼ�����ĵľ���
mean_X=mean(X); %ȡ�������е�������Ϊ��һ����ʼ�����ģ�
distance=dist(X,mean_X');
[~,I]=sort(distance,'ascend');
Xi=X(I(1),:);%��1����ʼ�������ģ�
X=X(I(2:end),:); %��X��ȥ���Ѿ���Ϊ��ʼ�����ĵĵ㣻
initial_X=[initial_X;Xi];
%�ҳ�������ʼ�����ģ�
for i=2:k
    distance=dist(X,initial_X'); %�ֱ���ÿ���������г�ʼ�����ĵľ��룬ȡ��ÿһ���ڲ�ͬ��ʼ�������Ͼ������Сֵ��
%     for n=1:size(distance,2)
        [value,~]=sort(distance,2);
%     end
    %ȡ��������Сֵ�����ֵ�����������ҵ���Ӧ�㣻
    [~,I]=sort(value,'descend');
    Xi=X(I(1),:);
    initial_X=[initial_X;Xi];
    X=X(I(2:end,1),:); %��X��ȥ���Ѿ���Ϊ��ʼ�����ĵĵ㣻
end
%��ͼ
% if size(X,2)==2
%     plot(X(:,1),X(:,2),'.','markersize',12);
%     hold on;
%     plot(initial_X(:,1),initial_X(:,2),'^','markersize',12);
% elseif size(X,2)==3
%     plot3(X(:,1),X(:,2),X(:,3),'.','markersize',12);
%     hold on;
%     plot3(initial_X(:,1),initial_X(:,2),initial_X(:,3),'^','markersize',12);
% end
end

