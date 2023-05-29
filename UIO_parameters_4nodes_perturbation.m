clear;
%%_ parameters this is with input disturbance i.e. unknown input to all
%%nodes

Adj = [0,1,1,0;
       1,0,0,1;
       1,0,0,1;
       0,1,1,0]; 
Diag = diag([2,2,2,2]);
        
Lap = Diag - Adj;
N = 4;
% n = 6;
lambda_2 = eig(Lap);
lambda_2 = sort(lambda_2);
lambda_2 = lambda_2(2);
%%_

% xis = rand(12,1);
xis = 0.05*[5,1,5,3,8,3,8,2,7,4,2,3];
Xi = [0,xis(1),0,xis(2),0,0,0,0,0;
      xis(1),0,xis(3),0,xis(4),0,0,0,0;
      0,xis(3),0,0,0,xis(5),0,0,0;
      xis(2),0,0,0,xis(6),0,xis(7),0,0;
      0,xis(4),0,xis(6),0,xis(8),0,xis(9),0;
      0,0,xis(5),0,xis(8),0,0,0,xis(10);
      0,0,0,xis(7),0,0,0,xis(11),0;
      0,0,0,0,xis(9),0,xis(11),0,xis(12);
      0,0,0,0,0,xis(10),0,xis(12),0];

  A = Xi - diag(sum(Xi,2));


B = 0.1*[0,0,0,0;
     1,0,0,0;
     0,0,0,0;
     0,0,0,0;
     0,1,0,0;
     0,0,1,0;
     0,0,0,0;
     0,0,0,0;
     0,0,0,1];

B1 = B(:,1);
B2 = B(:,2);
B3 = B(:,3);
D  = B(:,4);
% B4 = [B1,B2,B3];
 


C1 = [0,0,0,0,1,0,0,0,0;
      0,0,0,0,0,1,0,0,0;
      0,0,0,0,0,0,0,0,1];
C2 = [0,1,0,0,0,0,0,0,0;
      0,0,0,0,0,1,0,0,0;
      0,0,0,0,0,0,0,0,1];
C3 = [0,1,0,0,0,0,0,0,0;
      0,0,0,0,1,0,0,0,0;
      0,0,0,0,0,0,0,0,1];
C4 = [0,1,0,0,0,0,0,0,0;
      0,0,0,0,1,0,0,0,0;
      0,0,0,0,0,1,0,0,0;
      0,0,0,0,0,0,0,0,1];

% C4 = [1,0,0,0,0,1];

acuteB1 = [B2,B3,D];
acuteB2 = [B1,B3,D];
acuteB3 = [B1,B2,D];
acuteB4 = B;
% acuteB4 = D;

[n,m1] = size(B1);
[~,m2] = size(B2);
[~,m3] = size(B3);
m4 = 0;

[p1,~] = size(C1);
[p2,~] = size(C2);
[p3,~] = size(C3);
[p4,~] = size(C4);
[~,d1] = size(acuteB1);
[~,d2] = size(acuteB2);
[~,d3] = size(acuteB3);
[~,d4] = size(acuteB4);
%check
if (rank(C1*acuteB1)==d1) && (rank(C2*acuteB2)==d2) && (rank(C3*acuteB3)==d3) && (rank(C4*acuteB4)==d4)
    disp('good')
else
    disp('bad')
end
x0 = [15.8;27.5;7.4;8.1;11.2;23.2;25.3;23.2;18.3];
F = place(A,[B1,B2,B3],-1*[0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9]);
xset = 18*ones(n,1);
DeltaA = [zeros(n-1,n);1e-4*[81,90,12,91,63,9,27,54,95]];
DeltaB = [zeros(n-1,3);1e-3*[15,97,95]];
%% 
U1 = acuteB1*pinv(C1*acuteB1);
U2 = acuteB2*pinv(C2*acuteB2);
U3 = acuteB3*pinv(C3*acuteB3);
U4 = acuteB4*pinv(C4*acuteB4);

V1 = eye(p1) - (C1*acuteB1)*pinv(C1*acuteB1);
V2 = eye(p2) - (C2*acuteB2)*pinv(C2*acuteB2);
V3 = eye(p3) - (C3*acuteB3)*pinv(C3*acuteB3);
V4 = eye(p4) - (C4*acuteB4)*pinv(C4*acuteB4);

%% LMIs
cvx_begin
cvx_solver sdpt3;
cvx_precision best;

