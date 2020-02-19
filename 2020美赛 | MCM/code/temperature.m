clc
clear

dirname = 'data/temperature/data/';
T = readtable([dirname 'resultdata.csv']);
[dummy, total_index] = size(T);

global year month
year=2012;
month=1;

pos = floor(table2array(T(:,2:3)));

for index=4:total_index
    [year_str,month_str] = getTime();
    temp = table2array(T(:,index));
    writeData(pos, temp, [dirname year_str '_' month_str '.csv']);
end


function [year_str,month_str] = getTime()
% º∆À„ ±º‰

global year month

year_str = num2str(year);
if month<10
    month_str = ['0' num2str(month)];
else
    month_str = num2str(month);
end

month = month+1;
if(month>12)
    month = month-12;
    year = year+1;
end
end

function writeData(pos, temp, filename)

data = zeros(12,30);
for ii=12:-1:1
    data(ii,:) = temp((12-ii)*30+1:(12-ii)*30+30,:).';
end

data(find(data==-999))=NaN;
% imshow(data);

z = data;

z = rot90(z,2);
z = fliplr(z);
xx = 1:30;
yy = 1:12;
[x,y] = meshgrid(xx, yy);

% figure
% subplot(1,2,1);
% surf(x,y,z);
% subplot(1,2,2);
% contourf(x,y,z);

xlswrite(filename , z);
end