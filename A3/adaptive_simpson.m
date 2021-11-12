function [C2, simpson_result] = adaptive_simpson(f, a, b, epsilon, level, level_max)
    C2 = 0;
    level = level+1;
    h = b-a;
    c = (a+b)/2;
    one_simpson = h*(f(a)+4*f(c)+f(b))/6;
    C2 = C2+3;
    d = (a+c)/2;
    e = (c+b)/2;
    two_simpson = h*(f(a)+4*f(d)+2*f(c)+4*f(e)+f(b))/12;
    C2 = C2+5;
    if level >= level_max
        simpson_result = two_simpson;
    else
        if abs(two_simpson-one_simpson) < 15*epsilon
            simpson_result = two_simpson+(two_simpson-one_simpson)/15;
        else
            [C2_left, left_simpson] = adaptive_simpson(f, a, c, epsilon/2, level, level_max);
            [C2_right, right_simpson] = adaptive_simpson(f, c, b, epsilon/2, level, level_max);
            simpson_result = left_simpson+right_simpson;
            C2 = C2+C2_left+C2_right;
        end
    end
end