clear
clc

dirname = 'data/temperature/data/month/monthly/';

randrow = randi(360);
% 254 153 276
% randrow = 153;

fig = figure;
set(fig,'position',[100 100 1200 500]);

subplot(1,3,1)
for month=12:12
    filename = [num2str(month) '.csv'];
    data = csvread([dirname filename]);
    
    Dummy = data(randrow, 1:2);
    lon = Dummy(1); lat = Dummy(2);
    
    y = data(randrow, 3:10);
    y(find(y==-999)) = NaN;
    
    [dummy, num] = size(y);
    x = 2012:2012+num-1;
    
    plot(x,y);
    hold on
%     text(x(month), y(month), [num2str(month) '月']);
    r = randi(8);
    text(x(r), y(r), [num2str(month) '月']);
end
for month=1:5
    filename = [num2str(month) '.csv'];
    data = csvread([dirname filename]);
    
    Dummy = data(randrow, 1:2);
    lon = Dummy(1); lat = Dummy(2);
    
    y = data(randrow, 3:10);
    y(find(y==-999)) = NaN;
    
    [dummy, num] = size(y);
    x = 2012:2012+num-1;
    
    plot(x,y);
    hold on
%     text(x(month), y(month), [num2str(month) '月']);
    r = randi(8);
    text(x(r), y(r), [num2str(month) '月']);
end


subplot(1,3,2)
for month=6:9
    filename = [num2str(month) '.csv'];
    data = csvread([dirname filename]);
    
    Dummy = data(randrow, 1:2);
    lon = Dummy(1); lat = Dummy(2);
    
    y = data(randrow, 3:10);
    y(find(y==-999)) = NaN;
    
    [dummy, num] = size(y);
    x = 2012:2012+num-1;
    
    plot(x,y);
    hold on
%     text(x(month), y(month), [num2str(month) '月']);
    r = randi(8);
    text(x(r), y(r), [num2str(month) '月']);
end

subplot(1,3,3)
for month=10:11
    filename = [num2str(month) '.csv'];
    data = csvread([dirname filename]);
    
    Dummy = data(randrow, 1:2);
    lon = Dummy(1); lat = Dummy(2);
    
    y = data(randrow, 3:10);
    y(find(y==-999)) = NaN;
    
    [dummy, num] = size(y);
    x = 2012:2012+num-1;
    
    plot(x,y);
    hold on
%     text(x(month), y(month), [num2str(month) '月']);
    r = randi(8);
    text(x(r), y(r), [num2str(month) '月']);
end


