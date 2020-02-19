clear
clc

dirname = 'data/temperature/data/month/';
T = readtable([dirname 'resultdata.csv']);
[row, total_index] = size(T);


global year month
year=2012;
month=1;

pos = floor(table2array(T(:,2:3)));

monthlyData = zeros(row, 2+8, 12);

for ii=1:12
    monthlyData(:,1:2,ii) = pos;
end

for index=4:total_index
    temp = table2array(T(:,index));
    monthlyData(:,year-2012+2+1,month) = temp;
    [year_str,month_str] = getTime();
end

for ii=1:12
    xlswrite([dirname '/monthly/' num2str(ii) '.xls'], monthlyData(:,:,ii),  num2str(ii));
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
