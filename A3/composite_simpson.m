function [C1, composite_simpson] = composite_simpson(f, a, b, n)
    h = (b-a)/n;
    C1 = 0;
    f_t2i = 0;
    f_t2i_minus_1 = 0;
    for i=1:n/2-1
        t2i = a+2*i*h;
        f_t2i = f_t2i+f(t2i);
        C1 = C1+1;
    end
    for i=1:n/2
        t2i_minus_1 = a+(2*i-1)*h;
        f_t2i_minus_1 = f_t2i_minus_1+f(t2i_minus_1);
        C1 = C1+1;
    end
    C1 = C1+2;
    composite_simpson = h/3*(f(a)+f(b)+2*f_t2i+4*f_t2i_minus_1);
end