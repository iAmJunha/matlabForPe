function wave = w(x,mod) %%짝수홀수일때 다르게 하려면 입력변수 하나 추가해서 함수둘로 쪼개기 if짝수>펑션1else펑션2
%모드의 field profile
global lambda nf ns nc h %전역변수 사용 선언함

k = 2*pi/lambda;
beta = sqrt(k^2*nf^2-mod.^2);
gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);
if x>0
    wv=exp(-1*gammac*x);
elseif x<=0 && x>-1*h
    wv=cos(mod.*x)-(gammac./mod).*sin(mod*x);
else
    wv=(cos(mod.*h)+(gammac./mod).*sin(mod.*h)).*exp(gammas.*(x+h));
end
wave=wv;
end