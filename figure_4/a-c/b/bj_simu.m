
clear variables
close all
p_x = readtable('beijing_point_x.csv');p_x=p_x{:,:};
p_y = readtable('beijing_point_y.csv');p_y=p_y{:,:};
p_z = readtable('beijing_point_z.csv');p_z=p_z{:,:};




log10_dis = [];
timestamps = [];
log10_num = [];

cut_standard = 9;
dis = 10.^(p_x);
choose_n = cut_standard * 2 + 3;
time_interval = 30;

var = [14.7140;1.0631;0.7885;1.3337];

[real_dist,real_num] = plot_surface(var,choose_n,time_interval,0);

hold on 
plot_range_point(p_x,p_y,p_z,0,0,1);
hold off
