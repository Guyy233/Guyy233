% Define the input signal
n = 0:50; % Define the range of n
x = exp(-n);

% Define the system function
y = @(x) log(x); % Output y[n] = log(x[n])

% Calculate the output
y_out = y(x);

% Plot the input and output signals
subplot(2,2,1);
stem(n, x);
title('Figure A1. (0,50) Input x[n]=exp(-n)');

subplot(2,2,2);
stem(n, y_out);
title('Figure A2. (0,50) Output y[n] = log(x[n])=-n');

n = 0:100;
x1 = exp(-n);
y_out1 = y(x1);

subplot(2,2,3);
stem(n, x1);
title('Figure B1. (0,100) Input x[n]=exp(-n)');

subplot(2,2,4);
stem(n, y_out1);
title('Figure B2. (0,100) Output y[n] = log(x[n])=-n');


% x[n] bounded but y[n] is not limited. So not stable