variable P1(n,n)  symmetric;
variable P2(n,n)  symmetric;
variable P3(n,n)  symmetric;
variable P4(n,n)  symmetric;

variable barY1(n,p1);
variable barY2(n,p2);
variable barY3(n,p3);
variable barY4(n,p4);

variable barK1(n,p1);
variable barK2(n,p2);
variable barK3(n,p3);
variable barK4(n,p4);
% variable chi;
% variable varmu;

Lambda1 = A'*(eye(n)-C1'*U1')*P1 + P1*(eye(n)-U1*C1)*A - A'*C1'*V1*barY1' - barY1*V1*C1*A - C1'*barK1' - barK1*C1;
Lambda2 = A'*(eye(n)-C2'*U2')*P2 + P2*(eye(n)-U2*C2)*A - A'*C2'*V2*barY2' - barY2*V2*C2*A - C2'*barK2' - barK2*C2;
Lambda3 = A'*(eye(n)-C3'*U3')*P3 + P3*(eye(n)-U3*C3)*A - A'*C3'*V3*barY3' - barY3*V3*C3*A - C3'*barK3' - barK3*C3;
Lambda4 = A'*(eye(n)-C4'*U4')*P4 + P4*(eye(n)-U4*C4)*A - A'*C4'*V4*barY4' - barY4*V4*C4*A - C4'*barK4' - barK4*C4;

sum_Lambda = Lambda1+Lambda2+Lambda3+Lambda4;
minimize(norm(P1)+norm(P2)+norm(P3)+norm(P4));
subject to
-sum_Lambda-0.1*eye(size(sum_Lambda,1))== semidefinite(size(sum_Lambda,1));
(P1-0.1*eye(n)) == semidefinite(size(P1,1));
(P2-0.1*eye(n)) == semidefinite(size(P2,1));
(P3-0.1*eye(n)) == semidefinite(size(P3,1));
(P4-0.1*eye(n)) == semidefinite(size(P4,1));
cvx_end

Y1 = P1^(-1)*barY1;
Y2 = P2^(-1)*barY2;
Y3 = P3^(-1)*barY3;
Y4 = P4^(-1)*barY4;

K1 = P1^(-1)*barK1;
K2 = P2^(-1)*barK2;
K3 = P3^(-1)*barK3;
K4 = P4^(-1)*barK4;

H1 = U1 + Y1*V1;
H2 = U2 + Y2*V2;
H3 = U3 + Y3*V3;
H4 = U4 + Y4*V4;

M1 = eye(n) - H1*C1;
M2 = eye(n) - H2*C2;
M3 = eye(n) - H3*C3;
M4 = eye(n) - H4*C4;

N1 = M1*A - K1*C1;
N2 = M2*A - K2*C2;
N3 = M3*A - K3*C3;
N4 = M4*A - K4*C4;

L1 = K1 + N1*H1;
L2 = K2 + N2*H2;
L3 = K3 + N3*H3;
L4 = K4 + N4*H4;

Lambda = blkdiag(Lambda1,Lambda2,Lambda3,Lambda4);
Lambda_P = [Lambda1,Lambda2,Lambda3,Lambda4];

chi = norm(Lambda + Lambda_P'*(-sum_Lambda)^(-1)*Lambda_P)/(2*lambda_2)+0.1

lambda_min_mu = eig(2*chi*kron(Lap,eye(n))-Lambda);
lambda_min_mu = sort(lambda_min_mu);
lambda_min_mu = lambda_min_mu(1);

lambda_max_P1 = eig(P1);
lambda_max_P1 = sort(lambda_max_P1);
lambda_max_P1 = lambda_max_P1(n);

lambda_max_P2 = eig(P2);
lambda_max_P2 = sort(lambda_max_P2);
lambda_max_P2 = lambda_max_P2(n);

lambda_max_P3 = eig(P3);
lambda_max_P3 = sort(lambda_max_P3);
lambda_max_P3 = lambda_max_P3(n);

lambda_max_P4 = eig(P4);
lambda_max_P4 = sort(lambda_max_P4);
lambda_max_P4 = lambda_max_P4(n);

mu = lambda_min_mu/max([lambda_max_P1,lambda_max_P2,lambda_max_P3,lambda_max_P4]);

1/mu

P = blkdiag(P1,P2,P3,P4);
e0 = [x0-H1*C1*x0;x0-H2*C2*x0;x0-H3*C3*x0;x0-H4*C4*x0];
V0 = e0'*P*e0;

