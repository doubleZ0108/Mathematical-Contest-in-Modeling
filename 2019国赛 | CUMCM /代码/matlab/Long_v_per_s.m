
clear
clc

syms r

a = 24.2741; b = -4.7659; c = -0.1000;
V = a - b * exp(-c * (50 - r));

S = zeros(1,10);

for k=0:9
    s = normrnd(34,12,1);
    S(1,k+1) = s;
    v = (14).*(s>=0 & s<=3) + (14 + 2.5*(s-3)).*(s>3 & s<=15) + (14 + 2.5*12).*(s>15);
    top = v - 0.049 * s;
    
    if s<20
        bottom = int(1/120,r,0,r);
    else
        bottom = int(1/120,r,0,20) + int(1/V,r,20,s);
    end
    
    t=0:0.1:4;
    y = top./(t+bottom);
    if k==0, figure; end
    try
        plot(t,y);
    end
    if k==0, hold on; end
    
end

title('长途出租车单位时间净收益');
xlabel('总运营时间/小时');
ylabel('净收益/元');
legend(['s=',num2str(S(1,1))],['s=',num2str(S(1,2))],['s=',num2str(S(1,3))],['s=',num2str(S(1,4))],['s=',num2str(S(1,5))],['s=',num2str(S(1,6))],['s=',num2str(S(1,7))],['s=',num2str(S(1,8))],['s=',num2str(S(1,9))],['s=',num2str(S(1,10))])