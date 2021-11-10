function eval = hornerN(x, a, n, t)
    temp = a(n+1);
    for i=n:-1:1
        temp = temp*(t-x(i))+a(i);
    end
    eval = temp;
end