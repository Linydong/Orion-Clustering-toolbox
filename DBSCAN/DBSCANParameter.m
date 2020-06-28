function [Minpts,Eps] = DBSCANParameter(X)
%DBSCANPARAMETER �Ƽ�����Minpts,Eps
%   ����д��ϸ˵��
[m,n]=size(X);
Minpts = 4;
Eps=((prod(max(X)-min(X))*Minpts*gamma(.5*n+1))/(m*sqrt(pi.^n))).^(1/n);

end

