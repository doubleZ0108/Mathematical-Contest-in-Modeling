% 划定区域，计算起始年份和结束年份鱼的总量
clear
clc

ax = worldmap([52, 63], [340 10]);   %选择区域为‘世界’
land = shaperead('landareas', 'UseGeoCoords', true); %导入陆地框架
geoshow(ax, land);


%% 圆模型
lon = -4;       % x轴
lat = 57.2;     % y轴
aplha=0:pi/40:2*pi;
r_min=1.8;
x=lon + r_min*cos(aplha);
y=lat + r_min*sin(aplha);
plotm(y,x,'-');

r_max=3.8;
x=lon + r_max*cos(aplha);
y=lat + r_max*sin(aplha);
plotm(y,x,'-');


%% 多边形模型
% poses = [58.57 -3.14;58.49 -4.96; 55.74 -5.91;56.24 -2.68; 57.74 -1.82; 57.75 -4.06; 58.57 -3.14];
% [row, dummy] = size(poses);
% for ii=1:row-1
%     lats = [poses(ii,1),poses(ii+1,1)];
%     lons = [poses(ii,2),poses(ii+1,2)];
%     linem(lats, lons);
% end


%% 求解范围内的鱼数量
dirname = 'data/Habitat/';
filename = 'fishdistribution.xlsx';
data = xlsread([dirname filename]);
pos = data(:,1:2);

startYear = 2019;
endYear = 2050;

start_index = startYear - 2019+3;
end_index = endYear-2019+3;

fishStart = data(:,start_index);
fishEnd = data(:,end_index);

fish = [pos fishStart fishEnd];
fish(find(fish==0)) = NaN;
bufData = fish(:,3:4);
bufData(find(bufData<0.1)) = NaN;
fish(:,3:4) = bufData;

[row, dummy] = size(fish);
totalStart = 0;
totalEnd = 0;
for ii=1:row
    x = fish(ii,1);
    y = fish(ii,2);
    numStart = fish(ii,3);
    numEnd = fish(ii,4);
    r = (x-lon)^2 + (y-lat)^2;
    if r>r_min^2 && r<r_max^2
        if ~isnan(numStart)
            totalStart = totalStart + numStart;
        end
        if ~isnan(numEnd)
            totalEnd = totalEnd + numEnd;
        end
    end
end

totalStart
totalEnd
