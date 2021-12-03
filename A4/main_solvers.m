options = odeset('RelTol',1e-10,'Stats','on');
%ode23
fprintf("ode23\n");
tic
ode23(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode23_CPU_time = toc;
%ode45
fprintf("ode45\n");
tic
ode45(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode45_CPU_time = toc;
%ode23s
fprintf("ode23s\n");
tic
ode23s(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode23s_CPU_time = toc;
%ode15s
fprintf("ode15s\n");
tic
ode15s(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode15s_CPU_time = toc;
%ode113
fprintf("ode113\n");
tic
ode113(@XP_System,[0,1000],[0.994;0;0;-2.001585106379082522420537862224],options);
ode113_CPU_time = toc;
fprintf("\t\t\t\t\t\t\t\t\t\tnumber of\n");
fprintf("\t\t\t\t\t---------------------------------------------------\n");
fprintf("solver\tCPU time\tsteps\tfailed steps\tfunction evaluations\n");
fprintf("ode23\t%.4e\t143416\t8\t\t\t\t\t430249\n", ode23_CPU_time);
fprintf("ode45\t%.4e\t7140\t92\t\t\t\t\t42841\n", ode45_CPU_time);
fprintf("ode23s\t%.4e\t176071\t1\t\t\t\t\t1.23249e+06\n", ode23s_CPU_time);
fprintf("ode15s\t%.4e\t14012\t136\t\t\t\t\t26449\n", ode15s_CPU_time);
fprintf("ode113\t%.4e\t11053\t290\t\t\t\t\t19817\n", ode113_CPU_time);