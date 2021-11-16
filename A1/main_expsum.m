values = [-20 -15 -5 -1 1 5 15 20];
fprintf("expsum1 \n");
fprintf("x \t accurate value \t approx. value \t abs. error \t rel. error \n");
for x = values
    accurate = exp(x);
    approx = expsum1(x);
    fprintf("%i \t %i \t %i \t %i \t %i \n" ,x , accurate, approx, abs(approx - accurate), abs(approx - accurate)/abs(accurate));
end
fprintf("expsum2 \n");
fprintf("x \t accurate value \t approx. value \t abs. error \t rel. error \n");
for x = values
    accurate = exp(x);
    approx = expsum2(x);
    fprintf("%i \t %i \t %i \t %i \t %i \n" ,x , accurate, approx, abs(approx - accurate), abs(approx - accurate)/abs(accurate));
end
fprintf("expsum3 \n");
fprintf("x \t accurate value \t approx. value \t abs. error \t rel. error \n");
for x = values
    accurate = exp(x);
    approx = expsum3(x);
    fprintf("%i \t %i \t %i \t %i \t %i \n" ,x , accurate, approx, abs(approx - accurate), abs(approx - accurate)/abs(accurate));
end