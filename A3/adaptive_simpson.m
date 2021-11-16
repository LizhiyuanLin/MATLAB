function [C2, simpson_result] = adaptive_simpson(f, a, b, tol)
    h = b-a;
    c = (a+b)/2;
    S1 = h/6*(f(a)+4*f((a+b)/2)+f(b));
    S2 = h/12*(f(a)+4*f((a+c)/2)+2*f(c)+4*f((c+b)/2)+f(b));
    C2 = 8;
    E2 = (S2-S1)/15;
    if abs(E2)<=tol
        simpson_result = S2+E2;
    else
        [C_left, Q1] = adaptive_simpson(f, a, c, tol/2);
        [C_right, Q2] = adaptive_simpson(f, c, b, tol/2);
        C2 = C_left+C_right;
        simpson_result = Q1+Q2;
    end
end