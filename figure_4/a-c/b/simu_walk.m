function dy = simu_walk(t,y,n,lambda,I_0)
dy=zeros(n*n,1);
I_zero = zeros(n*n,1);
zygl = swzygl_plus_move(n);
center_posi = round((n*n+1)/2);
I_zero(center_posi) = I_0;
for i = 1 : n
    for j = 1 : n
        step_sum_value = 0; 
        for k = 1 : n
            for l = 1 : n
                temp_index = k + (l - 1) * n;
                step_sum_value = step_sum_value + y(temp_index) * zygl(k,l,i,j);
            end
        end
        posi_end_index = i + (j - 1) * n;
        dy(posi_end_index) = lambda * (I_zero(posi_end_index) - y(posi_end_index) + 1 - exp(-step_sum_value/lambda));
    end
end


