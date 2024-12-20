% Exercise 2 - a

% Représenter graphiquement 32 échantillons du signal de sortie pour un 
% signal d’entrée de type échelon unité

N = 32;
k = [1:N];
s = zeros(1,N);
e = ones(1,N);
s(1)=1; % Initialisation
% Fonction anonyme permettant d’avoir des indices n´egatifs (buffer circulaire)
% On ´evite ainsi d’avoir `a calculer aussi s(2)
wrapN = @(i,N)(1+mod(i-1,N));
for k=2:N
s(k) = e(k)-e(wrapN(k-1,N))+0.25*s(wrapN(k-1,N))-0.25*s(wrapN(k-2,N));
end
figure
stem(s)
xlabel("Temps [unit´e de Te]")
ylabel("s[k]")
title("32 premiers echantillons de s")

% Exercice 2 - b 
%Tracer la réponse pour l’intervalle de fréquence réduite [0, π].

% La reponse frequentielle de la fonction de transfert s’obtient en posant z = e(jωTe) et en calculant |G(ω)|
fe=1;
Te = 1/fe;
w=[0:pi*fe/100:pi*fe];
G = sqrt(0.24*cos(w*Te)+0.25);
figure
plot(w/pi,G)
xlabel("pulsation reduite [1/pi]");
ylabel("reponse en frequence");
title("reponse en frequence");

% Exercice 3 

%Tracer le spectre de la fonction de transfert du système à temps continu pour
% une fréquence maximale de 20 kHz et superposer le spectre de la transformée
% de Fourier discrète de la fonction de transfert du système échantillonné. 

%Pour tracer le spectre de G(z), on notera comme pour la reponse frequentielle z = exp(jωTe) et on veillera 
% a respecter la condition de Shannon-Nyquis 
f=logspace(-4,3,100)*20;
w= 2*pi.*f;
p = 1j*w;
Gp = 10./(p.*(p+10));
figure
semilogx(f,20*log10(abs(Gp)))
fe = 2.*max(f);
Te = 1/fe;
% z = exp(jwTe) 
z=exp(p*Te);
Gz = 10*Te^2./(z.^(-2)-(10*Te+2)*z.^(-1)+10*Te+1);
hold on
semilogx(f,20*log10(abs(Gz)),"or")
grid
xlabel("frequence [Hz]")
ylabel("Spectre [dB]")
title("Spectres continu et discret (3.a)")
axis([0.001 20000 -200 50])


%Exercice 4 
% Tracer, les 32 premiers échantillons de sortie lorsque l’entrée est un échelon unitaire
% en superposant K = 1 et K = 2
 N = 32;
Te = 0.1;
k = [1:N];
s1 = zeros(1,N);
s2 = zeros(1,N);
e = ones(1,N+2);
e(N+1) = 0;
e(N+2) = 0;
% Fonction anonyme permettant d’avoir des indices n´egatifs (buffer circulaire)
% On ´evite ainsi d’avoir `a calculer aussi s(2)
wrapN = @(i,N)(1+mod(i-1,N));
for k=1:N
s1(k) = 0.16*e(wrapN(k-2,N+2)) + 1.6*s1(wrapN(k-1,N)) - 0.8*s1(wrapN(k-2,N));
s2(k) = 0.32*e(wrapN(k-2,N+2)) + 1.6*s2(wrapN(k-1,N)) - 0.96*s2(wrapN(k-2,N));
end
figure
stem(s1)
hold on
stem(s2,"r")
xlabel("Echantillons")
ylabel("s[k]")
title([num2str(N),"premiers echantillons de s"])
legend("K=1","K=2")

% temps de montee : le temps nécessaire pour qu’elle passe de 10 % à 90 % de la valeur finale
% On lit graphiquement temps de montee pour K = 1 : 0.6s et pour K = 2 : 0.4s
% depassement : (valeur maximale - valeur finale / valeur finale) x 100 
% K = 1 : (1.2 - 1 / 1.2) x 100 = 20% 
% K = 2 : (1.75 - 1 / 1.75) x 100 = 75% 