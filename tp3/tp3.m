clear all
close all
clc

% Constants
erg = 0.5; % Efficiency
Te = 0.5; % Time step
glune = 1.6; % Reduced Lunar gravity
y0 = 15; % Increased initial height
vy0 = 0; % Initial vertical velocity
N = 25; % Number of time steps

% Matrices for state-space representation
A = [1 Te; 0 1]; % State transition matrix
B = [0.5 * erg * Te^2; erg * Te]; % Control input matrix
C = [1 0]; % Output matrix (extract y position from state vector)

% Initializing state and output
X = zeros(2, N); % State vector: [y; vy]
Y = zeros(1, N); % Output: y position
ay = zeros(1, N); % Vertical acceleration (controlled)

% Initial conditions
X(:, 1) = [y0; vy0]; % Initial state: [position y0; velocity 0]

% Simulation loop
for k = 1:N-1
    % Compute next state using state-space equation
    X(:, k+1) = A * X(:, k) + B * (ay(k) - glune / erg);
    % Compute output (y position)
    Y(k+1) = C * X(:, k+1);
end

% Plot the results
plot(1:N, Y, 'g');
xlabel('Step');
ylabel('Y position');
title('Évolution du Lunar Lander selon la représentation d\état');
grid on;
