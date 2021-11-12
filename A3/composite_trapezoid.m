function sum = composite_trapezoid(f, a, b, n)
    h = (b-a)/n;
    sum = 0.5*(f(a)+f(b));
    for i=1:n-1
        x = a+i*h;
        sum = sum+f(x);
    end
    sum = sum*h;
end