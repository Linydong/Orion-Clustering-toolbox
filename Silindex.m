%���ڼ�������ϵ��(Silhouette Coefficient)�ĺ���
%ֻҪ����ԭʼ���ݣ��Ѿ�������������ݣ��Ϳ������Sil
%si�ӽ�1����˵������i�������
%si�ӽ�-1����˵������i��Ӧ�÷��ൽ����Ĵء�
%��si����Ϊ0����˵������i�������صı߽��ϡ�
function Sil=Silindex(X,index)
Sil = silhouette(X,index);
Sil = mean(Sil);
end% mean Silhouette