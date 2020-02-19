%=== ��ȡ���¶����ݣ�������Ӣ����ͼ

clc
clear

dirname = 'data/temperature/data/year/';
filename = 'temp_and_diff_prediction.csv';
T = readtable([dirname filename]);
[dummy, total_index] = size(T);

pos = floor(table2array(T(:,1:2)));

for year=2069:2069
    year_str = num2str(year);
%     index = 10;
    index = total_index;
    temp = table2array(T(:,index));
    writeData(pos, temp, [dirname year_str '.csv'], year_str);
end


% clc
% clear
% data_dirname = 'data/temperature/data/year/';
% figure_dirname = 'data/temperature/figure/year/';
% 
% for year=2069:2069
%     year_str = num2str(year);
%     plotEngland([data_dirname year_str '.csv'], [figure_dirname year_str '.png'], year_str);
% end

function writeData(pos, temp, filename, year_str)

data = zeros(12,30);
for ii=12:-1:1
    data(ii,:) = temp((12-ii)*30+1:(12-ii)*30+30,:).';
end

data(find(data==-999))=NaN;
% imshow(data);

z = data;

z = rot90(z,2);
z = fliplr(z);
% xx = 1:30;
% yy = 1:12;
xx = -19:10;
yy = 52:63;
[x,y] = meshgrid(xx, yy);

fig = figure;
set(fig,'position',[100 100 1200 500]);

subplot(1,2,1);
surf(x,y,z);
title(['SST 3D chart of waters off Scotland, ' year_str]);

subplot(1,2,2);
contourf(x,y,z);
title(['SST isotherm chart of waters off Scotland, ' year_str]);

colorbar('location', 'EastOutside')
set(gca,'CLim',[7,18])

frame = getframe(fig); % ��ȡframe
im = frame2im(frame); % ��frame�任��imwrite��������ʶ��ĸ�ʽ
imwrite(im,['data/temperature/figure/' year_str '.png']); % ���浽����Ŀ¼�£�����Ϊ"a.png"

end

function plotEngland(dataname, figurename, year_str)
fig = figure;
ax = worldmap([52, 63], [340 10]); 
land = shaperead('landareas', 'UseGeoCoords', true); %����½�ؿ��
geoshow(ax, land);

setm(gca,'MLineLocation',1)%���þ��ȼ��Ϊ1
setm(gca,'PLineLocation',1)%���þ��ȼ��Ϊ1
title(['SST chart off Scotland, ' year_str]);

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
set(gca,'CLim',[7,18])

frame = getframe(fig); % ��ȡframe
im = frame2im(frame); % ��frame�任��imwrite��������ʶ��ĸ�ʽ
imwrite(im,figurename); % ���浽����Ŀ¼�£�����Ϊ"a.png"

end