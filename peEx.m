close all;
%그래프plot---단위 다시 바꾸기
nf = 1.50;
ns = 1.45;
nc = 1.40;
h = 0.0005;%GUV
%global lambda 전역변수 지정 시도했으나 실패
lambda = 1.55*10^(-4);%GUV/조건따라 바뀌는 값
k = 2*pi/lambda;
kmax = sqrt(k^2*nf^2-k^2*ns^2);
kappa= (0:1:kmax);
beta = sqrt(k^2*nf^2-kappa.^2);
gammas=sqrt(beta.^2-k^2*ns^2);%GUV
gammac=sqrt(beta.^2-k^2*nc^2);%GUV
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
    if mod(i,2) == 0
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
for i = 1:lmds
    x = mds(i)
    plot(ax1,x,tan(h*x),'o')
    hold on
end    
%그래프 속성
axis(ax1,[0 20000 -10 10]);
grid on;
for i = 1:lmds
    md= mds(i);
    x=-h-0.0003:0.00001:0.0002;
    k=0;
    for it = x
       k=k+1;
       x(k) = it;
       wave(k)=w(x(k),md);
    end      
    plot(subplot(lmds+1,1,i+1),x,wave)
    grid on;
end

