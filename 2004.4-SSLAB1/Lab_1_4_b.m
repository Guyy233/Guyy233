% Input
n = -5:9; % Range
x = heaviside(n); % Unit step u[n]

% System function
y = @(x) x + [x(2:end) 0]; % Output y[n] = x[n] + x[n+1]
% x(2:end): begins at the second element 
% 0:It takes the remainder of the x vector as its first part and adds a zero as the last element.

% Output
y_out = y(x);

% Plot the input and output signals
subplot(2,1,1);
stem(n, x);
title('Figure A. Input Signal (u[n])');
xlabel('n');
ylabel('x[n]');

subplot(2,1,2);
stem(n, y_out);
title('Figure B. Output Signal (y[n] = x[n] + x[n+1])');
xlabel('n');
ylabel('y[n]');
% Since the output has value where x less than 0, it can be obtained that the system is not causal.
