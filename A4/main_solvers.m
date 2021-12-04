options = odeset('RelTol',1e-10);
%ode23
tic
[~, ~, stats_23] = ode23(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode23_CPU_time = toc;
%ode45
tic
[~, ~, stats_45] = ode45(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode45_CPU_time = toc;
%ode23s
tic
[~, ~, stats_23s] = ode23s(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode23s_CPU_time = toc;
%ode15s
tic
[~, ~, stats_15s] = ode15s(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode15s_CPU_time = toc;
%ode113
tic
[~, ~, stats_113] = ode113(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode113_CPU_time = toc;
fprintf("\t\t\t\t\t\t\t\t\t\tnumber of\n");
fprintf("\t\t\t\t\t---------------------------------------------------\n");
fprintf("solver\tCPU time\tsteps\tfailed steps\tfunction evaluations\n");
fprintf("ode23\t%.4e\t%d\t%d\t\t\t\t\t%d\n", ode23_CPU_time, stats_23(1)+stats_23(2), stats_23(2),stats_23(3));
fprintf("ode45\t%.4e\t%d\t%d\t\t\t\t\t%d\n", ode45_CPU_time, stats_45(1)+stats_45(2), stats_45(2), stats_45(3));
fprintf("ode23s\t%.4e\t%d\t%d\t\t\t\t\t%d\n", ode23s_CPU_time, stats_23s(1)+stats_23s(2), stats_23s(2), stats_23s(3));
fprintf("ode15s\t%.4e\t%d\t%d\t\t\t\t\t%d\n", ode15s_CPU_time, stats_15s(1)+stats_15s(2), stats_15s(2), stats_15s(3));
fprintf("ode113\t%.4e\t%d\t%d\t\t\t\t\t%d\n", ode113_CPU_time, stats_113(1)+stats_113(2), stats_113(2), stats_113(3));