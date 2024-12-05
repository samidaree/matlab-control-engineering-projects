clear all
close all
clc

K = [0.5 1 1.5];
tau = 0.5;
% Fonction de transfert
for i=1:3
    F = tf(K(i), [tau 1]);
    step(F)
    % to display all the plots on the same figure
    hold on
    % Ligne de longeur 4.5 en abscisse
    line([0 4.5], [0.95*K(i) 0.95*K(i)], 'Color', 'red', 'LineStyle', '--')
end

grid
hold off