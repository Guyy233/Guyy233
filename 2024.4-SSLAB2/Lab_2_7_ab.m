% Define the indices for h[n] and x[n]
a = 0;  % Start index for h[n]
b = 1;  % End index for h[n] (N-1 where N is the length of h)
c = 0;  % Start index for x[n]
d = 1;  % End index for x[n] (M-1 where M is the length of x)

% Define the range of n for h[n] and x[n]
nh = a:b;  % Time indices for h[n]
nx = c:d;  % Time indices for x[n]

% Define h[n] and x[n] using delta function properties
h = (nh == a) + (nh == b);
x = (nx == c) + (nx == d);

% Perform convolution of h[n] and x[n]
y = conv(h, x);

ny = (a + c):(a + c + length(y) - 1);

% Plotting
figure;

% Plot h[n]
subplot(3, 1, 2);
stem(nh, h, 'filled');
title('Impulse Response h[n]');
xlabel('n');
ylabel('h[n]');
axis([ny(1) ny(end) min(h)-1 max(h)+1]);  % Set axis limits

% Plot x[n]
subplot(3, 1, 1);
stem(nx, x, 'filled');
title('Input Signal x[n]');
xlabel('n');
ylabel('x[n]');
axis([ny(1) ny(end) min(x)-1 max(x)+1]);  % Set axis limits

% Plot y[n]
subplot(3, 1, 3);
stem(ny, y, 'filled');
title('Convolved Signal y[n]');
xlabel('n');
ylabel('y[n]');
axis([ny(1) ny(end) min(y)-1 max(y)+1]);  % Set axis limits
