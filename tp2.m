clear all;
close all ;
clc ;

f=logspace(-4,4) * 20 ;
W = 2*pi*f;
p = j*W;
Gp = (1+p) ./ (p.*p);
semilogx(f,Gp);
% semilogx(f,20*log10(abs(Gp)));
% discret
fe = 100;
Te = 1/fe;
z =exp(p*Te);
%Gz = 10*Te^2./(z.^(-2) - (10*Te+2)*z.^(-1) + 10*Te+1);

Gz = Te.*(z.*(2+Te)+Te-2)./2.*(z-1).^2;
hold on ; %superposer les courbes
semilogx(f,Gz,'or');
% semilogx(f,20*log10(abs(Gz)),'or');
grid
xlabel('f(Hz)');
ylabel('G(dB)');
title('G(f)');

% ex5
K = 0:0.1:100;
Te= 0.1 ;
b = (K.*Te).*((2+Te)-4)
delta = (K.*Te.^2).*(K.*((2+Te).^2) - 16)
r1 = abs((-b + sqrt(delta))./(4))
r2 = abs((-b - sqrt(delta))./(4))
% Plot r1 and r2 against K
figure;  % Create a new figure
plot(K, r1, 'b-', 'DisplayName', 'r1');  % Plot r1 in blue
hold on;  % Hold the current plot
plot(K, r2, 'r-', 'DisplayName', 'r2');  % Plot r2 in red
hold off;  % Release the hold

% Add labels and title
xlabel('K');  % Label for the x-axis
ylabel('r1 and r2');  % Label for the y-axis
title('Plot of r1 and r2 against K');  % Title of the plot
legend show;  % Show legend
grid on;

%9
% nombre d'echantillons N = T / Te+1 = 10/0.1+1 = 101

N =101
% a la periode -Te toutes les sorties sont nulles
Te = 0.1;
K = 2;
s = zeros(1,N);
e = ones (1,N);

%initialisation
s(1) = 0.2;
%s(2) = (1/2) *(((K*Te)*(2+Te)*e(1)) - (((K*Te)*(2+Te)-4)*s(1)));
s(2) = 0.39
for k=3:N
    s(k) = (1/2)*(((K*Te)*(2+Te)*e(k-1)) + ((K*Te)*(Te-2)*e(k-2)) - (((K*Te)*(2+Te)-4)*s(k-1)) - (((K*Te)*(Te-2)+2)*s(k-2)));
end

%affichage
stem(s)
hold on
stem(e)
xlabel("Temps [unite de Te]")
ylabel("s[k]")
title("101 premiers echantillons de s")

%11
% nombre d'echantillons N = T / Te+1 = 10/0.1+1 = 101

N =101
% a la periode -Te toutes les sorties sont nulles
Te = 0.1;
K = 2;
s = zeros(1,N);
e = 0:N-1;

%initialisation
s(1) = 0.2;
%s(2) = (1/2) *(((K*Te)*(2+Te)*e(1)) - (((K*Te)*(2+Te)-4)*s(1)));
s(2) = 0.39
for k=3:N
    s(k) = (1/2)*(((K*Te)*(2+Te)*e(k-1)) + ((K*Te)*(Te-2)*e(k-2)) - (((K*Te)*(2+Te)-4)*s(k-1)) - (((K*Te)*(Te-2)+2)*s(k-2)));
end

%affichage
stem(s)
hold on
stem(e)
xlabel("Temps [unite de Te]")
ylabel("s[k]")
title("101 premiers echantillons de s")