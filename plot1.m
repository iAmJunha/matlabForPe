clear all;
close all;
%�׷���plot---���� �ٽ� �ٲٱ�
nf = 1.50;
ns = 1.45;
nc = 1.40;
h = 0.0005;
lambda = 1.55*10^(-4);
k = 2*pi/lambda;

kmax = sqrt(k^2*nf^2-k^2*ns^2);
kappa= (0:1:kmax);
beta = sqrt(k^2*nf^2-kappa.^2);

gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);

plot(kappa,tan(h.*kappa),'c')
hold on
plot(kappa,((gammas+gammac)./((1-gammas.*gammac./kappa.^2).*kappa)),'b')
%�׷��� ��� ����
axis([0 20000 -10 10])
ax = gca;
%ax.XAxisLocation = 'origin';%location of axis
xlabel('kappa') % x-axis label
hold on
%��ã��--�ݺ��Ǵ� �Ŵ� for ������ �ٲٱ�->����Ƚ�� ��������ؼ� �����÷԰����ֱ�
%
rt1=fzero(@(x)f(x),[4000 6000])
rt2=fzero(@(x)f(x),[10000 12000])
rt3=fzero(@(x)f(x),15000)



plot(rt1,tan(h*rt1),'o')
hold on
plot(rt2,tan(h*rt2),'o')
hold on
plot(rt3,tan(h*rt3),'o')
hold on
%mode���ϱ�
beta0 = k*nf;









