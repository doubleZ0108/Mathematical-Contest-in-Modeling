clear
clc

dirname = 'data/temperature/data/year/yearly/';

filename = '2012.csv';
data = csvread([dirname filename]);
[row,col] = size(data);

for ii=1:8
    randrow = randi(row);
    Dummy = data(randrow, 1:2);
    lon = Dummy(1); lat = Dummy(2);

    y = data(randrow, 3:14);
    y(find(y==-999)) = NaN;
    [dummy, num] = size(y);
    x = 1:num;

    plot(x,y);
    hold on
    text(x(ii), y(ii), ['(' num2str(lon) 'E, ' num2str(lat) 'N' ')']);
%     legend(['(' num2str(lon) 'E, ' num2str(lat) 'N' ')']);
end