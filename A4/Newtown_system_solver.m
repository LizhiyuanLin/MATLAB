function [x, niter] = Newtown_system_solver(F, x, tol, Jacobian)
    niter = 0;
    syms x1 x2 x3 x4
    x_size = size(x);
    n = x_size(1);
    while norm(F(x)) > tol
        switch n
            case 2
                J = double(subs(Jacobian,[x1,x2],[x(1),x(2)]));
            case 3
                J = double(subs(Jacobian,[x1,x2,x3],[x(1),x(2),x(3)]));
            case 4
                J = double(subs(Jacobian,[x1,x2,x3,x4],[x(1),x(2),x(3),x(4)]));
        end
        s =- J \ F(x);
        x = x + s;
        niter = niter+1;
    end
end