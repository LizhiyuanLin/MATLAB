function p = newton(x, y, n)
    p = zeros(n+1);
    f = zeros(n+1);
    for i=1:n+1
        f(i,1) = y(i);
    end
    for i=2:n+1
        for j=i:n+1
            f(j,i) = (f(j,i-1)-f(j-1,i-1))/(x(j)-x(j+1-i));
        end
    end
    for i=1:n+1
        p(i) = f(i,i);
    end
end