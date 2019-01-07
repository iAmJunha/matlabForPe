function v = f(x)
%교점 찾기위한 함수
nf = 1.50;
ns = 1.45;
nc = 1.40;
h=0.0005
%global lambda
lambda = 1.55*10^(-4);
k = 2*pi/lambda;
beta = sqrt(k^2*nf^2-x.^2);
gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);
%kmax = sqrt(k^2*nf^2-k^2*ns^2);
v = tan(h.*x)-(gammas+gammac)./((1-gammas.*gammac./x.^2).*x);
