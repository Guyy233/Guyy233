% Use ustep() defined in ustep.m
u10 = ustep(0:9, -10);
u = ustep(0:9, 0);

% Initialize the impulse response h
h = zeros(1,10);
for n = 1:10
    h(n) = 0.9^(n-1) * (u(n) - u10(n));
end

% Initialize the input signal x
x = zeros(1,100);
for n = 1:100
    x(n) = cos((n-1)^2) * sin(2*pi*(n-1)/5);
end

% Convolve the impulse response h with the input signal x to obtain y, where
% y spans from 0 to 108 due to convolution operation.
y = conv(h, x);

% Extract the subset of y to ensure the range 0 <= n <= 99.
y = y(:, 1:100);

% Plot y[n] from 0 to 99.
figure;
stem(0:99, y, 'r:');
xlabel('n'); ylabel('y[n]');
hold on;
title('Red for normal convolution');

% Split x into two blocks x0 and x1
x0 = zeros(1,50);
for n = 1:50
    x0(n) = cos((n-1)^2) * sin(2*pi*(n-1)/5);
end

x1 = zeros(1,50);
for n = 1:50
    x1(n) = cos((n+50-1)^2) * sin(2*pi*(n+50-1)/5);
end

% Convolve h with x0 and x1
y0 = conv(h, x0);
y0 = [y0, zeros(1,50)];

y1 = conv(h, x1);
y1 = [zeros(1,50), y1];

% block convolution
yb = y0 + y1;

% 0 <= n <= 99.
yb = yb(:, 1:100);

% Plot yb[n]
stem(0:99, yb, 'b.-');
xlabel('n'); ylabel('y[n]');
title('Red for normal conv while blue for block conv');

% Prepare for plotting the results
figure;

% Plot the input signal x[n]
subplot(2,2,1);
stem(0:99, x, 'filled');
xlabel('n'); ylabel('x[n]');
title('Input signal x[n]');

% Plot the impulse response h[n]
subplot(2,2,2);
stem(0:9, h, 'filled');
xlabel('n'); ylabel('h[n]');
title('Impulse response h[n]');

% Plot y0[n]
subplot(2,2,3);
stem(0:99, y0(1:100), 'filled');
xlabel('n'); ylabel('y0[n]');
title('Block convolution result y0[n]');

% Plot y1[n]
subplot(2,2,4);
stem(0:99, y1(1:100), 'filled');
xlabel('n'); ylabel('y1[n]');
title('Block convolution result y1[n]');
