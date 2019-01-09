function wave = w(x,mod) %%¦��Ȧ���϶� �ٸ��� �Ϸ��� �Էº��� �ϳ� �߰��ؼ� �Լ��ѷ� �ɰ��� if¦��>���1else���2
%����� field profile
global lambda nf ns nc h %�������� ��� ������

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