function Bisection(f, a, b, nmax, epsilon)
    fa = f(a);
    fb = f(b);
    if sign(fa)==sign(fb)
        fprintf("a = %f b = %f fa = %f fb = %f \n",a , b, fa, fb);
        fprintf("function has same signs at a and b \n");
        return;
    end
    error = b-a;
    for n=1:nmax+1
        error = error/2;
        c = a+error;
        fc = f(c);
        fprintf("n = %d c = %f fc = %f error = %f \n",n , c, fc, error);
        if abs(error)<epsilon
            fprintf("convergence \n");
            return;
        end
        if sign(fa)~=sign(fc)
            b = c;
            fb = fc;
        else
            a = c;
            fa = fc;
        end
    end
end