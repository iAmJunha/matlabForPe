function evenv = ef(x)
%even���� ã������ �Լ�
global lambda nf ns h %�������� ��� ������
k = 2*pi/lambda;
beta = sqrt(k^2*nf^2-x.^2);
gamma=sqrt(beta.^2-k^2*ns^2);

evenv = tan(x.*h./2)-gamma./x;
