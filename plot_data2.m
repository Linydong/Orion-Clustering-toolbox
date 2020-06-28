function plot_data2(X,T)
[~, nc] = size(X);
if length(data)>=6000
    pointsize = 20;
else
    if length(data)>=3000
        pointsize = 30;
    else
        pointsize = 40;
    end
end

  if nc > 3
    rotate3d on
    D = pca_of_data(X',3);
    D = D';
    scatter3(D(:,1),D(:,2),D(:,3),pointsize,T);
    xlabel('PC1','FontSize',11,'FontWeight','demi');
    ylabel('PC2','FontSize',11,'FontWeight','demi');
    title('Data are plotted in Principal Component space'); 
  end

  if nc == 3
    rotate3d on
    D = X;
    scatter3(D(:,1),D(:,2),D(:,3),pointsize,T);
    xlabel('');
    ylabel('');
    title('Three dimensional data are plotted');
  end
  
  if nc == 2
    D = X;
    scatter(D(:,1),D(:,2),pointsize,T);
    xlabel('');
    ylabel('');
    title('Two dimensional data are plotted');
  end
end