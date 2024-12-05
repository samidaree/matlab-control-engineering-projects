% Parameters
alpha = 1/1000;
K = 100;
p0 = 1;
p1 = 2;

t = 0:100:10000;

y = alpha * K * (1/(p0*p1) + exp(p0*t)./(p0*(-p1+p0)) + exp(p1*t)./(p1*(-p0+p1)));

% Plot the signal
figure;
plot(t, y);
xlabel('temps (s)');
ylabel('y(t)');
title('Signal y(t)');
grid on;