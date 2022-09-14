function [tt,yy] = plot_surface(var,choose_n,time_interval,type)

n = choose_n;
sigma = var(1);
lambda = var(2);
k = var(3);
I_0 = var(4);

[t,y]=ode45(@(t,y)simu_walk(t,y,n,lambda,I_0),[0:k:time_interval*k],zeros(1,n*n));

dist = [];
period = [];
num = [];
r_dist = [];
r_num = [];

count = 0;

for tim = 1 : time_interval
    [eq_dist,eq_num] = statistic_eq(t,y,tim,n);
    for j = 1 : length(eq_dist)
        count = count + 1;
        period(tim,j) = tim;
        log10_dist = log10(eq_dist(j));
        log10_num = log10(eq_num(j));
        r_dist(tim,j) = 10.^log10_dist;
        r_num(tim,j) = (10.^log10_num)*sigma;
        if type == 0
            dist(tim,j) = 10.^log10_dist;
            num(tim,j) = 10.^log10_num;
        else
            dist(tim,j) = log10_dist;
            num(tim,j) = log10_num;             
        end
    end
end
num = num * sigma;

S = surf(log10(dist),period,log10(num),'facecolor','flat');

colormap('parula')
alpha 0.7
box on
set(gca,'linewidth',4.5)
tt = r_dist;
yy = r_num;
end