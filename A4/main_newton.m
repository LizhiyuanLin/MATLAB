fun = @system_a;
x0 = [15,-2];
x = fsolve(fun,x0)
function F = system_a(x)
    F(1) = x(1)+x(2)*(x(2)*(5-x(2))-2)-13;
    F(2) = x(1)+x(2)*(x(2)*(1+x(2))-14)-29;
end
