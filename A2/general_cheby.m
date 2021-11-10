function X = general_cheby(n, a, b)
    X = zeros(n+1);
    for i=0:n
       X(i+1) = 0.5*(b+a)+0.5*(b-a)*cos(pi*(2*i+1)/(2*n+2));
    end
end