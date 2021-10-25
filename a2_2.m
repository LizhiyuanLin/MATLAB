epsilon = [2 0.5*sqrt(eps) sqrt(eps) 1.5*sqrt(eps)];
fprintf("ε \t |x1 − 1| \t |x2 − ε|/ε \t cond(A)\n");
for e = epsilon
    A = [1 1 + e; 1 - e 1];
    B = [1 + (1 + e) * e; 1];
    X = A\B;
    fprintf("%i \t %i \t %i \t %i\n", e, abs(X(1) - 1), abs((X(2) - e) / e), cond(A));
end