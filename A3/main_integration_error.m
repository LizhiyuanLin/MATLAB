x = 1;
accurate = erf(x);
constant = 2/sqrt(pi);
f = @(t) exp(-t^2);
trapizoid_errors = zeros(1, 10);
midpoint_errors = zeros(1, 10);
simpson_errors = zeros(1, 10);
for i=1:10
    n = 2^i;
    % trapezoid quadrature
    trapizoid_errors(i) = abs(accurate-constant*composite_trapezoid(f, 0, x, n));
    % midpoint quadrature
    midpoint_errors(i) = abs(accurate-constant*composite_midpoint(f, 0, x, n));
    % midpoint quadrature
    [C1, comp_simpson] = composite_simpson(f, 0, x, n);
    simpson_errors(i) = abs(accurate-constant*comp_simpson);
end
loglog(trapizoid_errors)
trapizoid_errors
midpoint_errors
simpson_errors