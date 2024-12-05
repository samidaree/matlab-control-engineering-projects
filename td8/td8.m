%Exercice 1

clear all
close all
clc

A = [[0 1] ; [0 -alpha/M]] ;
B = [0 ; 1/M]
X(:,1) = [1; 1]
C = [0 1]
e = ones(1, length(t))  ;
% A barre
Ab = Te*A + [[1 0]; [0 1]]
%B barre
Bb = Te*B
tmax = 10 ;
Te = 1e-2 ;
t = [0:Te:tmax]
for k = 1:length(t)
    X(:,k+1) = Ab*X(:,k) + Bb*e(k)
end

xlabel('N');
ylabel('X');
title('G(f)');
% On prend premiere ligne toutes les colonnes
plot(1: N, X(1, :), 'b', 'DisplayName', 'X') ;
hold on ;

xlabel('N');
ylabel('X');
plot(1:N, X_est(1, :), 'r', 'DisplayName', 'X_est');
legend('show')