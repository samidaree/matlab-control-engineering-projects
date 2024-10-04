clear all;
close all;
clc;

K = 1;
m = [0.3 0.5 0.714 1 1.3];
Wn = 10;

for i=1:5
    F = tf(K,[1/Wn^2 2*m(i)/Wn 1] );
    step(F)
    hold on
end

legend('m=0.3', 'm=0.5', 'm=0.714', 'm=1', 'm=1.3')
line([0 4.5], [0.95*K 0.95*K], 'Color', 'red', 'LineStyle', '--')
line([0 4.5], [1.05*K 1.05*K], 'Color', 'red', 'LineStyle', '--')
grid