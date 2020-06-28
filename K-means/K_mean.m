function [new_X,note,SSE,h2,R_P] = K_mean(X,k)
% k-means�㷨
% ������Ҫ���о�������������X���Լ�����k,���ش�����ŵ�������new_X,����ֿ��Ľṹnote,SSE,����ϵ��ͼ������Ƽ�������

%���ǵ���1��û��ʲô���壬��Ϊ�˱��ⱻ������k=1���³��򱨴�����趨���������������ǵ�k��1ʱ
if k>1
    cen=k_means_initial(X,k); %����ɸѡ��ʼ�����ĵ�ĺ������������ʵĳ�ʼ�����ģ�
    cens=[]; %�ں��ڸ���ÿһ�����ĵ�ʱ���������ʱ������º�����ĵ����ꣻ
    distance=[]; %�����洢ÿһ���еĵ�����ĵ�ľ���ľ���
    while true %����һ����ѭ������������Ϊ�������ĵ㲻�ٷ����仯��
        for i=1:k
            %��������༯��ÿ�������ʼ�����ĵľ��룬ÿһ�б�ʾ���д��������һ����ʼ�����ĵľ���
            distance=[distance,dist(X,cen(i,:)')];
        end
        
        new_X=[X,zeros(size(X,1),1)]; %���ڴ洢ÿ����ԭʼ���꼰���������ľ������е�����Ϊÿ�������������
        [~,I]=min(distance'); %�ҳ������ĸ����ĵ���������ض�Ӧ������������Щ������Ϊ��Ӧ�Ĵر�ǩ�洢��new_X�����У�
        new_X(:,size(X,2)+1)=I'; 
        cens=cen;
        %�������¸�������ĵ㣻
        for j=1:k
            [r,~]=find(new_X(:,end)==j); %�ҳ�����ĳһ�ص����е������У�
            %��ĳһ��������������һʱ�����´����ģ������º�����Ĵ洢��cens�У�
            if size(r)>1 
                  cens(j,:)=mean(X(r,:));
            end
        end
        %�������ıȽ��ȶ�ʱ����ѭ�����������������������Ը����ݵ���о���
        if ~isequal(cen,cens)
        cen=cens;
        cens=[]; %���cens
        else
            break;
        end
    end
    v=[];%���ڴ洢ÿһ���SE������
    SSE=0;
    for p=1:k
        note{p}=new_X(find(new_X(:,end)==p),:); %���ڴ洢ÿһ���������ĳ�ʼ������꣬�������������Ľṹ��
        no{p}=new_X(find(new_X(:,end)==p),[1:end-1]);%�洢ÿһ����������ʼ�������Ľṹ
        b=sum(dist(no{p},cen(p,:)').^2); %����ÿһ���SE
        v=[v,b];
    end
    SSE=sum(v); %����SSE
    color=rand(k,3); %�洢����������ں��ڻ�ͼ���ò�ͬ�صĵ��ò�ͬ����ɫ��ʶ��
    lt=1:k; %������legend��
    %����2dͼ��
    if size(X,2)==2
        figure(1)
        for c=1:k
            point=new_X((find((new_X(:,end)==c))),:);
            h1=plot(point(:,1),point(:,2),'.','markersize',9,'color',color(c,:));
            hold on;
        end
    %����3dͼ��
    elseif size(X,2)==3
       for c=1:k
        point=new_X((find((new_X(:,end)==c))),:);
        h1=plot3(point(:,1),point(:,2),point(:,3),'.','markersize',9,'color',color(c,:));
        hold on;
       end
    %4ά�����޷���ͼ�����Ҳ�֪����ô����figure��1�����������������ᱨ����
    else
        axis([0,2,0,2]);
        text(0.8,1,'no figure');
    end
    legend(num2str(lt'));%��ͼ��
%������ִ��ֻ��һ�࡭��    
else
    new_X=[X,ones(size(X,1),1)];
    note={new_X};
    SSE=sum(dist(X,mean(X)').^2);
end
%��������ϵ��ͼ
figure(2)
[silh2,h2] = silhouette(X,new_X(:,end),'sqeuclidean');
%����Ƽ�������������CHͼ�����ÿ�ɾ���Ը����Ű죬ps.CH�����ú�������ʼ��û���Ż�����
% eva=evalclusters(X,'kmeans','CalinskiHarabasz','KList',[1:9]);
% R_P=eva.OptimalK;
% figure(3)
% plot(eva);
end

   
    