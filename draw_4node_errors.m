% this file is drawing the estimation errors at all 4 nodes

clf;
close all;
%%
T = 50;

subplot(4,1,1);
plot(e1.time,e1.signals.values,'b','LineWidth',1);
hold on;
ylim([-5 30]);
% legend(e1,'$\hat{x}_i^1$','Interpreter','latex');
% xlabel('Time');
ylabel('$e_i$ at Node 1','Interpreter','latex');
set(gca,'fontname','times') 
set(gca,'fontsize',14)
grid on;
hold on;
%%
subplot(4,1,2);
plot(e2.time,e2.signals.values,'b','LineWidth',1);
hold on;
ylim([-5 30]);
% legend(e1,'$\hat{x}_i^1$','Interpreter','latex');
% xlabel('Time');
ylabel('$e_i$ at Node 2','Interpreter','latex');
set(gca,'fontname','times') 
set(gca,'fontsize',14)
grid on;
hold on;
%%
subplot(4,1,3);
plot(e3.time,e3.signals.values,'b','LineWidth',1);
hold on;
ylim([-5 30]);
% legend(e1,'$\hat{x}_i^1$','Interpreter','latex');
% xlabel('Time');
ylabel('$e_i$ at Node 3','Interpreter','latex');
set(gca,'fontname','times') 
set(gca,'fontsize',14)
grid on;
hold on;
%%
subplot(4,1,4);
plot(e4.time,e4.signals.values,'b','LineWidth',1);
hold on;
ylim([-5 30]);
% legend(e1,'$\hat{x}_i^1$','Interpreter','latex');
xlabel('Time (s)');
ylabel('$e_i$ at Node 4','Interpreter','latex');
set(gca,'fontname','times') 
set(gca,'fontsize',14)
grid on;
hold on;