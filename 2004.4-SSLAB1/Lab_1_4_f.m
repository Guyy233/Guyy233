% Input
n = -10:10; % Define the range of n

% System function
y = @(x) x .* n; % Output y[n] = nx[n]

% Not stable and Time-variant
x1 = ones(size(n)); 
y1 = y(x1);
% Plot
subplot(2,2,1);
stem(n, x1); 
title('(Time-variant and Not stable) x[n]=1');
subplot(2,2,2);
stem(n, y1); 
title('Output y[n]=nx[n]');

disp('Not Time-invariant because even if the input x is constant, y are different at different time n');
disp('Not stable because y is not limited with bounded x');



% Not invertible
x2 = n;
y2 = y(x2);
% Plot
subplot(2,2,3);
stem(n, x2); 
title('(Not invertible) x[n]=1');
subplot(2,2,4);
stem(n, y2); 
title('Output y[n]=nx[n]');

disp('Since y may still have the same value at different x, the system is not invertible');

