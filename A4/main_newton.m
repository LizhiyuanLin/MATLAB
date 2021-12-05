tol = 1e-6;
%function a
fun = @system_a;
xa = [15;-2];
[xa_fsolve,~,~,output_a] = fsolve(fun,xa);
%my implementation
Jacobian_a = jacobian([x1+x2*(x2*(5-x2)-2)-13,x1+x2*(x2*(1+x2)-14)-29],[x1,x2]);
[xa_my, xa_niter] = Newtown_system_solver(fun, xa, tol, Jacobian_a);
fprintf('system a) fsolve result: [%d, %d]\n',xa_fsolve);
fprintf('system a) my implementation result: [%d, %d]\n',xa_my);
fprintf('system a) fsolve num of iterations: %d\n',output_a.iterations);
fprintf('system a) my implementation result: %d\n',xa_niter);
%function b
fun = @system_b;
xb = [(1+sqrt(3))/2;(1-sqrt(3))/2;sqrt(3)];
[xb_fsolve,~,~,output_b] = fsolve(fun,xb);
%my implementation
Jacobian_b = jacobian([x1^2+x2^2+x3^2-5,x1+x2-1,x1+x3-3],[x1,x2,x3]);
[xb_my, xb_niter] = Newtown_system_solver(fun, xb, tol, Jacobian_b);
fprintf('system b) fsolve result: [%d, %d, %d]\n',xb_fsolve);
fprintf('system b) my implementation result: [%d, %d, %d]\n',xb_my);
fprintf('system b) fsolve num of iterations: %d\n',output_b.iterations);
fprintf('system b) my implementation result: %d\n',xb_niter);
%function c
fun = @system_c;
xc = [1;2;1;1];
[xc_fsolve,~,~,output_c] = fsolve(fun,xc);
%my implementation
Jacobian_c = jacobian([x1+10*x2,sqrt(5)*(x3-x4),(x2-x3)^2,sqrt(10)*(x1-x4)],[x1,x2,x3,x4]);
[xc_my, xc_niter] = Newtown_system_solver(fun, xc, tol, Jacobian_c);
fprintf('system c) fsolve result: [%d, %d, %d, %d]\n',xc_fsolve);
fprintf('system c) my implementation result: [%d, %d, %d, %d]\n',xc_my);
fprintf('system c) fsolve num of iterations: %d\n',output_c.iterations);
fprintf('system c) my implementation result: %d\n',xc_niter);
%function d
fun = @system_d;
xd = [0;0];
[xd_fsolve,~,~,output_d] = fsolve(fun,xd);
%my implementation
Jacobian_d = jacobian([1e4*x1*x2-1,exp(-x1)+exp(-x2)-1.0001],[x1,x2]);
[xd_my, xd_niter] = Newtown_system_solver(fun, xd, tol, Jacobian_d);
fprintf('system d) fsolve result: [%d, %d]\n',xd_fsolve);
fprintf('system d) my implementation result: [%d, %d]\n',xd_my);
fprintf('system d) fsolve num of iterations: %d\n',output_d.iterations);
fprintf('system d) my implementation result: %d\n',xd_niter);

function F = system_a(x)
    F(1,:) = x(1)+x(2)*(x(2)*(5-x(2))-2)-13;
    F(2,:) = x(1)+x(2)*(x(2)*(1+x(2))-14)-29;
end

function F = system_b(x)
    F(1,:) = x(1)^2+x(2)^2+x(3)^2-5;
    F(2,:) = x(1)+x(2)-1;
    F(3,:) = x(1)+x(3)-3;
end

function F = system_c(x)
    F(1,:) = x(1)+10*x(2);
    F(2,:) = sqrt(5)*(x(3)-x(4));
    F(3,:) = (x(2)-x(3))^2;
    F(4,:) = sqrt(10)*(x(1)-x(4));
end

function F = system_d(x)
    F(1,:) = 1e4*x(1)*x(2)-1;
    F(2,:) = exp(-x(1))+exp(-x(2))-1.0001;
end
