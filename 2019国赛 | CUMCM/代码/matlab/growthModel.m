clear
clc

figure;

AA = zeros(1,3);
BB = zeros(1,3);
CC = zeros(1,3);

for k=1:3
    syms x y a b C

    s1 = 30;
%     P = 0.95;
    if k==1
        P=0.95;
    elseif k==2
        P=0.92;    
    else
        P=0.89;
    end
    K = 1;

    x1 = s1;
    y1 = P;
    eq1 = y1 == K/(1 + a * b^x1) - 1/(1 + a);
    % eq1 = y1 == K / (1 + b * exp(1)^(-a*x1))-1/(b+1)

    x2 = s1*0.618;
    y2 = P*0.5;
    eq2 = y2 == K/(1 + a * b^x2) - 1/(1 + a);
    % eq2 = y2 == K / (1 + b * exp(1)^(-a*x2))-1/(b+1)



    [a,b] = solve(eq1, eq2, a, b);
    C =  - 1/(1 + a);
    
    AA(1,k) = round(a*1000)/1000;
    BB(1,k) = round(b*1000)/1000;
    CC(1,k) = round(C*1000)/1000;
    
    for ii=1:size(a)
        try
            y = 1/(1 + a(ii) * b(ii)^x) + C(ii);
            ezplot(y, [0, 50, 0, 1]);
            hold on;
        end
    end
    
end

title('载客概率-Logistic函数');
xlabel('距离机场的直线距离/km');
ylabel('载客概率');
legend(['a=',num2str(AA(1,1)),' b=',num2str(BB(1,1)),' C=',num2str(CC(1,1))],['a=',num2str(AA(1,2)),' b=',num2str(BB(1,2)),' C=',num2str(CC(1,2))],['a=',num2str(AA(1,3)),' b=',num2str(BB(1,3)),' C=',num2str(CC(1,3))]);

