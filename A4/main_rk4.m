n = 4;
nsteps = 100;
a = 0;
b = 17.1;
t = 0;
xi = [0.994;0;0;-2.001585106379082522420537862224];
h = (b-a)/nsteps;
x_output_100 = RK4_System1(n,h,t,xi,nsteps);

n = 4;
nsteps = 1000;
a = 0;
b = 17.1;
t = 0;
xi = [0.994;0;0;-2.001585106379082522420537862224];
h = (b-a)/nsteps;
x_output_1000 = RK4_System1(n,h,t,xi,nsteps);

n = 4;
nsteps = 10000;
a = 0;
b = 17.1;
t = 0;
xi = [0.994;0;0;-2.001585106379082522420537862224];
h = (b-a)/nsteps;
x_output_10000 = RK4_System1(n,h,t,xi,nsteps);

n = 4;
nsteps = 20000;
a = 0;
b = 17.1;
t = 0;
xi = [0.994;0;0;-2.001585106379082522420537862224];
h = (b-a)/nsteps;
x_output_20000 = RK4_System1(n,h,t,xi,nsteps);

t = tiledlayout(2,2);
nexttile
plot(x_output_100(3,:),x_output_100(1,:))
title('100 steps')
nexttile
plot(x_output_1000(3,:),x_output_1000(1,:))
title('1000 steps')
nexttile
plot(x_output_10000(3,:),x_output_10000(1,:))
title('10000 steps')
nexttile
plot(x_output_20000(3,:),x_output_20000(1,:))
title('20000 steps')