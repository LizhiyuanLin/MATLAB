function s = expsum3(x)
    pos = 0;
    neg = 0;
    current_term = 1;
    i = 1;
    while pos + current_term ~= pos && neg + current_term ~= neg
        if current_term >= 0
            pos = pos + current_term;
        else
            neg = neg + current_term;
        end
        current_term = x^i / factorial(i);
        i = i + 1;
    end
    s = pos + neg;
end