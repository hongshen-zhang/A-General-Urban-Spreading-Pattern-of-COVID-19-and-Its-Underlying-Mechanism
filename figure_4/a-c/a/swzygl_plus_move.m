function [zygl] =  swzygl_plus_move(n)

delta = 0.4;
beta = -2.6;
kappa = 100;

zygl = zeros(n,n,n,n);
for i = 1 : n 
    for j = 1 : n
        sum = 0;
        for k = 1 : n
            for l = 1 : n
                dis_temp = ((i - k)^2 + (j - l)^2)^(0.5);
                new_dis = dis_temp + delta;
                zygl(i,j,k,l) = (new_dis)^(beta)*exp(-(dis_temp)/kappa);
                sum = sum + zygl(i,j,k,l);
           end
        end
        for k = 1 : n
            for l = 1 : n 
                zygl(i,j,k,l) = zygl(i,j,k,l)/sum;
            end
        end
    end
end

end