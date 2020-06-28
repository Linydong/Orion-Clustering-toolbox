function [Minpts,Eps] = DBSCANParameter(X)
%DBSCANPARAMETER 推荐参数Minpts,Eps
%   不想写详细说明
[m,n]=size(X);
Minpts = 4;
Eps=((prod(max(X)-min(X))*Minpts*gamma(.5*n+1))/(m*sqrt(pi.^n))).^(1/n);

end

