x = 1;
accurate = erf(x);
constant = 2/sqrt(pi);
h = [1/2^1 1/2^2 1/2^3 1/2^4 1/2^5 1/2^6 1/2^7 1/2^8 1/2^9 1/2^10];
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
loglog(h, trapizoid_errors, h, midpoint_errors, h, simpson_errors);
% construct A and b for trapezoid
A_trapezoid = zeros(10, 2);
b_trapezoid = zeros(10, 1);
for i=1:10
    A_trapezoid(i, 1) = 1;
    A_trapezoid(i, 2) = log(h(i));
    b_trapezoid(i) = log(trapizoid_errors(i));
end
y_trapezoid = A_trapezoid\b_trapezoid;
fprintf('trapezoid %.2e*h^%.2f\n', exp(y_trapezoid(1)), y_trapezoid(2));
% construct A and b for midpoint
A_midpoint = zeros(10, 2);
b_midpoint = zeros(10, 1);
for i=1:10
    A_midpoint(i, 1) = 1;
    A_midpoint(i, 2) = log(h(i));
    b_midpoint(i) = log(midpoint_errors(i));
end
y_midpoint = A_midpoint\b_midpoint;
fprintf('midpoint %.2e*h^%.2f\n', exp(y_midpoint(1)), y_midpoint(2));
% construct A and b for simpson
A_simpson = zeros(10, 2);
b_simpson = zeros(10, 1);
for i=1:10
    A_simpson(i, 1) = 1;
    A_simpson(i, 2) = log(h(i));
    b_simpson(i) = log(simpson_errors(i));
end
y_simpson = A_simpson\b_simpson;
fprintf('simpson %.2e*h^%.2f\n', exp(y_simpson(1)), y_simpson(2));