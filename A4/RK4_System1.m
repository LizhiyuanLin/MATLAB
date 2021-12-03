function x_output = RK4_System1(n,h,t,xi,nsteps)
    x_output = zeros(n,nsteps);
    Kij = zeros(n,4);
    yi = zeros(n,1);
    for j=1:nsteps
        Kij(:,1) = XP_System(t,xi);
        for i=1:n
        	yi(i) = xi(i)+0.5*h*Kij(i,1);
        end
        Kij(:,2) = XP_System(t+h/2,yi);
        for i=1:n
        	yi(i) = xi(i)+0.5*h*Kij(i,2);
        end
        Kij(:,3) = XP_System(t+h/2,yi);
        for i=1:n
        	yi(i) = xi(i)+h*Kij(i,3);
        end
        Kij(:,4) = XP_System(t+h,yi);
        for i=1:n
        	xi(i) = xi(i)+h/6*(Kij(i,1)+2*Kij(i,2)+2*Kij(i,3)+Kij(i,4));
        end
        t = t+h;
        x_output(:,j) = xi;
    end
end