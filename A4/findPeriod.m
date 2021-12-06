function T = findPeriod(t, x, y, z)
    vector0 = [x(1) y(1) z(1)];
    x_size = size(x);
    n = x_size(1);
    tol = 0.028;
    
    for i=100:n
        if abs(norm([x(i) y(i) z(i)]-vector0))<tol && sign(x(i))==sign(x(1)) && sign(y(i))==sign(y(1)) && sign(z(i))==sign(z(1))
                T = t(i)*100/365;
            return;
        end
    end
    T = -1;
end