n = 20;
a = -pi; b = pi;
x = linspace(a,b,n+1);
y = sin(x);
p = polyfit(x, y, n);
xx = linspace(a,b,41);
f = @(x) sin(x);
error = abs(f(xx)- polyval(p,xx));
plot(xx, polyval(p,xx), xx, f(xx));
legend('p(x)','f(x)')