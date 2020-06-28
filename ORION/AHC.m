function  [Z,T] =AHC(X,k,Method,Distance)
Z = linkage(X,Method,Distance);
T = cluster(Z,'maxclust',k);

end
