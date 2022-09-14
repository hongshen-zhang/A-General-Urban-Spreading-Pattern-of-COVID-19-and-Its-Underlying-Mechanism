%plot_range_point函数说明
%dis_range表示筛选的点绝对值距离，其中0表示所有点
%day_range表示筛选的点的日期，其中0表示所有点，正常新疆为20天，北京为30天，武汉为40天
%type表示画图的类型，其中0表示正常坐标轴，1表示对数坐标轴

function plot_range_point(p_x,p_y,p_z,dis_range,day_range,type)

dis = [];
timestamps = [];
num = [];

if dis_range == 0
    dis_range = 999;
end

if day_range == 0
    day_range = 40;
end

dist = 10.^(p_x);
count = 0;

for i = 1 : length(p_x)
    if (dist(i) < dis_range) && (p_y(i) <= day_range)
        count = count + 1;
        timestamps(count) = p_y(i);
        if type == 0 
            dis(count) = 10.^(p_x(i));
            num(count) = 10.^(p_z(i));
        else 
            dis(count) = p_x(i);
            num(count) = p_z(i);
        end
    end
end

num = num;

P=scatter3(dis,timestamps,num,'o');

P.MarkerEdgeColor= [1 1 1];
P.LineWidth =0.8;
P.MarkerFaceColor= [0.2549 0.4118 0.8824];
P.SizeData = 80;

end