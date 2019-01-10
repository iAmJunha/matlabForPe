function owave = ow(x,mod) 
%odd case /����� field profile
global lambda nf ns nc h %�������� ��� ������
%mod�� of���� ã�� kappa����.
k = 2*pi/lambda;
beta = sqrt(k^2*nf^2-mod.^2);
gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);
if x>h./2
    owv=-1.*exp(-1*gammac*x);
elseif x<=h./2 && x>-1*h./2
    owv=-1.*exp(-1.*gammac.*h./2)./sin(mod.*h).*sin(mod.*x);
else
    owv=exp(gammas.*(x+h));
end
owave=owv;
end