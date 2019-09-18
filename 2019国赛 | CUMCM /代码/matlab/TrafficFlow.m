x = -20:0.1:150;

gap_x = 2.25;
gap_y = -6;
gap_z = -10;
figure;
hold on;

for k=0:2
    y1 = 8*(x-k^2*gap_x) + 1000 + k*gap_y;
    y2 = 1000 + k*gap_y;
    y3 = 8*(x-k^2*gap_x) + 592 + k*gap_y;
    
    y = (y1).*(x<=k^2*gap_x) + (y2).*(x>k^2*gap_x & x<=51+k^2*gap_x) + (y3).*(x>51+k^2*gap_x);
    plot(x,y);
end

for k=0:2:4
    y1 = 8*(x-k^2*gap_x+gap_z) + 928 + k*gap_y;
    y2 = 982 + k*gap_y;
    y3 = 8*(x-k^2*gap_x+gap_z) + 520 + k*gap_y;
    y4 = 1000 + k*gap_y;
    y5 = 8*(x-k^2*gap_x+gap_z) + 112 + k*gap_y;
    
    y = (y1).*(x<=6.75 + k^2*gap_x-gap_z) + (y2).*(x>6.75 + k^2*gap_x-gap_z & x<=57.75+k^2*gap_x-gap_z) + (y3).*(x>57.75+k^2*gap_x -gap_z& x<=60 + k^2*gap_x-gap_z) + (y4).*(x>60 + k^2*gap_x-gap_z & x<=111 + k^2*gap_x-gap_z) + (y5).*(x>111 + k^2*gap_x-gap_z);
    plot(x,y);
end

xlabel('时间/s');
ylabel('距离/m');
title('乘车区时空轨迹图');
legend('f1','f2','f3','g1','g2','g3');
axis([-20 150 900 1100]);
set(gca,'xtick',[])
set(gca,'ytick',[])