clear all;
close all ;
clc ;

w = logspace(-3,6)

K = 43;
bode([K], [1 11 10 0],w)

w = [0:0.001:1]

indice = find(atan(w) + atan(w/10) > pi/6, 1) ;
disp(['w_0 = ', num2str(w(indice)), ' rad/s'])
wc0 = w(indice) ;
%wc0 = 0.572 ; %rad/s
K = abs(j*wc0 + (j*wc0 +1)+ (j*wc0 +10));
%K = 5.75 ;
w = logspace(-3,6)
nyquist([11.4], [1 11 10 0],w);