clear all
close all
clc

a =19.739
w0 = sqrt(2*a)
u1_0 =0
u1_0_point = 1
u2_0 = 0
u2_0_point = 1
t=0:0.01:10
u1 = u1_0_point*t + u1_0
u2 = u2_0 * cos(w0*t) + u2_0_point * sin(w0*t)
teta1 = u1 + u2
teta2 = u1 - u2

title('u1')

plot(t, u1, 'r', 'DisplayName', 'u1') % Red color for u1
hold on
title('u1 et u2')
plot(t, u2, 'b', 'DisplayName', 'u2') % Blue color for u2
% question g
plot(t, teta1, 'g', 'DisplayName', 'teta1') % Green color for teta1
plot(t,teta2, 'y', 'DisplayName', 'teta2') % Yellow color for teta2
legend('show')
xlabel('temps')
hold off

% question f
clear all
close all
clc

a =19.739
w0 = sqrt(2*a)
u1_0 =0
u1_0_point = 1
u2_0 = 0
u2_0_point = 0
t=0:0.01:10
u1 = u1_0_point*t + u1_0
u2 = u2_0 * cos(w0*t) + u2_0_point * sin(w0*t)
teta1 = u1 + u2
teta2 = u1 - u2

title('u1')

plot(t, u1, 'r', 'DisplayName', 'u1') % Red color for u1
hold on
title('u1 et u2')
plot(t, u2, 'b', 'DisplayName', 'u2') % Blue color for u2
plot(t, teta1, 'g', 'DisplayName', 'teta1') % Green color for teta1
plot(t,teta2, 'y', 'DisplayName', 'teta2') % Yellow color for teta2
legend('show')
xlabel('temps')
hold off
% COmme les conditions initiales etaient juste un demarge en vitesse au milieu de la barre, u1 + u2 = 0, ca va entre les 2 barres dans un mo9uvement moyen similaire et causer un decalage temporaire