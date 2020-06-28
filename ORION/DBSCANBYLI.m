function [X,col] = DBSCAN(X,Eps,Minpts)
%Matlab��ĩ��Ŀ�������๤����   DBSCAN by KIKI �����ܶȾ���
%email��ligf9@mail2.sysu.edu.cn

[row,col] = size(X);%��ȡ���ݼ���С
X(:,col+1:col+3) = zeros(row,3);%�������У��������£�
status = col + 1;%���ĵ�1���߽��2��������-1��Ĭ��ֵ��δ����0
viewed = col + 2;%�Ƿ񱻹۲����0Ĭ��ֵδ���۲�,1Ϊ���۲��
labled = col + 3;%������һ���12345....0��������
class = 1;%������

for i = 1:row
    if(X(i,viewed)==0)
        X(i,viewed)= 1;
        Distance = dist(X(i,1:col),X(1:row,1:col)');
        CorePositions = find(Distance<=Eps);
        if(length(CorePositions) == 1)%������
            X(i,status) = -1;
            X(i,labled) = 0;
            X(i,viewed) = 1;
        end
        if( length(CorePositions) > Minpts )%���ĵ�
        	X(i,status) = 1;
        	X(CorePositions,labled) = class;%���������
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








































