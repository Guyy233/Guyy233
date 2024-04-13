n = 0:31 ;

X_1 = sin (pi * n / 4).*cos (pi * n / 4) ;
X_2 = cos (pi * n / 4).^2 ;
X_3 = sin (pi * n / 4).*cos (pi * n / 8) ;


% plot them in 3*1

% For X_1
subplot(3,1,1);
stem(n,X_1);
title('Figure A. X1[n]=sin (pi*n/4).*cos (pi*n/4)');
xlabel('n');
ylabel('Amplitude');

% For X_2
subplot(3,1,2);
stem(n,X_2);
title('Figure B. X2[n]=sin (pi*n/4).^2');
xlabel('n');
ylabel('Amplitude');

% For X_3
subplot(3,1,3);
stem(n,X_3);
title('Figure C. X1[n]=sin (pi*n/4).*cos (pi*n/8)');
xlabel('n');
ylabel('Amplitude');