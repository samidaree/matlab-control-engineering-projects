clear all
close all
clc

% Constants
erg = 5; % Efficiency
Te = 1; % Time step
glune = 1.6; % Reduced Lunar gravity
y0 = 100; % Increased initial height
vy0 = 0; % Initial vertical velocity
vx0 = 1000; % Initial horizontal velocity (set to 0, can be changed)
N = 25; % Number of time steps

% Matrices for state-space representation
A = [1 Te 0 0;   % Updated state transition matrix for 2D motion
    0 1 0 0;
    0 0 1 Te;
    0 0 0 1];  % Updated A matrix to include horizontal motion

B = [0.5 * erg * Te^2;
    erg * Te;
    0;           % No control input for horizontal velocity
    0];          % No control input for horizontal velocity

C = [1 0 0 0]; % Output matrix (extract y position from state vector)

% Initializing state and output
X = zeros(4, N); % State vector: [y; vy; x; vx]
Y = NaN(1, N); % Output: y position, initialized to NaN (so no values are plotted initially)
%ay = 0.16 * ones(1, N); % Initialize ay to 3.2 for all time steps
ay = zeros(1, N); % Initialize ay to 0 for all time steps

% Initial conditions
X(:, 1) = [y0; vy0; 0; vx0]; % Initial state: [y0; vy0; x0; vx0]
Y(1) = NaN; % Set the first value to NaN to hide it in the plot

% Define the observer gain L (as provided: [0.9, 0.6])
L = [0.9; 0.6; 0; 0]; % Gain vector for observer

% Initializing the estimated state
X_hat = zeros(4, N); % Estimated state: [y_hat; vy_hat; x_hat; vx_hat]
X_hat(:, 1) = [0; vy0; 0; vx0]; % Initial estimated state is the same as the real state
Y_hat = NaN(1, N); % Estimated y position

% Simulation loop
for k = 1:N-1
    % Compute next real state using state-space equation
    X(:, k+1) = A * X(:, k) + B * (ay(k) - glune / erg);

    % Compute output (real y position)
    Y(k+1) = C * X(:, k+1);

    % Set negative values of Y to NaN (so they won't be plotted)
    if Y(k+1) < 0
        Y(k+1) = NaN;
    end

    % Compute next estimated state using the observer equation
    X_hat(:, k+1) = A * X_hat(:, k) + B * (ay(k) - glune / erg) + L * (Y(k+1) - C * X_hat(:, k));

    % Compute output (estimated y position)
    Y_hat(k+1) = C * X_hat(:, k+1);

    % Set negative values of Y_hat to NaN (so they won't be plotted)
    if Y_hat(k+1) < 0
        Y_hat(k+1) = NaN;
    end
end

% Plot the results
plot(1:N, Y, 'g', 'DisplayName', 'Trajectoire réelle');
hold on;
plot(1:N, Y_hat, 'b--', 'DisplayName', 'Trajectoire estimée (Observateur)');
xlabel('N');
ylabel('Position Y');
title('Évolution du Lunar Lander avec Observateur');
legend;
grid on;
