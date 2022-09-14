%plot_range_point����˵��
%dis_range��ʾɸѡ�ĵ����ֵ���룬����0��ʾ���е�
%day_range��ʾɸѡ�ĵ�����ڣ�����0��ʾ���е㣬�����½�Ϊ20�죬����Ϊ30�죬�人Ϊ40��
%type��ʾ��ͼ�����ͣ�����0��ʾ���������ᣬ1��ʾ����������

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