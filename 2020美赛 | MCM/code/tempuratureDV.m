clc
clear

data_dirname = 'data/temperature/data/';
figure_dirname = 'data/temperature/figure/';

for year=2012:2019
    for month=1:12
        year_str = num2str(year);
        if month<10
            month_str = ['0' num2str(month)];
        else
            month_str = num2str(month);
        end
        plotEngland([data_dirname year_str '_' month_str '.csv'], [figure_dirname year_str '_' month_str '.png'], year_str, month_str);
    end
end


function plotEngland(dataname, figurename, year_str, month_str)
fig = figure;
ax = worldmap([52, 63], [340 10]); 
land = shaperead('landareas', 'UseGeoCoords', true); %导入陆地框架
geoshow(ax, land);

setm(gca,'MLineLocation',1)%设置经度间隔为1
setm(gca,'PLineLocation',1)%设置经度间隔为1
title(['SST chart off Scotland ' year_str '.' month_str]);

data = csvread(dataname);
[m,n] = size(data);

% 逐列绘图
for jj=1:n
    lon=jj-21;
    if lon<1
        lon=360+lon;
    end
    surfm(52:63,lon:lon+1,data(:,jj));
end

% 补充最后一行的锯齿
for jj=1:n
    lon=jj-21;
    if lon<1
        lon=360+lon;
    end
    surfm(52:53,lon:lon+1,data(1,jj));
end

img = geoshow(ax, land);  % 再次覆盖英国地图
colorbar('position', [0.94 0.1 0.02 0.8]);

frame = getframe(fig); % 获取frame
im = frame2im(frame); % 将frame变换成imwrite函数可以识别的格式
imwrite(im,figurename); % 保存到工作目录下，名字为"a.png"

end