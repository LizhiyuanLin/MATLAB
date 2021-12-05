% part a
[t,y] = ode15s(@HIRES_System,[0,321.8122],[1,0,0,0,0,0,0,0.0057]);
tile_table = tiledlayout(4,2);
nexttile
plot(t,y(:,1))
xlim([0 5])
title('y(1) on [0,5]')
nexttile
plot(t,y(:,2))
xlim([0 5])
title('y(2) on [0,5]')
nexttile
plot(t,y(:,3))
xlim([0 5])
title('y(3) on [0,5]')
nexttile
plot(t,y(:,4))
xlim([0 5])
title('y(4) on [0,5]')
nexttile
plot(t,y(:,5))
title('y(5)')
nexttile
plot(t,y(:,6))
title('y(6)')
nexttile
plot(t,y(:,7))
xlim([0 5])
title('y(7) on [0,5]')
nexttile
plot(t,y(:,8))
xlim([0 5])
title('y(8) on [0,5]')
% part b
options = odeset('RelTol',1e-6,'AbsTol',1e-6);
%ode23s
tic
x_23s = ode23s(@HIRES_System,[0,321.8122],[1,0,0,0,0,0,0,0.0057],options);
ode23s_CPU_time = toc;
%ode15s
tic
x_15s = ode15s(@HIRES_System,[0,321.8122],[1,0,0,0,0,0,0,0.0057],options);
ode15s_CPU_time = toc;
%ode45
tic
x_45 = ode45(@HIRES_System,[0,321.8122],[1,0,0,0,0,0,0,0.0057],options);
ode45_CPU_time = toc;
fprintf("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tnumber of\n");
fprintf("\t\t\t\t\t------------------------------------------------------------------------------------\n");
fprintf("solver\tCPU time\tsteps\tfailed steps\tfunction evaluations\tLU decompositions\tnonlinear solves\n");
fprintf("ode23s\t%.4e\t%d\t\t\t%d\t\t\t\t\t%d\t\t\t\t\t%d\t\t\t\t\t%d\n", ode23s_CPU_time, x_23s.stats.nsteps, x_23s.stats.nfailed, x_23s.stats.nfevals, x_23s.stats.ndecomps, x_23s.stats.nsolves);
fprintf("ode15s\t%.4e\t%d\t\t\t%d\t\t\t\t\t%d\t\t\t\t\t\t%d\t\t\t\t\t%d\n", ode15s_CPU_time, x_15s.stats.nsteps, x_15s.stats.nfailed, x_15s.stats.nfevals, x_15s.stats.ndecomps, x_15s.stats.nsolves);
fprintf("ode45\t%.4e\t%d\t\t%d\t\t\t\t\t%d\n", ode45_CPU_time, x_45.stats.nsteps, x_45.stats.nfailed, x_45.stats.nfevals);
