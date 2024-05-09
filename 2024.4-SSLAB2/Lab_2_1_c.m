% x[n]
n_x = 0:5;
x = ones(1, length(n_x));  % x[n] is 1 for 0 <= n <= 5

% h[n] for 0 <= n <= 5
h = n_x;  % h[n] = n for 0 <= n <= 5

% Perform convolution of x[n] with h[n]
y = conv(x, h);

% Define the time index for y[n] after convolution
n_y = 0:(length(y)-1);

% Noncausal h[n+5], shifted to the right by 5 units
h_2 = [zeros(1,5), h];  % Prepend five zeros to shift h to the right

% Perform convolution of x[n] with noncausal h[n+5]
y2 = conv(x, h_2);
n_y2 = 0:(length(y2)-1);  % Start at 0 because MATLAB indexing starts at 1

% Plotting
figure;

% Plot x[n]
subplot(2, 2, 1);
stem(n_x, x, 'filled');
title('Signal x[n]');
xlabel('n');
ylabel('x[n]');
axis([n_y2(1) n_y2(end) 0 max(x)+1]);

% Plot h[n]
subplot(2, 2, 2);
stem(n_x, h, 'filled');
title('Signal h[n]');
xlabel('n');
ylabel('h[n]');
axis([n_y2(1) n_y2(end) 0 max(h)+1]);

% Plot the convolved signal y[n] (causal)
subplot(2, 2, 3);
stem(n_y, y, 'filled');
title('Convolved Signal y[n] = x[n] * h[n] (Causal)');
xlabel('n');
ylabel('y[n]');
axis([n_y2(1) n_y2(end) 0 max(y)+1]);

% Plot the convolved signal y2[n] (noncausal)
subplot(2, 2, 4);
stem(n_y2-10, y2, 'filled');  % Subtract 5 to align with the noncausal system
title('Convolved Noncausal Signal y2[n] = x[n] * h[n+5]');
xlabel('n');
ylabel('y2[n]');
axis([n_y2(1)-5 n_y2(end)-5 0 max(y2)+1]);  % Adjust axis limits for the shift
