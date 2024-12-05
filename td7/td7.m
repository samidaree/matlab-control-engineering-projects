tmax = 10 ;
Te = 1e-3 ;
t = [0:Te:tmax]
A = [-2 -4 ;-2 -9]
B = [0; 1]

x = zeros(2,length(t));
e = ones(1, length(t));

for i = 2: length(t)
    x(:, i) = (eye(2) + Te*A)*x(:,i-1) + B*Te*e(i-1);
end

plot(t,x,'.') ;
X_c = [-4/10 - 4/90 * exp(-10*t)+4/9*exp(t); 2/10 - 4/45*exp(-10*t)-1/9*exp(-t)] ;

hold on ;
plot(t, X_c);

% Ex 3
clear all
close all
clc

N = 10 ;
A = [[-1 1] ; [-4 -2]] ;
B = [1 ; -1]
C = [1 1]
X = zeros(2,N) ;
e = ones(1,N) ;
S = zeros(1,N) ;

for k = 1:N-1
    X(:,k+1) = A * X(:,k) + B*e(k)
end

S = C * X ;
plot(1: N, X) ;


% Ex 4
clear all
close all
clc

% N = 1 <=> 0T, 2 <=> 1T, 3 <=> 2T
N = 3 ;
A = [[-1 0] ; [0 -2]] ;
B = [1 ; 2]
X = zeros(2,N) ;
e = [3/2 7/2];

for k = 1:N-1
    X(:,k+1) = A * X(:,k) + B*e(k)
end

plot(1: N, X) ;


% Ex 2
clear all
close all
clc

N = 10
r_a = 0.5 ;
r_l = 0.02;
k_a = 0.25 ;
k_l  = 0.75 ;

A = [[r_a r_l] ; [0 1] ] ;
B = [k_a ; k_l]  ;

C = [1 1] ;
X(:,1) = [100 ; 100] ;
e = ones(1, N) * 50 ;
for k = 1:N-1
    X(:,k+1) = A * X(:,k) + B*e(k)
end

plot(1: N, X) ;

%Exercice 5

clear all
close all
clc

N = 40;
A = [[-0.6 0] ; [0 0.2]] ;
B = [1 ; -12]
X(:,1) = [1; 1]
X_est(:,1) = [0;0]
C = [1 0.5]
V = [-0.2 ;0]
e = ones(1, N)  ;

for k = 1:N-1
    s(:, k) = C*X(:,k)
    X(:,k+1) = A*X(:,k) + B*e(k)
    X_est(:,k+1) = A*X_est(:,k) + B *e(k) + V*[s(:,k)-C*X_est(:,k)] ;
end

xlabel('N');
ylabel('X');
title('G(f)');
% On pren d premiere ligne toutes les colonnes
plot(1: N, X(1, :), 'b', 'DisplayName', 'X') ;
hold on ;

xlabel('N');
ylabel('X');
plot(1:N, X_est(1, :), 'r', 'DisplayName', 'X_est');
legend('show')