%symmetric case
close all;
clear all;
%�׷���plot����-����
global lambda nf ns nc h  %�������� ���� �õ�
% nf = input('film refraction index: ');
% ns = input('substrate refraction index: ');
% nc = input('cover refractioin index: ');
% h = input('waveguide thickness: (/mum)')*10^(-6);
% lambda = input('wavelength: /mum')*10^(-6);
nf = 3.590;
ns = 3.385;
nc = 3.385;
h = 0.3*10^(-6);
lambda = 0.9*10^(-6);
%������ �޾Ƽ� �����ϴ� �ֵ��� �������� ���𿡼� ������.
k = 2*pi/lambda;
kmax = sqrt(k^2*nf^2-k^2*ns^2);
kappa= (0:5000:kmax);
beta = sqrt(k^2*nf^2-kappa.^2);
gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);
%% 
rte=[];%roots Of even FZERO
for i = 1:10000:kmax %������ ã�Ƴ���
    rt = round((fzero(@(x)ef(x),i)),3);
    if rt > 0
        rte = union(rte,rt); 
    end
end
le=length(rte);
emd = [];%even����
for i = 1:le %���ټ��� �ԾƳ���
    md = rte(i);
    if mod(i,2) ~= 0 %��� ��Ȳ�� ����/  
        emd = union(emd,md);
    end
end
lemd = length(emd);
rto=[];%roots Of odd FZERO
for i = 1:1000:kmax %������ ã�Ƴ���
    rt = round(fzero(@(x)of(x),i),3);
    if rt > 0
        rto = union(rto,rt); 
    end
end
lo=length(rto);
omd = [];%odd����
for i = 1:lo %���ټ��� �ԾƳ���
    md = rto(i);
    if mod(i,2) ~= 0   
        omd = union(omd,md);
    end
end
lomd = length(omd);
mods = union(emd,omd)
lmods = length(mods)
%even �׷��� ��ºκ�
figure

plot(kappa.*h./2,(kappa.*h./2).*tan(kappa.*h./2),'c')
hold on
plot(kappa.*h./2,-1*(kappa.*h./2).*cot(kappa.*h./2),'b')
hold on %����
plot(kappa.*h./2,sqrt(-1*(kappa.*h./2).^2+(nf^2-ns^2)*((k*h/2)^2)),'g')
xlabel('k_{x}h/2')
ylabel('\gammad/2')
for i = 1:lemd
    r = emd(i);
    plot(r*h./2,(r.*h./2).*tan(r.*h./2),'o')
    hold on
end    
for i = 1:lomd
    r = omd(i);
    plot(r*h./2,-1*(r.*h./2).*cot(r.*h./2),'o')
    hold on
end    
%�׷��� �Ӽ�
axis([0 kmax*h/2+1 0 kmax*h/2+1]);
grid on;