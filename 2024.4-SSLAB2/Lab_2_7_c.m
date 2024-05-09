% Define the range of n for x[n] and h[n]
n_x = 0:24;
n_h = 0:14;

% Define x[n] using the given expression
x = (1/2).^(n_x-2) .* (n_x >= 2);

% Define the unit step function for h[n]
unit_step = @(n) n >= 0;

% Define h[n] using the given expression
h = unit_step(n_h + 2);

% Compute the convolution of x[n] and h[n]
y = conv(x, h);

% Determine the proper time indices for y
% Since the unit step in x[n] starts at n=2 and in h[n] at n=-2 (effectively 0 in MATLAB),
% the result y[n] should start from n_x(1) + (n_h(1)-2).
n_y = (n_x(1) + n_h(1)):(n_x(end) + n_h(end));

% Plotting
figure;

% Plot x[n]
subplot(3, 1, 1);
stem(n_x, x, 'filled');
title('Input Signal x[n] = (1/2)^(n-2)u[n-2]');
xlabel('n');
ylabel('x[n]');
axis([n_y(1) n_y(end) 0 max(x)+1]);

% Plot h[n]
subplot(3, 1, 2);
stem(n_h, h, 'filled');
title('Impulse Response h[n] = u[n+2]');
xlabel('n');
ylabel('h[n]');
axis([n_y(1) n_y(end) 0 max(h)+1]);

% Plot y[n]
subplot(3, 1, 3);
stem(n_y, y, 'filled');
title('Convolved Signal y[n] = h[n] * x[n]');
xlabel('n');
ylabel('y[n]');
axis([n_y(1) n_y(end) 0 max(y)+1]);
