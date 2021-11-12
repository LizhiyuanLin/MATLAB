f = @(x) sin(x);
a = 0;
b = 1;
n = 120000;
tol = 1e-6;
% quad
accurate = quad(f,a,b, 1e-2*tol);
% composite simpson
[C1, comp_simpson] = composite_simpson(f, a, b, n);
comp_simpson_error = abs(comp_simpson-accurate)
C1
% adaptive simpson
h = (b-a)/n;
[C2, adp_simpson] = adaptive_simpson(f, a, b, tol, 0, n);
adp_simpson_error = abs(adp_simpson-accurate)
C2
fplot(f);
legend('f(x)');