% ����H��M�������ƶ�steps��2019���2069��ȦȦ�ֲ�ͼ

clc
clear

dirname = 'data/Habitat/';
filename = 'M move 1 step';

data = xlsread([dirname filename '.xlsx']);

data(find(data==0)) = NaN;
%=== ��С��0.1�������޳� =======
bufData = data(:,3:4);
bufData(find(bufData<0.1)) = NaN;
data(:,3:4) = bufData;
%============================

%=== ��������� =======
min_2019 = min(data(:,3));
max_2019 = max(data(:,3));
min_2069 = min(data(:,4));
max_2069 = max(data(:,4));
%====================

habitatTable = array2table(data);



%% ��ͼ
fig = figure;
set(fig,'position',[100 100 1200 500]);

%=== 2019 figure =======
minRange = 1;
maxRange = 50;

subplot(1,2,1);
hMap = geobubble(habitatTable, 'data2', 'data1', ...
    'SizeVariable','data3');
hMap.BubbleWidthRange = [minRange,maxRange];
title([filename ', 2019']);

%=== 2069 figure =======
if min_2069>min_2019
    minRange = minRange + min_2069 - min_2019;
elseif min_2069<min_2019
    minRange = minRange - (min_2019-min_2069);
end
if minRange<1
    minRange = 1;
end

if max_2069<max_2019
    maxRange = maxRange-(max_2019-max_2069);
elseif max_2069>max_2019
    maxRange = maxRange+max_2069-max_2019;
end
if maxRange>100
    maxRange = 100;
end

subplot(1,2,2);
mMap = geobubble(habitatTable, 'data2', 'data1', ...
    'SizeVariable','data4');
mMap.BubbleWidthRange = [minRange,maxRange];
title([filename ', 2069']);

frame = getframe(fig); % ��ȡframe
im = frame2im(frame); % ��frame�任��imwrite��������ʶ��ĸ�ʽ
imwrite(im,[dirname filename '.png']); % ���浽����Ŀ¼��