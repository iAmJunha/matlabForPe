function owave = ow(x,mod) 
%odd case /모드의 field profile
global lambda nf ns nc h %전역변수 사용 선언함
%mod가 of에서 찾은 kappa값임.
k = 2*pi/lambda;
beta = sqrt(k^2*nf^2-mod.^2);
gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);
if x>0
    owv=-1.*exp(-1*gammac*x);
elseif x<=0 && x>-1*h
    owv=-1.*exp(-1.*gammac.*h./2)./sin(mod.*h).*sin(mod.*x);
else
    owv=exp(gammas.*(x+h));
end
owave=owv;
end