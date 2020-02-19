clear
clc

%===== 温度线性变化

dirname = 'data/MAT/';

global left right bottom top m n
left = 10; right = -20;
bottom = 52; top = 63;
n = top - bottom + 1; m = left - right + 1;

for year=2008:2018
    for month=1:1
        year_str = num2str(year);
        if month>=1 && month<10 
            month_str = ['0' num2str(month)];
        else
            month_str = num2str(month);
        end
        load ([dirname 'BOA_Argo_' year_str '_' month_str '.mat']); % 'BOA_Argo_2017_11.mat'
        oneData.lat = lat;  % 纬度
        oneData.lon = lon;  % 经度
        oneData.mld_composed = mld_composed;    % 合成混合层深度
        oneData.mld_dens = mld_dens;    % 混合层深度
        oneData.mld_t = mld_t;  % 等温层深度
        oneData.pres = pres;    % 压力
        oneData.salt = salt;    % 盐度
        oneData.temp = temp;    % 温度
        clipMap([year_str, '_' month_str], oneData);
%         drawFigure([year_str, '_' month_str]);
    end
end


function clipMap(filename, data)
% 裁剪英国的图像
global left right bottom top m n
dirname = 'data/lat_lon_temp/';

earth = sum(data.temp,3);
earth = data.temp(:,:,1);
earth = rot90(earth);

% figure
% subplot(1,2,1);
% imshow(earth);

map = zeros(n, m);
map(:,1:1-right) = earth(80-top:80-bottom,360+right:360);
map(:,2-right:m) = earth(80-top:80-bottom,1:10);

% subplot(1,2,2);
% imshow(map);
xlswrite([dirname filename '.csv'], map);

end


function drawFigure(filename)
% 根据.csv画图

global left right bottom top m n

dirname = 'data/lat_lon_temp/';
data = csvread([dirname filename '.csv']);

z = data;
xx = 1:m; yy = 1:n;
[x,y] = meshgrid(xx,yy);
figure
subplot(1,2,1);
surf(x,y,z);
% set(gca,'xtick',bottom:top);
% set(gca,'ytick',left:right);
subplot(1,2,2);
contourf(x,y,z);
end