%Ring Resonator-Single
clear all;
close all;
neff = 3.48;%À¯È¿±¼Àý·ü
r = 148*10^(-6);%ring¹ÝÁö¸§
% k=2*pi/lambda;
a=0.9;%loss coefficient
t=0.9;%coupling losses
res = 
lambda=1.549:0.00001:1.5505;
plot(lambda,(a^2+t^2-2*a*t.*cos(4*pi^2*neff*r./(lambda.*10^(-6))))./(1+a^2*t^2-2*a*t.*cos(4*pi^2*neff*r./(lambda.*10^(-6)))))
axis ([1.549 1.5505 0 1])
hold on 
plot(res,pres)
xlabel('Wavelength [\mum]')
ylabel('Intensity')
title('Notch type ring resonator filter characteristic')