clear
clc

dirname = 'data/temperature/data/month/monthly/';

filename = '1.csv';
data = csvread([dirname filename]);
[row,col] = size(data);

for ii=1:10
    randrow = randi(row);
    Dummy = data(randrow, 1:2);
    lon = Dummy(1); lat = Dummy(2);

    y = data(randrow, 3:10);
    y(find(y==-999)) = NaN;
    [dummy, num] = size(y);
    x = 2012:2012+num-1;

    plot(x,y);
    hold on
    text(x(ii), y(ii), ['(' num2str(lon) 'E, ' num2str(lat) 'N' ')']);
%     legend(['(' num2str(lon) 'E, ' num2str(lat) 'N' ')']);
end