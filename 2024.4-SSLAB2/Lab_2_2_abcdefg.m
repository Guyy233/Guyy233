%a
a1 = [1];b1 = [0.5 1 2];

%b
a2 = [1,-0.8];b2 = [2];

%c
a3 = [1,-0.8];b3 = [0,2];

%d
x = [1 2 3 4];
y1 = filter(b1,a1,x);
y2 = filter(b2,a2,x);
y3 = filter(b3,a3,x);
disp('System 1 response (y1):');
disp(y1);
disp('System 2 response (y2):');
disp(y2);
disp('System 3 response (y3):');
disp(y3);

%e
x = ones(1,6);
h = [0:5];

%f
figure(1);
b = h;a = [1];
ny = [0:5];
y = filter(b,a,x);
stem(ny,y);xlabel('n');ylabel('y[n]');
title('Impulse response of the system using filter function');

%g
figure(2);
x2 = [x, zeros(1,5)];
y2 = filter(b,a,x2);
stem([0:10],y2);xlabel('n');ylabel('y[n]');
title('System response with zero-padding using filter function');