[t_1,y_1] = ode45(@SIR_System_1,[0,200],[999;1;0]);
[t_2,y_2] = ode45(@SIR_System_2,[0,200],[999;1;0]);
[t_3,y_3] = ode45(@SIR_System_3,[0,200],[999;1;0]);
[t_4,y_4] = ode45(@SIR_System_4,[0,200],[999;1;0]);
%plot
t = tiledlayout(2,2);
nexttile
plot(t_1,y_1(:,1),t_1,y_1(:,2),t_1,y_1(:,3));
title('0.9')
legend('S(t)','I(t)','R(t)')
nexttile
plot(t_2,y_2(:,1),t_2,y_2(:,2),t_2,y_2(:,3));
title('1')
legend('S(t)','I(t)','R(t)')
nexttile
plot(t_3,y_3(:,1),t_3,y_3(:,2),t_3,y_3(:,3));
title('3')
legend('S(t)','I(t)','R(t)')
nexttile
plot(t_4,y_4(:,1),t_4,y_4(:,2),t_4,y_4(:,3));
title('5')
legend('S(t)','I(t)','R(t)')