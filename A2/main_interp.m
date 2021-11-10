n = 20;
a = -1; b = 1;
x = linspace(a,b,n+1);
y = abs(x);
p = newton(x, y, n);
t = linspace(a,b,41);
f = @(x) abs(x);
horner_result = zeros(41,1);
for i=1:41
    horner_result(i) = hornerN(x, p, n, t(i));
end
plot(t, horner_result, t, f(t));
legend('p(x)','f(x)')