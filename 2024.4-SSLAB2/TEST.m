% Define the range for n
n = 0:19;

% Initialize impulse responses and step responses
h1 = zeros(size(n));
h2 = zeros(size(n));
s1 = zeros(size(n));
s2 = zeros(size(n));

% Impulse signal delta[n]
delta = [1, zeros(1, 19)];

h1(1) = delta(1);
h2(1) = delta(1);

% System 1 step response using filter
a1 = [1, -3/5]; % Coefficients of y[n]
b1 = [1];  % Coefficients of x[n]
h1 = filter(b1, a1, delta);

% System 2 impulse response calculation
for i = 2:length(n)
    h2(i) = ((3/5)^(i)) * h2(i-1) + delta(i);
end


% Unit step
u = ones(size(n));

% System 1 step response using filter
s1 = filter(b1, a1, u);

% System 2 step response using loop
s2(1) = u(1); % Initial condition
for i = 2:length(n)
    s2(i) = (3/5)^(i) * s2(i-1) + u(i);
end

% Convolution of h1 and h2 with u to obtain z1 and z2
z1 = conv(h1, u);
z2 = conv(h2, u);

% Truncate z1 and z2 to match the length of n
z1 = z1(1:length(n));
z2 = z2(1:length(n));

% Plotting
figure;
subplot(2,1,1);
stem(n, s1,"filled");
hold on;
stem(n, z1, 'r');
title('System 1 Step Response and Convolution of Impulse Response with Step Function');
legend('s1', 'z1');
hold off;

subplot(2,1,2);
stem(n, s2);
hold on;
stem(n, z2, 'r');
title('System 2 Step Response and Convolution of Impulse Response with Step Function');
legend('s2', 'z2');
hold off;
