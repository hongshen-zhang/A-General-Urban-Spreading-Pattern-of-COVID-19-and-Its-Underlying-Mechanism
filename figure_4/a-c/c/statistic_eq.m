function [eq_dist,eq_num] = statistic_eq(t,y,timestamp,n)
range = floor((n-3)/2);

count = zeros(range,1);
eq_dist = zeros(range,1);
eq_num = zeros(range,1);
center = (n+1) / 2;


for i = 1 : n
    for j = 1 : n 
        temp_index = i + (j - 1) * n;
        dist = ((i-center)^2 + (j-center)^2)^(0.5);
        if (dist >=1) && (dist<center-1)
            d = floor(dist);
            count(d) = count(d) + 1;
            eq_dist(d) = eq_dist(d) + dist;
            eq_num(d) = eq_num(d) + y(timestamp+1,temp_index);
        end
    end
end

for i = 1 : range
    eq_dist(i) = eq_dist(i) / count(i);
    eq_num(i) = eq_num(i) / count(i);
end

end



