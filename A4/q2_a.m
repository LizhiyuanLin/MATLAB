a = 1.92;
b = 2.08;
n = 161;
h = (b-a)/n;
direct_result = zeros(1,n);
horner_result = zeros(1,n);
x = zeros(n,1);
for i=1:n
    x(i) = a+(i-1)*h;
    direct_result(i) = (x(i)-2)^9;
    horner_result(i) = horner(x(i));
end
plot(x,horner_result);
legend('horner');
f_horner = @(x) horner(x);
Bisection(f_horner, a, b, 1e-6)