clf;
close all;

T = 50;
%%
e_norm = plot(xreal.time,e_norm.signals.values(:,1),'b','LineWidth',1.5);
hold on;
xlim([0 T]);
% ylim([0 10]);

xlabel('Time (s)');
ylabel('$|e|$','Interpreter','latex');
set(gca,'fontname','times') 
set(gca,'fontsize',14)
grid on;
hold on;
