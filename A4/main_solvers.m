options = odeset('RelTol',1e-10,'AbsTol',1e-10);
%ode23
tic
x_23 = ode23(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode23_CPU_time = toc;
%ode45
tic
x_45 = ode45(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode45_CPU_time = toc;
%ode23s
tic
x_23s = ode23s(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode23s_CPU_time = toc;
%ode15s
tic
x_15s = ode15s(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode15s_CPU_time = toc;
%ode113
tic
x_113 = ode113(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode113_CPU_time = toc;
fprintf("\t\t\t\t\t\t\t\t\t\tnumber of\n");
fprintf("\t\t\t\t\t---------------------------------------------------\n");
fprintf("solver\tCPU time\tsteps\tfailed steps\tfunction evaluations\n");
fprintf("ode23\t%.4e\t%d\t%d\t\t\t\t\t%d\n", ode23_CPU_time, x_23.stats.nsteps, x_23.stats.nfailed, x_23.stats.nfevals);
fprintf("ode45\t%.4e\t%d\t%d\t\t\t\t\t%d\n", ode45_CPU_time, x_45.stats.nsteps, x_45.stats.nfailed, x_45.stats.nfevals);
fprintf("ode23s\t%.4e\t%d\t%d\t\t\t\t\t%d\n", ode23s_CPU_time, x_23s.stats.nsteps, x_23s.stats.nfailed, x_23s.stats.nfevals);
fprintf("ode15s\t%.4e\t%d\t%d\t\t\t\t\t%d\n", ode15s_CPU_time, x_15s.stats.nsteps, x_15s.stats.nfailed, x_15s.stats.nfevals);
fprintf("ode113\t%.4e\t%d\t%d\t\t\t\t\t%d\n", ode113_CPU_time, x_113.stats.nsteps, x_113.stats.nfailed, x_113.stats.nfevals);