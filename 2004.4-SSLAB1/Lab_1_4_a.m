% Define the input signals
n = 0:10; % Define the range of n
x1 = [1 zeros(1, length(n)-1)]; % Define delta function
x2 = 2 * x1; 

% System function
y = @(x) sin((pi.*(x)/2));

% Output
y1 = y(x1);
y2 = y(x2); 

% Plot the input and output
subplot(2,1,1);
stem(n, x1,"filled"); 
hold on; 
stem(n, x2); 
hold off; 
title('Figure A. Input Signals');
legend('x_1[n] = \delta[n]', 'x_2[n] = 2\delta[n]');

subplot(2,1,2);
stem(n, y1,"filled"); 
hold on; 
stem(n, y2); 
hold off; 
title('Figure B. Output Signals');
legend('y_1[n] = sin(\pi/2*\delta[n])', 'y_2[n] = sin(\pi/2*2\delta[n])');

