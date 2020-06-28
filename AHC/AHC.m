function  [Z,T] =AHC(X,k,Distance ,Method )
Z = linkage(X,Method,Distance);
T = cluster(Z,'maxclust',k);
[~, nc] = size(X);
  if nc > 3
    D = pca_of_data(X',2);
    D = D';
    scatter(D(:,1),D(:,2),10,T);
    xlabel('PC1','FontSize',11,'FontWeight','demi');
    ylabel('PC2','FontSize',11,'FontWeight','demi');
    title('Data are plotted in Principal Component space'); 
  end

  if nc == 3
    D = data;
    scatter3(D(:,1),D(:,2),D(:,3),10,T);
    xlabel('');
    ylabel('');
    title('Three dimensional data are plotted');
  end
  
  if nc == 2
    D = X;
    scatter(D(:,1),D(:,2),10,T);
    xlabel('');
    ylabel('');
    title('Two dimensional data are plotted');
  end
cutoff = median([Z(end-2,3) Z(end-1,3)]);
dendrogram(Z,'ColorThreshold',cutoff)
end
