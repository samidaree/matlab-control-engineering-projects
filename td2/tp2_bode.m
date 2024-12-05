clear all;
close all ;
clc ;

K = 2;
w = logspace(-3,6)
bode([K], [1 1], w)

bode([K], [1 (1+10^4) 1],w)

bode([1,100], [1,10^4,0],w)

% Pente de -20dB/decade entre 10^-3 et 10^3, ce qui confirme un comportement integrateur dans cette bande de fréquence
bode([1,0], [1,10001,100], w)

lim1 = log(2*pi*10^-6)
lim2 = log(2*pi*10^6)
a = 0.1, b= 10^3
bode(1,[1, a+b, a*b, 0], logspace(lim1,lim2))

bode(1, [1 1000.1 100 0], logspace(lim1,lim2))