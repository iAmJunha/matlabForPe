clear all;
close all;
%그래프plot---단위 다시 바꾸기
nf = 1.50;
ns = 1.45;
nc = 1.40;
h = 0.0005;
lambda = 1.55*10^(-4);
k = 2*pi/lambda;

kmax = sqrt(k^2*nf^2-k^2*ns^2);
kappa= (0:0.01:kmax);
beta = sqrt(k^2*nf^2-kappa.^2);

gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);

plot(kappa,tan(h.*kappa),'x')
axis([0 20000 -10 10])