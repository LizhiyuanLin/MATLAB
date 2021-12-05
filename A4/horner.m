function eval = horner(r)
    a = [-512 2304 -4608 5376 -4032 2016 -672 144 -18 1];
    b = zeros(1,9);
    n = 9;
    b(n) = a(n+1);
    for i=n:-1:2
        b(i-1) = a(i)+r*b(i);
    end
    eval = a(1)+r*b(1);
end