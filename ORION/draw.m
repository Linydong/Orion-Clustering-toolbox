function draw(handles,noise)
%  X -----  ���ݼ��������������עΪ0,�Ժ�ɫ������
%labled --- ������ڵ��У�Ĭ��Ϊdimension+1��

if(nargin < 2)
    noise = false;
end
X = handles.data;
dimension =  size(X(:,1:end-1),2);
labled = dimension + 1;
lableSize = length(tabulate(X(:,labled)));%�����ж�����
color = ['r' 'g' 'b' 'y' 'm' 'c' 'w'];
marker = ['o' '+' '*' 'x' 'h' 'p'];
switch dimension
    case 1
        warndlg('һά���ݼ����뻭ʲôͼ��','���վ���');
    case 2
        if(noise)%������
            title('Two dimensional data are plotted');
            core = find(X(:,labled)==0);
        	scatter(X(core,1),X(core,2),'MarkerFaceColor','k','marker','.');
            hold on
        end
        for j = 1:lableSize
            core = find(X(:,labled)==j);
            if(j~=0)
                scatter(X(core,1),X(core,2),'MarkerFaceColor',color(mod(j,7)+1),'marker',marker(mod(j,6)+1));
            end
            hold on
        end
    case 3
        rotate3d on
        title('Three dimensional data are plotted');
        if(noise)%������
            core = find(X(:,labled) == 0);
        	scatter3(X(core,1),X(core,2),X(core,3),'MarkerFaceColor','k','marker','.');
            hold on
        end
        for j = 1:lableSize
            core = find(X(:,labled) == j);
            if(j ~= 0)
                scatter3(X(core,1),X(core,2),X(core,3),'MarkerFaceColor',color(mod(j,7)+1),'marker',marker(mod(j,6)+1));
            end
            hold on
        end
    otherwise
        rotate3d on
        X = pca_of_data(X(:,1:end-1)',3)';
        X = [X handles.data(:,labled)];
        xlabel('PC1','FontSize',11,'FontWeight','demi');
        ylabel('PC2','FontSize',11,'FontWeight','demi');
        title('Data are plotted in Principal Component space'); 
        for j = 1:lableSize
            core = find(X(:,4) == j);
            scatter3(X(core,1),X(core,2),X(core,3),'MarkerFaceColor',color(mod(j,7)+1),'marker',marker(mod(j,6)+1));
            hold on
        end
        
end

    






