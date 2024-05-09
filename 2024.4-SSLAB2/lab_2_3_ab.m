% Define the system coefficients for both a and b
a = [1 0.5]; % dy(t)/dt = -2y(t) + x(t)
b = [1];     % Coefficient for input x(t) in the differential equation

% Time vectors
t_a = 0:0.5:10;
t_b = 0:1:10;

% Define the input signal for task a
x_a = t_a >= 2; % Unit-step function delayed by 2 units of time

% Simulate system response for task a using lsim
y_a = lsim(b, a, x_a, t_a);

% Plot the response for task a
plot(t_a, y_a, 'b--'); % Plot with blue dashed line
xlabel('t');
ylabel('s(t)');
title('System Response to u(t-2)');

% Define the input signal for task b (unit step function)
x_b = ones(1, length(t_b));

% Compute the step and impulse responses for task b
s_b = step(b, a, t_b);
h_b = impulse(b, a, t_b);

% Simulate system response for task b using lsim
sl_b = lsim(b, a, x_b, t_b);

figure; % Open a new figure window for the impulse responses

% Plot the step response and lsim response for task b
subplot(2, 1, 1); % Create subplot 2 of 2
plot(t_b, s_b, 'r', t_b, sl_b, 'b--'); % Red for step response, blue dashed for lsim
xlabel('t');
ylabel('s(t)');
title('Red for step response, Blue dashed for lsim response');

% Plot the impulse response and real impulse response for task b
subplot(2, 1, 2); % Create subplot 1 of 2
hr_b = t_b .* exp(-0.5 .* t_b); % Real impulse response from the derivative of s(t)
plot(t_b, h_b, 'r', t_b, hr_b, 'b--'); % Red for impulse response, blue dashed for real impulse response
xlabel('t');
ylabel('h(t)');
title('Red for impulse response, Blue dashed for real impulse response');

