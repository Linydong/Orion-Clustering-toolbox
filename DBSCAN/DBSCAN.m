function [X,col] = DBSCAN(X,Eps,Minpts)
%Matlab期末项目——聚类工具箱   DBSCAN by KIKI 基于密度聚类
%email：ligf9@mail2.sysu.edu.cn

[row,col] = size(X);%获取数据集大小
X(:,col+1:col+3) = zeros(row,3);%加了三列，作用如下：
status = col + 1;%核心点1，边界点2，噪声点-1，默认值（未处理）0
viewed = col + 2;%是否被观察过：0默认值未被观察,1为被观察过
labled = col + 3;%属于哪一类别12345....0是噪声点
class = 1;%标记类别

for i = 1:row
    if(X(i,viewed)==0)
        X(i,viewed)= 1;
        Distance = dist(X(i,1:col),X(1:row,1:col)');
        CorePositions = find(Distance<=Eps);
        if(length(CorePositions) == 1)%噪声点
            X(i,status) = -1;
            X(i,labled) = 0;
            X(i,viewed) = 1;
        end
        if( length(CorePositions) > Minpts )%核心点
        	X(i,status) = 1;
        	X(CorePositions,labled) = class;%给个类别先
            while ~isempty(CorePositions)
                j = CorePositions(1);
                X(CorePositions(1),viewed) = 1;
                CorePositions(1) = [];
                distance = dist(X(j,1:col),X(1:row,1:col)');
                corepositions = find(distance <= Eps);
                if(length(corepositions) > 1)
                   X(corepositions,labled) = class;
                 	if(length(corepositions) > Minpts)
                        X(j,status) = 1;
                    else
                        X(j,status) = 2;
                    end
                    for li = 1:length(corepositions)
                       if (X(corepositions(li),viewed)==0)
                          X(corepositions(li),viewed)= 1;
                          CorePositions=[CorePositions,corepositions(li)];   
                          X(corepositions(li),labled) = class;
                       end                    
                    end
                end
            end
            class = class + 1;
        end
    end
end
X = [X(:,1:col),X(:,labled)];
end








































