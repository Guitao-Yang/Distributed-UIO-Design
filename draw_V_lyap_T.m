clf;
close all;

T = 50;
%%
V_lyap = plot(xreal.time,V_lyap.signals.values(:,1),'b','LineWidth',1);
hold on;
V_min = fplot(@(x) exp(-mu*x)*V0,'r--','LineWidth',1);
hold on;
xlim([0 T]);
% ylim([0 10]);
legend(V_lyap,{'$V$'},'Interpreter','latex');
legend([V_min V_lyap],{'$e^{-\mu t}V(0)$','$V$'},'Interpreter','latex');
xlabel('Time (s)');
ylabel('$V$','Interpreter','latex');
set(gca,'fontname','times') 
set(gca,'fontsize',14)
grid on;
hold on;
