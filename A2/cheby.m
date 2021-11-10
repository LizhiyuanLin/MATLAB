function X = cheby(n)
    X = zeros(n+1);
    for i=0:n
       X(i+1) = cos(pi*(2*i+1)/(2*n+2));
    end
end