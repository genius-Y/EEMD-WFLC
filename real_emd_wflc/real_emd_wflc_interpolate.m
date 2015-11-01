clear;
close all;
load('emdpre10');
 Te = 5;
clear('ecg');
ecg =zoom( modes(1,:)+ modes(2,:),Te,10);


u = 1;
u0 = 0.3;
%u0 = 0;
tsize = 6000;
w0 = 1;

[N1,M1] = size(modes);
N  = 2; M = M1;
w = zeros(N,1);
x = zeros(N,1);
x1 = zeros(N,1);
pder = zeros(N,1);
dw0 = 1;
recorde = zeros(tsize,1);
recordw = zeros(tsize,1);
sumw0 = 0;

for i = 1:tsize
    sumw0 = sumw0 + w0;
    y1 = modsub(floor(sumw0),T0);
    y2 = modsub(ceil(sumw0),T0);
    t = sumw0-floor(sumw0);

    for j = 1:N
        x(j,1) = t* modes(j,y2) + (1-t)* modes(j,y1);
    end
%     
%    
%     y1 = modsub(floor(i * w0),T0);
%     y2 = modsub(y1+1,T0);
%     t = sumw0-floor(sumw0);
%     
%     for j = 1:N
%         x(j,1) = t* modes(j,y2) + (1-t)* modes(j,y1);
%     end
%     
if(abs( w0-2) <=0.004)
ssss=1;    
end
%     
%     catch
%         sss = 1;
%     end  
    y1 = modsub(i,Te);
    e = ecg(y1) - w' * x;
    sumw01 = sumw0+ 0.00001;
    for j=1:N
    pder(j) =( modes(j,modsub(ceil(sumw01),T0)) - modes(j,modsub(floor(sumw01),T0)))/dw0;
   % pder(j) =( modes(j,modsub(floor(i * w0)+1,T0)) - modes(j,modsub(floor(i * w0),T0)))/dw0;
    end
    w0 = w0 + 2*u0*e*w'*pder;
    recordw(i) = w0;
    recorde(i) = e;
    w = w + 2 * u * e * x;
end
figure(5);

plot(recorde);
title('error');

figure(6);
plot(recordw);
title('weight');
w
w0


zz=linspace(0,4150);
yy=spline(y,z,zz)