clear
clc

syms a b c maxL

% v = a - b * exp(-c * r)

c = -0.1;
maxL = 50;


r1 = 20;
v1 = 120;
eq1 = v1 == a - b * exp(-c * (maxL-r1));

r2 = 50;
v2 = 29.04;
eq2 = v2 == a - b * exp(-c * (maxL - r2));


[a,b] = solve(eq1,eq2,a,b);
a = double(a)
b = double(b)
c = double(c)

r = linspace(0,50);
v = (a - b * exp(-c * (maxL - r))) .* (r>=20) + (120).*(r>=0 & r<20);
figure;
plot(r,v);
axis([0 50 0 140]);     % axisҪ����plot֮��

title('���⳵��ʻ�ٶ�-���������');
xlabel('���������/km');
ylabel('��ʻ�ٶ�/km?h^(-1)');
