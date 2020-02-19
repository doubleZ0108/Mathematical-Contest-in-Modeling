clear
clc

dirname = 'data/temperature/data/month/';
T = readtable([dirname 'resultdata.csv']);
[row, total_index] = size(T);

global year month
year=2012;
month=1;

pos = floor(table2array(T(:,2:3)));

yearlyData = zeros(row, 2+12, 8);

for ii=1:8
    yearlyData(:,1:2, ii) = pos;
end

for index=4:total_index
    temp = table2array(T(:,index));
    yearlyData(:,month+2,year-2012+1) = temp;
    [year_str,month_str] = getTime();
end

for ii=1:8
    xlswrite(['data/temperature/data/year/yearly/' num2str(ii+2011) '.csv'], yearlyData(:,:,ii));
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
