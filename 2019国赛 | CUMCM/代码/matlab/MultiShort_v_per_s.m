clear
clc

figure;

for k=1:6
    subplot(2,3,k);
    plot1block(k)
    title(['n=',num2str(k)]);
    xlabel('总运营时间/小时');
    ylabel('净收益/元');
end


function plot1block(n)

p22 = 0.1585;
a1 = fee(22) - 2 * 22 * 0.049;

%% 生成n个Sjdi
Sjdi = zeros(1,n);
for k=1:n
    while(1)    % assert(Sjdi<=22);
        Sjdi(1,k) = normrnd(34,12,1);
        if Sjdi(1,k)<=22, break; end
    end
end

for z=1:10
    
    %% 求分子
    while(1)    % assert(Sjc>22);
        Sjc = normrnd(34,12,1);
        if Sjc>22, break; end
    end

    % total_fee = 0;
    % for k=1:n
    %     total_fee = total_fee + p22^(n-1) * (fee(Sjdi(1,k)) - 2*Sjdi(1,k)*0.049);
    % end

    Mjn = 1/(1-p22)*a1 + p22.^(n-1)*(1-p22)*(fee(Sjc) - 2*Sjc*0.049);

    %% 求分母中的常数项
    syms r
    a = 24.2741; b = -4.7659; c = -0.1000;
    V = a - b * exp(-c * (50 - r));

    sum = 0;
    for k=1:n
        tmp = Sjdi(1,k);

        if tmp<20
            intTmp = int(1/120,r,0,tmp);
        else
            intTmp = int(1/120,r,0,20) + int(1/V,r,0,tmp);
        end

        sum = sum + intTmp;
    end

    Tj1 = int(1/120,r,0,20) + int(1/V,r,0,Sjc);

    t=0:0.1:4;
    y = Mjn ./ (t + sum + Tj1);
    plot(t,y, 'r');
    hold on;
end


%%long
plot10long();

end

function plot10long()
%% long

syms long_r

a = 24.2741; b = -4.7659; c = -0.1000;
long_V = a - b * exp(-c * (50 - long_r));

long_S = zeros(1,10);

for k=0:9
    long_s = normrnd(34,12,1);
    long_S(1,k+1) = long_s;
    long_v = (14).*(long_s>=0 & long_s<=3) + (14 + 2.5*(long_s-3)).*(long_s>3 & long_s<=15) + (14 + 2.5*12).*(long_s>15);
    top = long_v - 0.049 * long_s;
    
    if long_s<20
        bottom = int(1/120,long_r,0,long_r);
    else
        bottom = int(1/120,long_r,0,20) + int(1/long_V,long_r,20,long_s);
    end
    
    long_t=0:0.1:4;
    long_y = top./(long_t+bottom);

    try
        plot(long_t,long_y,'b');
    end
    
end

end

function val = fee(s)
% 出租车计费

fee1 = 14;
fee2 = 14 + 2.5*(s-3);
fee3 = 14 + 2.5*12 + 3.6*(s-15);

val = (fee1).*(s>=0 & s<=3) + (fee2).*(s>3 & s<=15) + (fee3).*(s>15);
end

