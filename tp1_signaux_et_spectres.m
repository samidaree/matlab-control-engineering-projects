%% Exercice 3a
t=[0:1:100];
K=100;
T=10;
s=K.*(1-exp(-t/T));
plot(t,s)
xlabel('temps (s)')
ylabel('amplitude (ua)')
title('Réponse indicielle')
grid
%% Exercice 4a
% 1ère partie
f=[-5:0.01:5]+eps;  % pour éviter une division par zéro au niveau du calcul de S
a=0.5;
A=1;
S=A*sin(2*pi*f*a)./(pi*f);
subplot(2,1,1)
plot(f,abs(S))
xlabel('fréquence (Hz)')
ylabel('module (ua)')
title('Spectre de la fonction porte')
grid
subplot(2,1,2)
plot(f,angle(S))
xlabel('fréquence (Hz)')
ylabel('module (ua)')
grid
% 2ème partie
tau=1;
retard=exp(j*2*pi*f*tau);
subplot(2,1,1)
plot(f,abs(retard.*S))
xlabel('fréquence (Hz)')
ylabel('module (ua)')
title('Spectre de la fonction porte')
grid
subplot(2,1,2)
plot(f,angle(retard.*S))
xlabel('fréquence (Hz)')
ylabel('module (ua)')
grid

