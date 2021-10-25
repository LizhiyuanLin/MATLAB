n = 20;
a = -pi; b = pi;
x = general_cheby(n, a, b);
y = sin(x);
p = polyfit(x, y, n);
xx = linspace(a,b,41);
f = @(x) sin(x);
error = abs(f(xx)- polyval(p,xx));
plot(xx, error);