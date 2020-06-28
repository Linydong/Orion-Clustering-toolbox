function X = DBSCAN(X,Eps,MinPts)
%Matlab Final-term project
% Project Code: Bella.K.Lin
% Project Title: DBSCAN Clustering in MATLAB
% 
% Mark by Bella.K.Lin
% Developer: Kiki ( Lin's Partner )
% Contact Info: linyd9@mail2.sysu.edu.cn

% Prepare the environment 

% define the parameter MinPts and Eps
% MinPts = 5;

% Analytical way of estimating neighborhood radius for DBSCAN  
% Eps = epsilon(X, MinPts);

% Initially, all patterns are marked as 'noise' and 'unvisited'
n = size(X,1);% get size
% add an extra array to lable the class
IDX = zeros(n,1);  % pepare a matic used to label the final class of each point
cid = 0; % class id 

% Calculate distance
Distance = pdist2(X,X); % return a matrix that store any two points' distance

visited = false(n,1); % Check whether the point has been visited 
isnoise = false(n,1); % Check whether the point's type

for i=1:n
    % Check from the first point
        if ~visited(i)
            visited(i)=true;
            % find:return a 1000¡Á1 logical array
            % numer: returns the number of points that distance < Eps
            Nerborpoints = find(Distance(:,i)< Eps); % Find the points inside the circle
            if  numel(find(Distance(:,i)< Eps)) < MinPts  
                % X(i,:) is NOISE
                isnoise(i)= true;
            else
                cid = cid +1; % numbers of Central points plus 1
               
                IDX(i) =cid;
                
                k = 1;
                while true
                    j = Nerborpoints(k);
                %X(i,size(X,2)) = class; % Give it a class 
                %Nerborpoints(1) = []; % Clean the first point which has been classfied 
                %j = Nerborpoints(1);   % Begin to Expend our class
                if visited(j) == 0   % Judge whether the points has been visited(classfied) befor
                    visited(j) = true; % If not, lable it.
                    distance = Distance(:,j); % Extract the j point's distance with the other points
                    Nerborpoints2 = find(Distance(:,j)< Eps); % Find the next core point
                    if numel(Nerborpoints2)>= MinPts % Judge whether the point is a core point 
                        Nerborpoints= vertcat(Nerborpoints,Nerborpoints2);
                        Nerborpoints=unique(Nerborpoints,'stable'); % Delete the repeated points
                    end
                end
                if IDX(j)==0
                   IDX(j)=cid;
                end
                k = k+1;
                if k > numel(Nerborpoints) 
                    break;
                end
            end
        end
        end
end
PlotR(X,IDX)

% Input:
    % X - data matrix (m,n); m-objects, n-variables  
    % k - number of objects in a neighborhood of an object  
    % (minimal number of objects considered as a cluster)   
      
function [Eps]= epsilon(X,k)
    [m,n]=size(X);  
    Eps=((prod(max(X)-min(X))*k*gamma(.5*n+1))/(m*sqrt(pi.^n))).^(1/n);  
end
    
% Plot Results

function PlotR(X, IDX)
    k = max(IDX); % Define culster num

    Colors=hsv(k);

    Legends = {};
    for i=0:k
        Xi=X(IDX==i,:);
        if i~=0
            Style = 'x';
            MarkerSize = 8;
            Color = Colors(i,:);
            Legends{end+1} = ['Cluster' num2str(i)];
        else
            Style = 'o';
            MarkerSize = 6;
            Color = [0 0 0];
            if ~isempty(Xi)
                Legends{end+1} = 'Noise';
            end
        end
        if ~isempty(Xi)
            plot(Xi(:,1),Xi(:,2),Style,'MarkerSize',MarkerSize,'Color',Color);
        end
        hold on;
    end
    hold off;
    axis equal;
    grid on;
    legend(Legends);
    legend('Location', 'NorthEastOutside');
end
X = [X,IDX];
end

