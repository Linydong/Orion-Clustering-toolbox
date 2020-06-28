function plot_data(handles,~)
%------------------------------------------ø… ”ªØ
if(nargin < 2)
    data = handles.data;
    color = '#0072bd';
else
    data = handles.mapdata;
    color = '#ffd505';
end
[~, nc] = size(data);
axes(handles.axes11);
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
    D = pca_of_data(data',3);
    D = D';
    rotate3d on
    scatter3(D(:,1),D(:,2),D(:,3),pointsize,'filled','MarkerFaceColor',color);
    xlabel('PC1','FontSize',15,'FontWeight','demi');
    ylabel('PC2','FontSize',15,'FontWeight','demi');
    title('Data are plotted in Principal Component space'); 
  end
  if nc == 3
    rotate3d on
    D = data;
    scatter3(D(:,1),D(:,2),D(:,3),pointsize,'filled','MarkerFaceColor',color);
    xlabel('');
    ylabel('');
    title('Three dimensional data are plotted');
  end
  
  if nc == 2
    D = data;
    scatter(D(:,1),D(:,2),pointsize,'filled','MarkerFaceColor',color);
    xlabel('');
    ylabel('');
    title('Two dimensional data are plotted');
  end
    set(gca,'XTickMode','auto');
    set(gca,'YTickMode','auto');
    set(gca,'XTickLabelMode','auto');
    set(gca,'YTickLabelMode','auto');
    [fd,dt] = max(D(:,1));
    [ft, dt] = min(D(:,1));
    dt = 0.05*(fd-ft); 
    xlim([ft-dt fd+dt]);
    [fd,dt] = max(D(:,2));
    [ft, dt] = min(D(:,2));
    dt = 0.05*(fd-ft); 
    ylim([ft-dt fd+dt]);

end

