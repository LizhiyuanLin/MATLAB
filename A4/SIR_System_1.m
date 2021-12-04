function fi = SIR_System_1(t,xi)
    beta = 0.9/13986;
    gamma = 1/14;
    fi = zeros(3,1);
    fi(1) = -beta*xi(1)*xi(2);
    fi(2) = beta*xi(1)*xi(2)-gamma*xi(2);
    fi(3) = gamma*xi(2);
end