rclear
clc

S = zeros(1,500);
V = zeros(1,500);

for j=1:500
    for k=1:6
        si = normrnd(6.9,3,1);
        S(1,j) = S(1,j) + si;
        V(1,j) = V(1,j) + fee(si) - MultiSpend(si);
    end
end

figure;
scatter(S,V);
hold on;

title('�������ģ��');
xlabel('��Ӫ����/km');
ylabel('����/Ԫ');
legend('ֱ�ӷſշ��������ؿ�','�����Ŷ��ؿ�');

for j=1:500
    waitPlot();
end


function spend =  MultiSpend(s)
spend = 0.2*log(s) + 4.78;
end


function waitPlot()

S = normrnd(34,12,1);

V_day = fee(S) - WaitSpend(S);

scatter(S,V_day,'r');
legend('ֱ�ӷſշ��������ؿ�','�����Ŷ��ؿ�');

end


function spend = WaitSpend(s)
spend = 0.049*s;
end


function val = fee(s)
% ���⳵�Ʒ�

fee1 = 14;
fee2 = 14 + 2.5*(s-3);
fee3 = 14 + 2.5*12 + 3.6*(s-15);

val = (fee1).*(s>=0 & s<=3) + (fee2).*(s>3 & s<=15) + (fee3).*(s>15);
end