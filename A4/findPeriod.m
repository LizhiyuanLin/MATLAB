function T = findPeriod(t, x, y, z)
    x0 = 1*365/100;
    
    X_p = interp1(t, x, 1:0.01:500, 'spline');
    x_period = seqperiod(X_p,1e-2);
    
    Y_p = interp1(t, y, 1:0.01:500, 'spline');
    y_period = seqperiod(Y_p,1e-2);
    
    Z_p = interp1(t, z, 1:0.01:500, 'spline');
    z_period = seqperiod(Z_p,1e-2);
    
    T = max([x_period y_period z_period])*100/365;
end