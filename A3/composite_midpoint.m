function sum = composite_midpoint(f, a, b, n)
    h = (b-a)/n;
    sum = 0;
    for i=1:n
        x = a+(i-0.5)*h;
        sum = sum+f(x);
    end
    sum = sum*h;
end