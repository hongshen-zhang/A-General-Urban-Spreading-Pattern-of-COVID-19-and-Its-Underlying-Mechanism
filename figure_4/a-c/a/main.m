clear variables
close all
p_x = readtable('wuhan_point_x.csv');p_x=p_x{:,:};
p_y = readtable('wuhan_point_y.csv');p_y=p_y{:,:};
p_z = readtable('wuhan_point_z.csv');p_z=p_z{:,:};

normal_dis = [];
timestamps = [];
normal_num = [];

cut_standard = 80;
dis = 10.^(p_x);
choose_n = cut_standard * 2 + 3;
time_interval = 40;

count = 0;
for i = 1 : length(p_x)
    if dis(i) < cut_standard
        count = count + 1;
        normal_dis(count) = p_x(i);
        timestamps(count) = p_y(i);
        normal_num(count) = p_z(i);
    end
end


lb = [0.1,0.001];
ub = [10,1];
var = lsqcurvefit(@(var,data) new_funode(var,data,choose_n,time_interval),[0.9883;0.5040],[normal_dis;timestamps],normal_num,lb,ub)


log10_dis = [];
timestamps = [];
log10_num = [];

dis = 10.^(p_x);
choose_n = cut_standard * 2 + 3;
time_interval = 40;

[real_dist,real_num] = plot_surface(var,choose_n,time_interval,0);

hold on 
plot_range_point(p_x,p_y,p_z,0,0,1);
hold off

