x1 = [ones(1,5), zeros(1,5)];
nx1 = 0:9; 

h1 = [1 -1 3 1 0];
nh1 = 0:4;

h2 = [2 5 4 -1 0];
nh2 = 0:4;

figure(1);
subplot(3,1,1);
stem(nx1, x1);
xlabel('n');
ylabel('x1[n]');
title('Signal x1[n]');

% Plot h1
subplot(3,1,2); 
stem(nh1, h1);
xlabel('n');
ylabel('h1[n]');
title('Signal h1[n]');

% Plot h2
subplot(3,1,3); 
stem(nh2, h2);
xlabel('n');
ylabel('h2[n]');
title('Signal h2[n]');

% convolution part
figure(2);
w = conv(x1,h1);
yd1 = conv(w,h2);
hs = conv(h1,h2);
yd2 = conv(hs,x1);

% yd1
subplot(2,1,1);
stem([0:length(yd1)-1], yd1);
xlabel('n');
ylabel('yd1[n]');
title('Signal yd1[n]');

% Plot h1
subplot(2,1,2); 
stem([0:length(yd2)-1], yd2);
xlabel('n');
ylabel('yd2[n]');
title('Signal yd2[n]');