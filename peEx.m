close all;
clear all;
%그래프plot단위-변경
global lambda nf ns nc h  %전역변수 지정 시도
nf = 1.50;
ns = 1.45;
nc = 1.40;
h = 0.0005;
lambda = 1.55*10^(-4);
%변수값 받아서 연산하는 애들은 전역변수 선언에서 제외함.
k = 2*pi/lambda;
kmax = sqrt(k^2*nf^2-k^2*ns^2);
kappa= (0:1:kmax);
beta = sqrt(k^2*nf^2-kappa.^2);
gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);
rts=[];%rootsOfFZERO
for i = 1:100:kmax %교점을 찾아낸다
    rt = round(fzero(@(x)f(x),i),3);
    if rt > 0
        rts = union(rts,rt); 
    end
end
l=length(rts);
mds = [];
for i = 1:l %점근선을 솎아낸다
    md = rts(i);
    if mod(i,2) == 0 %모든 상황에 만족/  
        mds = union(mds,md)
    end
end
lmds = length(mds)
%그래프 출력부분
figure
ax1 = subplot(lmds+1,1,1)%find out modes
plot(ax1,kappa,tan(h.*kappa),'c')
hold on
plot(ax1,kappa,((gammas+gammac)./((1-gammas.*gammac./kappa.^2).*kappa)),'b')
hold on %교점
title('Find Roots')
xlabel('kappa')
for i = 1:lmds
    r = mds(i)
    plot(ax1,r,tan(h*r),'o')
    hold on
    
end    
%그래프 속성
axis(ax1,[0 kmax -10 10]);
grid on;
for i = 1:lmds
    md= mds(i);
    x=-h-h/2:0.00001:h/2;
    k=0;
    for it = x
       k=k+1;
       x(k) = it;
       wave(k)=w(x(k),md);
    end
    ax = subplot(lmds+1,1,i+1);
    plot(ax,x,wave)
    xlim(ax,[-3/2*h 1/2*h])
    title(['mode' num2str(i-1)])
    xlabel('Position(\mum)')
    grid on;
end

