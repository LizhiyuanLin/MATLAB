function s = expsum1(x)
    s = 0;
    current_term = 1;
    i = 1;
    while s + current_term ~= s
        s = s + current_term;
        current_term = x^i / factorial(i);
        i = i + 1;
    end
end