% Define the index
nx = -3:7;

% Initialize x[n]
x = zeros(size(nx));
x(nx == 0) = 2;  
x(nx == 2) = -1;
x(nx == 3) = 1;
x(nx == 4) = 3; 

% Define the nyi
ny1 = nx+2 ;
ny2 = nx-1 ;
ny3 = -nx ;
ny4 = -nx + 1;

% Plot the original signal x[n] and the transformed signals y1 to y4
subplot(2,3,1);
stem(nx, x);
title('Figure A. Original x[n]');
xlabel('n');
ylabel('Amplitude');

% We can just shift or flip the X-axis to get closer to the principle.
% Let me show below
subplot(2, 3, 2);
stem(ny1, x);
title('Figure B. y1[n] = x[n - 2]');
xlabel('n');
ylabel('Amplitude');

subplot(2, 3, 3);
stem(ny2, x);
title('Figure C. y2[n] = x[n + 1]');
xlabel('n');
ylabel('Amplitude');

subplot(2, 3, 4);
stem(ny3, x);
title('Figure D. y3[n] = x[-n]');
xlabel('n');
ylabel('Amplitude');

subplot(2, 3, 5);
stem(ny4, x);
title('Figure E. y4[n] = x[1 - n]');
xlabel('n');
ylabel('Amplitude');

% Adjust subplot layout
sgtitle('Lab 1.3(a)(b)(c)');
