T = readtable('nbody.dat');
Jupiter_x = table2array(T(:,2));
Jupiter_y = table2array(T(:,3));
Jupiter_A = zeros(height(T), 5);
Jupiter_b = zeros(height(T), 1);
Saturn_x = table2array(T(:,5));
Saturn_y = table2array(T(:,6));
Saturn_A = zeros(height(T), 5);
Saturn_b = zeros(height(T), 1);
Uranus_x = table2array(T(:,8));
Uranus_y = table2array(T(:,9));
Uranus_A = zeros(height(T), 5);
Uranus_b = zeros(height(T), 1);
Neptune_x = table2array(T(:,11));
Neptune_y = table2array(T(:,12));
Neptune_A = zeros(height(T), 5);
Neptune_b = zeros(height(T), 1);
Pluto_x = table2array(T(:,14));
Pluto_y = table2array(T(:,15));
Pluto_A = zeros(height(T), 5);
Pluto_b = zeros(height(T), 1);
for i=1:height(T)
    Jupiter_A(i, 1) = Jupiter_y(i, :)^2;
    Jupiter_A(i, 2) = Jupiter_y(i)*Jupiter_x(i);
    Jupiter_A(i, 3) = Jupiter_x(i);
    Jupiter_A(i, 4) = Jupiter_y(i);
    Jupiter_A(i, 5) = 1;
    Jupiter_b(i) = Jupiter_x(i)^2;
    Saturn_A(i, 1) = Saturn_y(i)^2;
    Saturn_A(i, 2) = Saturn_y(i)*Saturn_x(i);
    Saturn_A(i, 3) = Saturn_x(i);
    Saturn_A(i, 4) = Saturn_y(i);
    Saturn_A(i, 5) = 1;
    Saturn_b(i) = Saturn_x(i)^2;
    Uranus_A(i, 1) = Uranus_y(i)^2;
    Uranus_A(i, 2) = Uranus_y(i)*Uranus_x(i);
    Uranus_A(i, 3) = Uranus_x(i);
    Uranus_A(i, 4) = Uranus_y(i);
    Uranus_A(i, 5) = 1;
    Uranus_b(i) = Uranus_x(i)^2;
    Neptune_A(i, 1) = Neptune_y(i)^2;
    Neptune_A(i, 2) = Neptune_y(i)*Neptune_x(i);
    Neptune_A(i, 3) = Neptune_x(i);
    Neptune_A(i, 4) = Neptune_y(i);
    Neptune_A(i, 5) = 1;
    Neptune_b(i) = Neptune_x(i)^2;
    Pluto_A(i, 1) = Pluto_y(i)^2;
    Pluto_A(i, 2) = Pluto_y(i)*Pluto_x(i);
    Pluto_A(i, 3) = Pluto_x(i);
    Pluto_A(i, 4) = Pluto_y(i);
    Pluto_A(i, 5) = 1;
    Pluto_b(i) = Pluto_x(i)^2;
end
%solve for coefficients
Jupiter_coeff = Jupiter_A\Jupiter_b;
Saturn_coeff = Saturn_A\Saturn_b;
Uranus_coeff = Uranus_A\Uranus_b;
Neptune_coeff = Neptune_A\Neptune_b;
Pluto_coeff = Pluto_A\Pluto_b;
%print table
PlanetName = ["Jupiter"; "Saturn"; "Uranus"; "Neptune"; "Pluto"];
a = [Jupiter_coeff(1); Saturn_coeff(1); Uranus_coeff(1); Neptune_coeff(1); Pluto_coeff(1)];
b = [Jupiter_coeff(2); Saturn_coeff(2); Uranus_coeff(2); Neptune_coeff(2); Pluto_coeff(2)];
c = [Jupiter_coeff(3); Saturn_coeff(3); Uranus_coeff(3); Neptune_coeff(3); Pluto_coeff(3)];
d = [Jupiter_coeff(4); Saturn_coeff(4); Uranus_coeff(4); Neptune_coeff(4); Pluto_coeff(4)];
e = [Jupiter_coeff(5); Saturn_coeff(5); Uranus_coeff(5); Neptune_coeff(5); Pluto_coeff(5)];
coeffs = table(PlanetName, a, b, c, d, e);
disp(coeffs);
%plot Jupiter to check correctness
plot(Jupiter_x,Jupiter_y);
hold on;
[xs, ys] = meshgrid(min(Jupiter_x)-1:0.1:max(Jupiter_x)+1, min(Jupiter_y)-1:0.1:max(Jupiter_y)+1);
contour(xs, ys, Jupiter_coeff(1)*ys.^2+Jupiter_coeff(2)*xs.*ys+Jupiter_coeff(3)*xs+Jupiter_coeff(4)*ys+Jupiter_coeff(5)-xs.^2, [0, 0], 'k--', 'LineWidth', 1);
%plot Saturn to check correctness
plot(Saturn_x,Saturn_y);
hold on;
[xs, ys] = meshgrid(min(Saturn_x)-1:0.1:max(Saturn_x)+1, min(Saturn_y)-1:0.1:max(Saturn_y)+1);
contour(xs, ys, Saturn_coeff(1)*ys.^2+Saturn_coeff(2)*xs.*ys+Saturn_coeff(3)*xs+Saturn_coeff(4)*ys+Saturn_coeff(5)-xs.^2, [0, 0], 'k--', 'LineWidth', 1);
%plot Uranus to check correctness
plot(Uranus_x,Uranus_y);
hold on;
[xs, ys] = meshgrid(min(Uranus_x)-1:0.1:max(Uranus_x)+1, min(Uranus_y)-1:0.1:max(Uranus_y)+1);
contour(xs, ys, Uranus_coeff(1)*ys.^2+Uranus_coeff(2)*xs.*ys+Uranus_coeff(3)*xs+Uranus_coeff(4)*ys+Uranus_coeff(5)-xs.^2, [0, 0], 'k--', 'LineWidth', 1);
%plot Neptune to check correctness
plot(Neptune_x,Neptune_y);
hold on;
[xs, ys] = meshgrid(min(Neptune_x)-1:0.1:max(Neptune_x)+1, min(Neptune_y)-1:0.1:max(Neptune_y)+1);
contour(xs, ys, Neptune_coeff(1)*ys.^2+Neptune_coeff(2)*xs.*ys+Neptune_coeff(3)*xs+Neptune_coeff(4)*ys+Neptune_coeff(5)-xs.^2, [0, 0], 'k--', 'LineWidth', 1);
%plot Pluto to check correctness
plot(Pluto_x,Pluto_y);
hold on;
[xs, ys] = meshgrid(min(Pluto_x)-1:0.1:max(Pluto_x)+1, min(Pluto_y)-1:0.1:max(Pluto_y)+1);
contour(xs, ys, Pluto_coeff(1)*ys.^2+Pluto_coeff(2)*xs.*ys+Pluto_coeff(3)*xs+Pluto_coeff(4)*ys+Pluto_coeff(5)-xs.^2, [0, 0], 'k--', 'LineWidth', 1);
