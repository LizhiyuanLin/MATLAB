syms x1 x2 x3 x4
%function a
fun = @system_a;
x0 = [15;-2];
[xa_fsolve,~,~,output_a] = fsolve(fun,x0);
%my implementation
Jacobian_a = jacobian([x1+x2*(x2*(5-x2)-2)-13,x1+x2*(x2*(1+x2)-14)-29],[x1,x2]);
i = 0;
while true
    i = i+1;
    J = simplify(subs(Jacobian_a,[x1,x2],[x0(1),x0(2)]));
    F = system_a(x0).';
    s = J\F;
    x0 = double(x0-s);
    if norm(system_a(x0))<=1e-6
        break;
    end
end
fprintf('system a) fsolve result: [%d, %d]\n',xa_fsolve);
fprintf('system a) my implementation result: [%d, %d]\n',x0);
fprintf('system a) fsolve num of iterations: %d\n',output_a.iterations);
fprintf('system a) my implementation result: %d\n',i);
%function b
fun = @system_b;
x0 = [(1+sqrt(3))/2;(1-sqrt(3))/2;sqrt(3)];
[xb_fsolve,~,~,output_b] = fsolve(fun,x0);
%my implementation
Jacobian_b = jacobian([x1^2+x2^2+x3^2-5,x1+x2-1,x1+x3-3],[x1,x2,x3]);
i = 0;
while true
    i = i+1;
    J = subs(Jacobian_b,[x1,x2,x3],[x0(1),x0(2),x0(3)]);
    F = system_b(x0).';
    s = J\F;
    x0 = double(x0-s);
    if norm(system_b(x0))<=1e-6
        break;
    end
end
fprintf('system b) fsolve result: [%d, %d, %d]\n',xb_fsolve);
fprintf('system b) my implementation result: [%d, %d, %d]\n',x0);
fprintf('system b) fsolve num of iterations: %d\n',output_b.iterations);
fprintf('system b) my implementation result: %d\n',i);
%function c
fun = @system_c;
x0 = [1;2;1;1];
[xc_fsolve,~,~,output_c] = fsolve(fun,x0);
%my implementation
Jacobian_c = jacobian([x1+10*x2,sqrt(5)*(x3-x4),(x2-x3)^2,sqrt(10)*(x1-x4)],[x1,x2,x3,x4]);
i = 0;
while true
    i = i+1;
    J = subs(Jacobian_c,[x1,x2,x3,x4],[x0(1),x0(2),x0(3),x0(4)]);
    F = system_c(x0).';
    s = J\F;
    x0 = double(x0-s);
    if norm(system_c(x0))<=1e-6
        break;
    end
end
fprintf('system c) fsolve result: [%d, %d, %d, %d]\n',xc_fsolve);
fprintf('system c) my implementation result: [%d, %d, %d, %d]\n',x0);
fprintf('system c) fsolve num of iterations: %d\n',output_c.iterations);
fprintf('system c) my implementation result: %d\n',i);
%function d
fun = @system_d;
x0 = [0;0];
[xd_fsolve,~,~,output_d] = fsolve(fun,x0);
%my implementation
Jacobian_d = jacobian([1e4*x1*x2-1,exp(-x1)+exp(-x2)-1.0001],[x1,x2]);
i = 0;
while i<10
    i = i+1;
    J = subs(Jacobian_d,[x1,x2],[x0(1),x0(2)]);
    F = system_d(x0).';
    s = J\F;
    x0 = double(x0-s);
    if norm(system_d(x0))<=1e-6
        break;
    end
end
fprintf('system d) fsolve result: [%d, %d]\n',xd_fsolve);
fprintf('system d) my implementation result: [%d, %d]\n',x0);
fprintf('system d) fsolve num of iterations: %d\n',output_d.iterations);
fprintf('system d) my implementation result: %d\n',i);

function F = system_a(x)
    F(1) = x(1)+x(2)*(x(2)*(5-x(2))-2)-13;
    F(2) = x(1)+x(2)*(x(2)*(1+x(2))-14)-29;
end

function F = system_b(x)
    F(1) = x(1)^2+x(2)^2+x(3)^2-5;
    F(2) = x(1)+x(2)-1;
    F(3) = x(1)+x(3)-3;
end

function F = system_c(x)
    F(1) = x(1)+10*x(2);
    F(2) = sqrt(5)*(x(3)-x(4));
    F(3) = (x(2)-x(3))^2;
    F(4) = sqrt(10)*(x(1)-x(4));
end

function F = system_d(x)
    F(1) = 1e4*x(1)*x(2)-1;
    F(2) = exp(-x(1))+exp(-x(2))-1.0001;
end
