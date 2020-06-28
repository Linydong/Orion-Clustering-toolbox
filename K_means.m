function [new_X,note,SSE,h2,eva] = K_means(X,k)
% k-means算法
% 输入需要进行聚类的数组的名称X，以及类数k,返回带类别标号的新数组new_X,各类分开的结构note,SSE,轮廓系数图句柄，推荐参数；

%考虑到分1类没有什么意义，但为了避免被试输入k=1导致程序报错，因此设定两个条件，首先是当k＞1时
if k>1
    cen=k_means_initial(X,k); %调用筛选初始簇中心点的函数，产生合适的初始簇中心；
    cens=[]; %在后期更新每一簇中心点时，用这个暂时储存更新后的中心点坐标；
    distance=[]; %用来存储每一簇中的点和中心点的距离的矩阵；
    while true %设置一个永循环，结束条件为各簇中心点不再发生变化；
        i = 1;
        while i ~= k+1
            %算出待分类集中每个点与初始簇中心的距离，每一列表示所有待分类点与一个初始簇中心的距离
            distance=[distance,dist(X,cen(i,:)')];
            i = i + 1;
        end
        
        new_X=[X,zeros(size(X,1),1)]; %用于存储每个点原始坐标及其所处类别的矩阵，其中第三列为每个点所属的类别
        [~,I]=min(distance'); %找出距离哪个中心点最近，返回对应的索引；将这些索引作为对应的簇标签存储在new_X第三列；
        new_X(:,size(X,2)+1)=I'; 
        cens=cen;
        %迭代更新各类别中心点；
        j = 1;
        while j ~= k +1
            [r,~]=find(new_X(:,end)==j); %找出隶属某一簇的所有点所在行；
            %当某一簇所含点数大于一时，更新簇中心，将更新后簇中心存储在cens中；
            if size(r)>1 
                  cens(j,:)=mean(X(r,:));
            end
            j = j + 1;
        end
        %当簇中心比较稳定时结束循环，否则上述操作，继续对各数据点进行聚类
        if ~isequal(cen,cens)
        cen=cens;
        cens=[]; %清空cens
        else
            break;
        end
    end
    v=[];%用于存储每一类的SE的向量
    SSE = 0;
    p = 1;
    while p ~= k+1
        note{p}=new_X(find(new_X(:,end)==p),:); %用于存储每一类所包含的初始点的坐标，及它们所属类别的结构；
        no{p}=new_X(find(new_X(:,end)==p),[1:end-1]);%存储每一类所包含初始点的坐标的结构
        b=sum(dist(no{p},cen(p,:)').^2); %计算每一类的SE
        v=[v,b];
        p = p + 1;
    end
    SSE=sum(v); %计算SSE
    color=rand(k,3); %存储随机数，用于后期绘图设置不同簇的点用不同的颜色标识；
    lt=1:k; %用来加legend；
    h2 = 0;
    eva = 0;
    %绘制2d图像；
%     if size(X,2)==2
%         figure(1)
%         c = 1;
%         while c~=k+1
%             point=new_X((find((new_X(:,end)==c))),:);
%             h1=plot(point(:,1),point(:,2),'.','markersize',9,'color',color(c,:));
%             hold on;
%             c = c+1;
%         end
%     %绘制3d图像；
%     elseif size(X,2)==3
%         c = 1;
%        while c~=k+1
%         point=new_X((find((new_X(:,end)==c))),:);
%         h1=plot3(point(:,1),point(:,2),point(:,3),'.','markersize',9,'color',color(c,:));
%         hold on;
%             c = c+1;
%         end
%     %4维以上无法作图，但我不知道怎么不让figure（1）弹出来，反正不会报错……
%     else
%         axis([0,2,0,2]);
%         text(0.8,1,'no figure');
%     end
%     legend(num2str(lt'));%加图例
%当被试执意只分一类……    
else
    new_X=[X,ones(size(X,1),1)];
    note={new_X};
    SSE=sum(dist(X,mean(X)').^2);
end
%绘制轮廓系数图
% figure(2)
% 输出推荐分类数并绘制CH图（不用可删，自个看着办，ps.CH是内置函数，初始点没有优化）；
% eva=evalclusters(X,'kmeans','CalinskiHarabasz','KList',[1:9]);
% R_P=eva.OptimalK;
% figure(3)
% plot(eva);
end

   
    