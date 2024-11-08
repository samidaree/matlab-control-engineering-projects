% Paramètres du système
Te = 0.1;            % Pas d'échantillonnage en secondes
T_total = 10;        % Durée totale d'observation (en secondes)

% Valeurs de K
K_values = [16/(2+Te)^2];  % Valeurs de K à tester (modifié à K = 20 et K = 40)
labels = {'K = 20', 'K = 40'};  % Légendes pour les courbes

N = T_total / Te;    % Nombre d'échantillons
e_k = ones(1, N);    % Signal échelon d'amplitude unité (entrée)
s_k = zeros(2, N);   % Initialisation de la sortie s_k pour 2 valeurs de K
s_k_1 = zeros(1, 2); % Valeurs de s(k-1) pour chaque K
s_k_2 = zeros(1, 2); % Valeurs de s(k-2) pour chaque K
e_k_1 = 1;           % e(k-1) (signal échelon)
e_k_2 = 1;           % e(k-2) (signal échelon)

% Vecteur de temps
t = (0:N-1) * Te;    % Temps pour chaque échantillon

% Calcul de la sortie s_k en fonction de l'entrée e_k pour chaque K
for j = 1  % Parcourir les 2 valeurs de K
    K = K_values(j);  % Sélectionner la valeur de K
    for k = 3:N
        s_k(j, k) = 0.5 * (K * Te * (2 + Te) * e_k(k-1) + K * Te * (Te - 2) * e_k(k-2) ...
            - (K * Te * (2 + Te) - 4) * s_k_1(j) - (K * Te * (Te - 2) + 2) * s_k_2(j));

        % Mise à jour des valeurs précédentes pour s_k et e_k
        s_k_2(j) = s_k_1(j);
        s_k_1(j) = s_k(j, k);
        e_k_2 = e_k_1;
        e_k_1 = e_k(k);
    end
end

% Créer la figure avec deux sous-graphes
figure;

% Premier sous-graphe pour K = 20
plot(t, s_k(1,:), 'LineWidth', 1.5); % Réponse s_k pour K = 20
xlabel('Temps (s)');
ylabel('Amplitude');
title('Réponse indicielle pour K = Kc');
grid on;
axis([0 10 0 1.4]);        % Limites : [xmin xmax ymin ymax]
yticks = 0:0.2:1.4;        % Définition des graduations de l'axe des ordonnées
set(gca, 'ytick', yticks); % Appliquer les graduations à l'axe des ordonnées

% Appliquer les graduations à l'axe des ordonnées

% Ajuster la figure pour la meilleure présentation