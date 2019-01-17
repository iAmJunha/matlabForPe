function v = f(x)
%교점 찾기위한 함수
global lambda nf ns nc h %전역변수 사용 선언함

k = 2*pi/lambda;
beta = sqrt(k^2*nf^2-x.^2);
gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);
%global lambda
%kmax = sqrt(k^2*nf^2-k^2*ns^2);
v = tan(h.*x)-(gammas+gammac)./((1-gammas.*gammac./x.^2).*x);
