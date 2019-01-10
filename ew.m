function ewave = ew(x,mod) 
%even case /모드의 field profile
global lambda nf ns nc h %전역변수 사용 선언함
%mod가 ef에서 찾은 kappa값임.
k = 2*pi/lambda;
beta = sqrt(k^2*nf^2-mod.^2);
gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);
if x>0
    ewv=exp(-1*gammac*x);
elseif x<=0 && x>-1*h
    ewv=exp(-gammac.*h./2)./cos(mod.*h./2).*cos(mod.*x);
else
    ewv=exp(gammas.*(x+h));
end
ewave=ewv;
end