clear all;
close all ;
clc ;

N = 32
% a la periode -Te toutes les sorties sont nulles
s = zeros(1,N);
e = ones (1,N);

%initialisation
s(1) = e(1);
s(2) = e(2) + 0.5*s(1);
for k=3:N
    s(k) = e(k)- e(k-1) + 0.25*s(k-1) - 0.25*s(k-2);
end

%affichage
stem(s)

%2_b
W=[0:pi/100:pi];
G = abs(0.3*exp(-j*W) + 0.4  )
plot (W,G);
clear all;
close all ;
clc ;



f=logspace(-4,4) * 20 ;
W = 2*pi*f;
p = j*W;
Gp = 10 ./ (p.*(p+10));
semilogx(f,20*log10(abs(Gp)));
% discret
fe = 10000;
Te = 1/fe;
z =exp(p*Te);
Gz = 10*Te^2./(z.^(-2) - (10*Te+2)*z.^(-1) + 10*Te+1);
hold on ; %superposer les courbes
semilogx(f,20*log10(abs(Gz)),'or');
grid
xlabel('f(Hz)');
ylabel('G(dB)');
title('G(f)');

% ex4
N = 32 ;
K = 1 ;
indice = 0 :31 ;

s = zeros(1,N)
e = ones(1,N) ;

s(1) = 0
s(2) = 0

for k = 3:N
    s(k) = 0.16*K*e(k-2) + 1.6*s(k-1) - (0.16*K + 0.64) *s(k-2)
end

stem(indice,s)
