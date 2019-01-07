%sym으로  함수w(x)정의 하고 집어 넣기 
function wave = w(x,md) %md는 교점의 kappa값 루프에서 i로 집어넣자
nf = 1.50;
ns = 1.45;
nc = 1.40;
h = 0.0005;
lambda = 1.55*10^(-4);
k = 2*pi/lambda;

beta = sqrt(k^2*nf^2-md.^2);
gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);
if x>0
    wv=exp(-1*gammac*x);
elseif x<=0 && x>-1*h
    wv=cos(md.*x)-(gammac./md).*sin(md*x);
else
    wv=(cos(md.*h)+(gammac./md).*sin(md.*h)).*exp(gammas.*(x+h));
%amp=1/sqrt(beta/(2*omega*mu)*int(w(x,i)^2,-0.001,0.0002))
% plot(amp*w(x),{x,-h-0.0003,0.0002})
end
wave=wv;
end