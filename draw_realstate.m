clf;
close all;

T = 50;
%%
plot(xreal.time,xreal.signals.values,'LineWidth',1.5);
hold on;
xlim([0 T]);
% ylim([0 10]);
% legend(e,{'$e=$'},'Interpreter','latex');
% legend(e_norm,{'$x_1$','$x_2$','$x_3$','$x_4$','$x_5$','$x_6$','$x_7$','$x_8$','$x_9$'},'Interpreter','latex');
xlabel('Time (s)');
ylabel('Temperature ($^\circ$) of each room','Interpreter','latex');
set(gca,'fontname','times') 
set(gca,'fontsize',14)
grid on;
hold on;
