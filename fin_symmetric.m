%symmetric case
close all;
clear all;
%그래프plot단위-변경
global lambda nf ns nc h  %전역변수 지정 시도
nf = input('film refraction index: ');
ns = input('substrate refraction index: ');
nc = input('cover refractioin index: ');
thick = input('waveguide thickness (10^(-6)m):');
wlength = input('wavelength (10^(-6)m):');
h = thick*10^(-6);
lambda = wlength*10^(-6);
%변수값 받아서 연산하는 애들은 전역변수 선언에서 제외함.
k = 2*pi/lambda;
kmax = sqrt(k^2*nf^2-k^2*ns^2);
kappa= (0:1:kmax);
beta = sqrt(k^2*nf^2-kappa.^2);
gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);
if ns == nc
    rte=[];%roots Of even FZERO
    for i = 1:1000:kmax %교점을 찾아낸다
        rt = round((fzero(@(x)ef(x),i)),3);
        if rt > 0
            rte = union(rte,rt); 
        end
    end
    le=length(rte);
    emd = [];%even교점
    for i = 1:le %점근선을 솎아낸다
        md = rte(i);
        if mod(i,2) ~= 0 %모든 상황에 만족/  
            emd = union(emd,md);
        end
    end
    lemd = length(emd);
    rto=[];%roots Of odd FZERO
    for i = 1:1000:kmax %교점을 찾아낸다
        rt = round(fzero(@(x)of(x),i),3);
        if rt > 0
            rto = union(rto,rt); 
        end
    end
    lo=length(rto);
    omd = [];%odd교점
    for i = 1:lo %점근선을 솎아낸다
        md = rto(i);
        if mod(i,2) ~= 0   
            omd = union(omd,md);
        end
    end
    lomd = length(omd);
    mods = union(emd,omd)
    lmods = length(mods)
    %even 그래프 출력부분
    figure
    ax1 = subplot(lmods+1,1,1);%find out modes
    plot(ax1,kappa.*h./2,(kappa.*h./2).*tan(kappa.*h./2),'c')
    hold on
    plot(ax1,kappa.*h./2,-1*(kappa.*h./2).*cot(kappa.*h./2),'b')
    hold on %교점
    plot(ax1,kappa.*h./2,sqrt(-1*(kappa.*h./2).^2+(nf^2-ns^2)*((k*h/2)^2)),'g')
    xlabel('k_{x}h/2')
    ylabel('\gammad/2')
    title('Find out modes')
    for i = 1:lemd
        r = emd(i);
        plot(ax1,r*h./2,(r.*h./2).*tan(r.*h./2),'o')
        hold on
    end    
    for i = 1:lomd
        r = omd(i);
        plot(ax1,r*h./2,-1*(r.*h./2).*cot(r.*h./2),'o')
        hold on
    end    
    %그래프 속성
    axis(ax1,[0 kmax*h/2+1 0 kmax*h/2+1]);
    grid on;
    %mode그래프

    wave=[];

    for i = 1:lmods
        md= mods(i);
        x=-h:0.0000001:h;
        k=0;
        if mod(i,2) ~= 0
            for it = x
                k=k+1;
                x(k) = it;
                wave(k)=ew(x(k),md);
            end
        else    
            for it = x
                k=k+1;
                x(k) = it;
                wave(k)=ow(x(k),md);
            end
        end    
        ax = subplot(lmods+1,1,i+1);
        plot(ax,x,wave)
        %xlim(ax,[-h h])
        title(['<mode' num2str(i-1) '>'])
        xlabel('Position(\mum)')
        grid on;
    end
else
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
        x=-h-h/2:0.0000001:h/2;
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
end    