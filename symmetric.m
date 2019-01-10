%symmetric case
close all;
clear all;
%�׷���plot����-����
global lambda nf ns nc h  %�������� ���� �õ�
% nf = input('film refraction index: ');
% ns = input('substrate refraction index: ');
% nc = input('cover refractioin index: ');
% h = input('waveguide thickness: ');
% lambda = input('wavelength: ');
nf = 3.590;
ns = 3.385;
nc = 3.385;
h = 1.0*10^(-6);
lambda = 0.9*10^(-6);

%������ �޾Ƽ� �����ϴ� �ֵ��� �������� ���𿡼� ������.
k = 2*pi/lambda;
kmax = sqrt(k^2*nf^2-k^2*ns^2);
kappa= (0:1:kmax);
beta = sqrt(k^2*nf^2-kappa.^2);
gammas=sqrt(beta.^2-k^2*ns^2);
gammac=sqrt(beta.^2-k^2*nc^2);
%% 
rte=[];%roots Of even FZERO
for i = 1:1000:kmax %������ ã�Ƴ���
    rt = round((fzero(@(x)ef(x),i)),3);
    if rt > 0
        rte = union(rte,rt); 
    end
end
le=length(rte);
emd = [];%even����
for i = 1:l %���ټ��� �ԾƳ���
    md = rte(i);
    if mod(i,2) ~= 0 %��� ��Ȳ�� ����/  
        emd = union(emd,md);
    end
end
%lemd = length(emd);
% rto=[];%roots Of odd FZERO
% for i = 1:100:kmax %������ ã�Ƴ���
%     rt = round(fzero(@(x)of(x),i),3);
%     if rt > 0
%         rto = union(rto,rt); 
%     end
% end
% l=length(rto);
% omd = [];%odd����
% for i = 1:l %���ټ��� �ԾƳ���
%     md = rto(i);
%     if mod(i,2) == 0   
%         omd = union(omd,md);
%     end
% end
% lomd = length(omd);
% %evenmode����
%% 
%even �׷��� ��ºκ�
figure
ax1 = subplot(2,1,1);%find out modes
plot(ax1,kappa.*h./2,(kappa.*h./2).*tan(kappa.*h./2),'c')
hold on
plot(ax1,kappa.*h./2,-1*(kappa.*h./2).*cot(kappa.*h./2),'b')
hold on %����
plot(ax1,kappa.*h./2,sqrt(-1*(kappa.*h./2).^2+(nf^2-ns^2)*((k*h/2)^2)),'g')
xlabel('k_{x}h/2')
% for i = 1:lemd
%     r = emd(i)
%     plot(ax1,r,tan(h*r),'o')
%     hold on
%     
% end    
%�׷��� �Ӽ�
axis(ax1,[0 6 0 6]);
grid on;
% for i = 1:lemd
%     md= emd(i);
%     x=-h-h/2:0.00001:h/2;
%     k=0;
%     for it = x
%        k=k+1;
%        x(k) = it;
%        wave(k)=w(x(k),md);
%     end
%     ax = subplot(lemd+1,1,i+1);
%     plot(ax,x,wave)
%     xlim(ax,[-3/2*h 1/2*h])
%     grid on;
% end
