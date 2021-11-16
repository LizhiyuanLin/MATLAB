n = 10000;

decrease_sum = 0.0;
for i = 1:n
    decrease_sum = decrease_sum + 1/i;
end

increase_sum = 0.0;
for i = n:-1:1
    increase_sum = increase_sum + 1/i;
end

kahan_summation_sum = 0.0;
c = 0.0;
for i = 1:n
    y = 1/i - c;
    t = kahan_summation_sum + y;
    c = (t - kahan_summation_sum) - y;
    kahan_summation_sum = t;
end

accurate_sum = 0.0;
c = 0.0;
for i = 1:n
    y = vpa(1/i) - c;
    t = accurate_sum + y;
    c = (t - accurate_sum) - y;
    accurate_sum = (t);
end

fprintf("decreasing order error %i \n", double(abs(decrease_sum - accurate_sum)));
fprintf("increasing order error %i \n", double(abs(increase_sum-accurate_sum)));
fprintf("Kahan's sum error %i \n", double(abs(kahan_summation_sum-accurate_sum)));