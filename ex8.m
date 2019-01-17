% %Rectangular Waveguide
close all;
clear all;

n1 = 3.48;
%n1 = input('Refrective index of Core n1 :');
n2 = 1.44;
%n2 = input('Refrective index of n2 :');
n3 = 1;
%n3 = input('Refrective index of n3 :');
n4 = 1;
%n4 = input('Refrective index of n4 :');
n5 = 1;
%n5 = input('Refrective index of n5 :');
height = 0.1;
width = 0.1;
a = height*10^(-4);
b = width*10^(-4);
global lambda nf ns nc h  %전역변수 지정 
nf = n1;
ns = n2;
nc = n3;
h = a;
lambda = 1.55*10^(-4);
%변수값 받아서 연산하는 애들은 전역변수 선언에서 제외함.
k = 2*pi/lambda;
kmax = sqrt(k^2*nf^2-k^2*ns^2);
%X mode
Xrts=[];%rootsOfFZERO
for i = 1:100:kmax %교점을 찾아낸다
    rt = round(fzero(@(x)f(x),i),3);
    if rt > 0
        Xrts = union(Xrts,rt); 
    end
end
Xl=length(Xrts);
Xmds = [];
for i = 1:Xl %점근선을 솎아낸다
    md = Xrts(i);
    if mod(i,2) == 0 %모든 상황에 만족/  
        Xmds = union(Xmds,md);
    end
end
Xlmds = length(Xmds);
%Y mode
nf = n1;
ns = n5;
nc = n4;
h = b;
Yrts=[];%rootsOfFZERO
for i = 1:100:kmax %교점을 찾아낸다
    rt = round(fzero(@(x)f(x),i),3);
    if rt > 0
        Yrts = union(Yrts,rt); 
    end
end
l=length(Yrts);
Ymds = [];
for i = 1:l %점근선을 솎아낸다
    md = Yrts(i);
    if mod(i,2) == 0  
        Ymds = union(Ymds,md);
    end
end
Ylmds = length(Ymds);
%%
%그래프 출력부분
x=-a/2:0.0000001:a/2;
y=-b/2:0.0000001:b/2;
[X,Y]=meshgrid(x,y);
figure(1) %X
for i = 1:Xlmds
    md= Xmds(i);
    Z=cos(md.*X)./(cos(md.*a./2));
    subplot(Xlmds,1,i);
    hold on
    axis tight
    mesh(X,Y,Z)   
end
figure(2) %Y
for i = 1:Ylmds
    md= Ymds(i);
    Z=cos(md.*Y)./(cos(md.*b./2));
    subplot(Ylmds,1,i);
    hold on
    axis tight
    mesh(X,Y,Z)   
end
figure(3) %XY
for i = 1:Xlmds
    mdx= Xmds(i);
    for j = 1:Ylmds
        mdy= Ymds(j);
        Z=cos(mdx.*X)./(cos(mdx.*a./2)).*cos(mdy.*Y)./(cos(mdy.*b./2));
        subplot(Xlmds,Ylmds,j+(i-1)*Ylmds);
        hold on
        axis tight
        mesh(X,Y,Z)   
    end    
end





