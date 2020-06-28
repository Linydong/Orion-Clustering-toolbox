function [Minpts,Eps] = DBSCANParameter(X,Minpts)
%DBSCANPARAMETER 推荐参数Minpts,Eps
%   不想写详细说明
if(nargin < 2)
    Minpts = 4;
end
[m,n]=size(X);
Eps=((prod(max(X)-min(X))*Minpts*gamma(.5*n+1))/(m*sqrt(pi.^n))).^(1/n);

end

