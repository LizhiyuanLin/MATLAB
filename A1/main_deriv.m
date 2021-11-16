g1_errors = zeros(1, 16);
g2_errors = zeros(1, 16);
H = zeros(1, 16);
syms x
f = x * exp(x);
f_prime = diff(f);
fx0_prime = vpa(subs(f_prime,x,1));
for k = 1:16
    h = 10^-k;
    H(k) = h;
    g1_errors(k) = abs(fx0_prime - ((1 + h) * exp(1 + h) - 1 * exp(1)) / h);
    g2_errors(k) = abs(fx0_prime - ((1 + h) * exp(1 + h) - (1 - h) * exp(1 - h)) / 2 / h);
end
loglog(H, g1_errors, H, g2_errors)
legend('g1 errors','g2 errors')