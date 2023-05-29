clf;
close all;

T = 0.5;
%%
subplot(6,1,1);
x11 = plot(xreal.time,xhat1.signals.values(:,1),'b','LineWidth',1);
hold on;
x12 = plot(xreal.time,xhat2.signals.values(:,1),'b','LineWidth',1);
hold on;
x13 = plot(xreal.time,xhat3.signals.values(:,1),'b','LineWidth',1);
hold on;
x14 = plot(xreal.time,xhat4.signals.values(:,1),'b','LineWidth',1);
hold on;
% x15 = plot(xreal.time,xhat5.signals.values(:,1),'b','LineWidth',1);
% hold on;
% x16 = plot(xreal.time,xhat6.signals.values(:,1),'b','LineWidth',1);
% hold on;
x1 = plot(xreal.time,xreal.signals.values(:,1),'r--','LineWidth',1);
xlim([0 T]);
% ylim([-3 3]);
legend([x1 x11],{'$x^1$','$\hat{x}_i^1$'},'Interpreter','latex');
xlabel('Time');
ylabel('$x^1$ and its estimates','Interpreter','latex');
set(gca,'fontname','times') 
set(gca,'fontsize',14)
grid on;
hold on;
%%
subplot(6,1,2);
x21 = plot(xreal.time,xhat1.signals.values(:,2),'b','LineWidth',1);
hold on;
x22 = plot(xreal.time,xhat2.signals.values(:,2),'b','LineWidth',1);
hold on;
x23 = plot(xreal.time,xhat3.signals.values(:,2),'b','LineWidth',1);
hold on;
x24 = plot(xreal.time,xhat4.signals.values(:,2),'b','LineWidth',1);
hold on;
% x25 = plot(xreal.time,xhat5.signals.values(:,2),'b','LineWidth',1);
% hold on;
% x26 = plot(xreal.time,xhat6.signals.values(:,2),'b','LineWidth',1);
% hold on;
x2 = plot(xreal.time,xreal.signals.values(:,2),'r--','LineWidth',1);
xlim([0 T]);
% ylim([-8 6]);
legend([x2 x21],{'$x^2$','$\hat{x}_i^2$'},'Interpreter','latex');
xlabel('Time');
ylabel('$x^2$ and its estimates','Interpreter','latex');
set(gca,'fontname','times')  % Set it to times
set(gca,'fontsize',14)
grid on;
hold on;
%%
subplot(6,1,3);
x31 = plot(xreal.time,xhat1.signals.values(:,3),'b','LineWidth',1);
hold on;
x32 = plot(xreal.time,xhat2.signals.values(:,3),'b','LineWidth',1);
hold on;
x33 = plot(xreal.time,xhat3.signals.values(:,3),'b','LineWidth',1);
hold on;
x34 = plot(xreal.time,xhat4.signals.values(:,3),'b','LineWidth',1);
hold on;
% x35 = plot(xreal.time,xhat5.signals.values(:,3),'b','LineWidth',1);
% hold on;
% x36 = plot(xreal.time,xhat6.signals.values(:,3),'b','LineWidth',1);
% hold on;
x3 = plot(xreal.time,xreal.signals.values(:,3),'r--','LineWidth',1);
xlim([0 T]);
% ylim([-6 6]);
legend([x3 x31],{'$x^3$','$\hat{x}_i^3$'},'Interpreter','latex');
xlabel('Time');
ylabel('$x^3$ and its estimates','Interpreter','latex');
set(gca,'fontname','times')  % Set it to times
set(gca,'fontsize',14)
grid on;
hold on;
%%
subplot(6,1,4);
x41 = plot(xreal.time,xhat1.signals.values(:,4),'b','LineWidth',1);
hold on;
x42 = plot(xreal.time,xhat2.signals.values(:,4),'b','LineWidth',1);
hold on;
x43 = plot(xreal.time,xhat3.signals.values(:,4),'b','LineWidth',1);
hold on;
x44 = plot(xreal.time,xhat4.signals.values(:,4),'b','LineWidth',1);
hold on;
% x45 = plot(xreal.time,xhat5.signals.values(:,4),'b','LineWidth',1);
% hold on;
% x46 = plot(xreal.time,xhat6.signals.values(:,4),'b','LineWidth',1);
% hold on;
x4 = plot(xreal.time,xreal.signals.values(:,4),'r--','LineWidth',1);
xlim([0 T]);
% ylim([-6 6]);
legend([x4 x41],{'$x^4$','$\hat{x}_i^4$'},'Interpreter','latex');
xlabel('Time');
ylabel('$x^4$ and its estimates','Interpreter','latex');
set(gca,'fontname','times')  % Set it to times
set(gca,'fontsize',14)
grid on;
hold on;
%%
subplot(6,1,5);
x51 = plot(xreal.time,xhat1.signals.values(:,5),'b','LineWidth',1);
hold on;
x52 = plot(xreal.time,xhat2.signals.values(:,5),'b','LineWidth',1);
hold on;
x53 = plot(xreal.time,xhat3.signals.values(:,5),'b','LineWidth',1);
hold on;
x54 = plot(xreal.time,xhat4.signals.values(:,5),'b','LineWidth',1);
hold on;
% x55 = plot(xreal.time,xhat5.signals.values(:,5),'b','LineWidth',1);
% hold on;
% x56 = plot(xreal.time,xhat6.signals.values(:,5),'b','LineWidth',1);
% hold on;
x5 = plot(xreal.time,xreal.signals.values(:,5),'r--','LineWidth',1);
xlim([0 T]);
% ylim([-6 6]);
legend([x5 x51],{'$x^5$','$\hat{x}_i^5$'},'Interpreter','latex');
xlabel('Time');
ylabel('$x^5$ and its estimates','Interpreter','latex');
set(gca,'fontname','times')  % Set it to times
set(gca,'fontsize',14)
grid on;
hold on;
%%
subplot(6,1,6);
x61 = plot(xreal.time,xhat1.signals.values(:,6),'b','LineWidth',1);
hold on;
x62 = plot(xreal.time,xhat2.signals.values(:,6),'b','LineWidth',1);
hold on;
x63 = plot(xreal.time,xhat3.signals.values(:,6),'b','LineWidth',1);
hold on;
x64 = plot(xreal.time,xhat4.signals.values(:,6),'b','LineWidth',1);
hold on;
% x65 = plot(xreal.time,xhat5.signals.values(:,6),'b','LineWidth',1);
% hold on;
% x66 = plot(xreal.time,xhat6.signals.values(:,6),'b','LineWidth',1);
% hold on;
x6 = plot(xreal.time,xreal.signals.values(:,6),'r--','LineWidth',1);
xlim([0 T]);
% ylim([-6 6]);
legend([x6 x61],{'$x^6$','$\hat{x}_i^6$'},'Interpreter','latex');
xlabel('Time');
ylabel('$x^6$ and its estimates','Interpreter','latex');
set(gca,'fontname','times')  % Set it to times
set(gca,'fontsize',14)
grid on;
hold on;