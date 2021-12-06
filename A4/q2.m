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
f = @(x) (x-2)^9;
f_horner = @(x) horner(x);
Bisection(f, a, b, 161, 1e-6)
Bisection(f_horner, a, b, 161, 1e-6)
f_fsolve = fsolve(@(x)(x-2)^9,1.9)
expanded_f_fsolve = fsolve(@(x) x^9-18*x^8+144*x^7-672*x^6+2016*x^5-4032*x^4+5376*x^3-4608*x^2+2304*x-512,1.9)