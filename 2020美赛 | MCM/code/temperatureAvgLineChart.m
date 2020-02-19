clear
clc

dirname = 'data/temperature/data/year/';
filename = 'temp_and_diff_prediction.csv';

table = readtable([dirname filename]);
data = table2array(table);
[row, col] = size(data);

pos = data(:,1:2);

point = [54.5 0.5; 61.5 -12.5; 54.5 -12.5; 61.5 0.5];

figure

for ii=1:4
    for index=1:row
        if pos(index,2)==point(ii,1) && pos(index,1)==point(ii,2)
            
            index
            
            temp = data(index,3:col);
            x = 2012:2069;
            plot(x,temp);
            hold on
            
            
            break;
        end
    end
end

title('Mean temperature variation');
xlabel('year');
ylabel('temperature');
legend(['(' num2str(point(1,2)) 'E, ' num2str(point(1,1)) 'N)'], ['(' num2str(point(2,2)) 'E, ' num2str(point(2,1)) 'N)'], ['(' num2str(point(3,2)) 'E, ' num2str(point(3,1)) 'N)'], ['(' num2str(point(4,2)) 'E, ' num2str(point(4,1)) 'N)'])
