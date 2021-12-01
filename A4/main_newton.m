syms x1 x2 x3 x4
%function a
fun = @system_a;
x0 = [15;-2];
[xa_fsolve,~,~,output_a] = fsolve(fun,x0);
%my implementation
Jacobian_a = jacobian([x1+x2*(x2*(5-x2)-2)-13,x1+x2*(x2*(1+x2)-14)-29],[x1,x2]);
while true
    J = simplify(subs(Jacobian_a,[x1,x2],[x0(1),x0(2)]));
    F = system_a(x0).';
    s = J\F;
    x0 = vpa(x0-s);
    if norm(x0)<=1e-6
        break;
    end
end
xa_fsolve
x0
output_a.iterations

%function b
fun = @system_b;
x0 = [(1+sqrt(3))/2;(1-sqrt(3))/2;sqrt(3)];
[xb_fsolve,~,~,output_b] = fsolve(fun,x0);
%my implementation
Jacobian_b = jacobian([x1^2+x2^2+x3^2-5,x1+x2-1,x1+x3-3],[x1,x2,x3]);
while true
    J = subs(Jacobian_b,[x1,x2,x3],[x0(1),x0(2),x0(3)]);
    F = system_b(x0).';
    s = J\F;
    x0 = vpa(x0-s);
    if norm(x0)<=1e-6
        break;
    end
end
xb_fsolve
x0
output_b.iterations

%function c
fun = @system_c;
x0 = [1;2;1;1];
[xc_fsolve,~,~,output_c] = fsolve(fun,x0);
xc_fsolve
output_c.iterations
%function d
fun = @system_d;
x0 = [0;0];
[xd_fsolve,~,~,output_d] = fsolve(fun,x0);
xd_fsolve
output_d.iterations

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
    F(3) = sqrt(10)*(x(1)-x(4));
end

function F = system_d(x)
    F(1) = 1e4*x(1)*x(2)-1;
    F(2) = exp(-x(1))+exp(-x(2))-1.0001;
end

