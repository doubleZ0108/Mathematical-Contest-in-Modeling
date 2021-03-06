rx = 0:0.01:60;
ay = pi/2:0.01:3*pi/2;
[r,a] = meshgrid(rx,ay);

t1 = r/120;
t2 = (562949953421312*log(4270344832607584375*exp(r/10) + 838425994690822144*exp(5)))/1366510346434427 - (562949953421312*log(4270344832607584375*exp(2) + 838425994690822144*exp(5)))/1366510346434427 + 1/6;
t3 = 1/6 + (562949953421312.*log(4270344832607584375.*exp(3) + 838425994690822144.*exp(5)))/1366510346434427 - (562949953421312.*log(4270344832607584375.*exp(2) + 838425994690822144.*exp(5)))/1366510346434427 + (562949953421312.*log(4270344832607584375.*exp(((r - 30).^2 - cos(a).*(60.*r - 1800) + 900).^(1/2)/10) + 838425994690822144.*exp(5)))/1366510346434427 - (562949953421312.*log(4270344832607584375.*exp(3) + 838425994690822144.*exp(5)))/1366510346434427;
t = (t1).*(r>=0 & r<=20) + (t2).*(r>20 & r<=30) + (t3).*(r>30);
mesh(t);

title('机场排队载客行驶距离-运营时间模型');
xl = xlabel('距离机场的距离/km');
yl = ylabel('转折角/rad');
zlabel('时间/h');
set(xl, 'Rotation', 15);
set(yl, 'Rotation', -30);


% 当 0<r<=20 时
% rx1 = 0:0.1:20;
% ay1 = pi/3:0.1:3*pi/2;
% [r,a] = meshgrid(rx1,ay1);
% 
% t = r/120;
% mesh(r,a,t);


%% 求解第二段的表达式
% syms r t
% A = 24.2741; B = -4.7659; C = -0.1000;
% maxL = 50;
% v = (A - B * exp(-C * (maxL - r)));
% t = 1/6 + int(1/v,20,r);

% 当 20<r<=30 时
% r2x = 20:0.1:30;
% ay2 = pi/3:0.1:3*pi/2;
% [r,a] = meshgrid(rx2,ay2);

% t = (562949953421312*log(4270344832607584375*exp(r/10) + 838425994690822144*exp(5)))/1366510346434427 - (562949953421312*log(4270344832607584375*exp(2) + 838425994690822144*exp(5)))/1366510346434427 + 1/6;
% mesh(t)


%% 求解第三段的表达式
% sym v r a rr
% A = 24.2741; B = -4.7659; C = -0.1000;
% maxL = 50;
% v = (A - B * exp(-C * (maxL - r)));
% rr = (30^2 + (r-30)^2 - 2*30*(r-30)*cos(a))^(0.5);
% t = 1/6 + int(1/v,20,30) + int(1/v, 30, rr);

% 当 30<r 时
% rx3 = 30:0.1:60;
% ay3 = pi/3:0.1:3*pi/2;
% [r,a] = meshgrid(rx3,ay3);
% t = 1/6 + (562949953421312.*log(4270344832607584375.*exp(3) + 838425994690822144.*exp(5)))/1366510346434427 - (562949953421312.*log(4270344832607584375.*exp(2) + 838425994690822144.*exp(5)))/1366510346434427 + (562949953421312.*log(4270344832607584375.*exp(((r - 30).^2 - cos(a).*(60.*r - 1800) + 900).^(1/2)/10) + 838425994690822144.*exp(5)))/1366510346434427 - (562949953421312.*log(4270344832607584375.*exp(3) + 838425994690822144.*exp(5)))/1366510346434427;
% mesh(t)









