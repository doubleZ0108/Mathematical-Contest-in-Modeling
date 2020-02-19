clc
clear

dirname = 'data/Habitat/';
filename = 'HabitatFitnessFactor.xlsx';

global minRange maxRange
minRange = 1;
maxRange = 50;

data = xlsread([dirname filename], '_2018');

% habitatTable = readtable([dirname filename]);
data(find(data==0)) = NaN;
habitatTable = array2table(data);

fig = figure;
set(fig,'position',[100 100 1200 500]);

subplot(1,2,1);
hMap = geobubble(habitatTable, 'data2', 'data1', ...
    'SizeVariable','data4', ...
    'Basemap','colorterrain');
hMap.BubbleWidthRange = [minRange,maxRange];
title('H_rate');


subplot(1,2,2);
mMap = geobubble(habitatTable, 'data2', 'data1', ...
    'SizeVariable','data5', ...
    'Basemap','colorterrain');
mMap.BubbleWidthRange = [minRange,maxRange];
title('M_rate');


%% 表示另一个维度
% tempZone = discretize(table.M_rate,[-inf,1e-6,1e-5,inf],'categorical',{'cold','normal','hot'});
% % 更新table
% table.zone = tempZone;
% 
% % 更新map
% map.SourceTable = table;
% map.ColorVariable = 'zone';