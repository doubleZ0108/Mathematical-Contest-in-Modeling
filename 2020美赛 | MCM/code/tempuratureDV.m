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
land = shaperead('landareas', 'UseGeoCoords', true); %����½�ؿ��
geoshow(ax, land);

setm(gca,'MLineLocation',1)%���þ��ȼ��Ϊ1
setm(gca,'PLineLocation',1)%���þ��ȼ��Ϊ1
title(['SST chart off Scotland ' year_str '.' month_str]);

data = csvread(dataname);
[m,n] = size(data);

% ���л�ͼ
for jj=1:n
    lon=jj-21;
    if lon<1
        lon=360+lon;
    end
    surfm(52:63,lon:lon+1,data(:,jj));
end

% �������һ�еľ��
for jj=1:n
    lon=jj-21;
    if lon<1
        lon=360+lon;
    end
    surfm(52:53,lon:lon+1,data(1,jj));
end

img = geoshow(ax, land);  % �ٴθ���Ӣ����ͼ
colorbar('position', [0.94 0.1 0.02 0.8]);

frame = getframe(fig); % ��ȡframe
im = frame2im(frame); % ��frame�任��imwrite��������ʶ��ĸ�ʽ
imwrite(im,figurename); % ���浽����Ŀ¼�£�����Ϊ"a.png"

end