n = 20;
a = -1; b = 1;
x = cheby(n);
y = abs(x);
p = polyfit(x, y, n);
xx = linspace(a,b,41);
f = @(x) abs(x);
error = abs(f(xx)- polyval(p,xx));
plot(xx, error);