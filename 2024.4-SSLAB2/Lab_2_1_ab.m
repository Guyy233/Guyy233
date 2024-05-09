% x[n]
n = 0:5;
x = ones(1, length(n)); 

% Perform convolution
y = conv(x, x);

% Find the non-zero samples of y
non_zero_indices = find(y); % Indices of non-zero samples
non_zero_samples = y(non_zero_indices); % Non-zero samples of y

% Construct the index vector ny
ny = non_zero_indices - 1; % Adjust indices for MATLAB's 1-based indexing

% Plot x[n]
subplot(2,1,1);
stem(n, x, 'filled');
title('Signal x[n]');
xlabel('n');
ylabel('x[n]');
axis([0 max(ny) 0 max(y)+1]);  % Set appropriate axis limits

% Plot the non-zero samples of y[n]
subplot(2,1,2);
stem(ny, non_zero_samples, 'filled');
title('Non-zero Samples of Convolved Signal y[n] = x[n] * x[n]');
xlabel('n');
ylabel('y[n]');
axis([0 ny(end) 0 max(non_zero_samples)+1]);  % Set appropriate axis limits



