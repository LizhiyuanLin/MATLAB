b = 0.3;
a = 0;
n = 3;
x = linspace(a,b,n+1);
y = [1.0000 1.0488 1.0954 1.1402];
p = polyfit(x, y, n);
x1 = 0.05; x2 = 0.15;
f = @(x) sqrt(x+1);
y1 = polyval(p,x1)
y2 = polyval(p,x2)
error_x1 = abs(f(x1)-y1);
error_x2 = abs(f(x2)-y2)
h  = (b-a)/n;
error_bound =  f(0.3)*1/(4*(n+1))*h^(n+1)