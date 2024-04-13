%
% 1.8 (a)
%

syms t;
x1 = cos(pi*t/5);
x2 = sin(pi*t/5);
x3 = exp(1i*2*pi*t/3)+exp(1i*pi*t/3);

%
% 1.8 (b)
%

% x1(t)
figure;
ezplot(x1);
title('x1(t) = cos(pi*t/5)');
xlabel('t');
ylabel('x1');

% x2(t)
figure;
ezplot(x2);
title('x2(t) = sin(pi*t/5)');
xlabel('t');
ylabel('x2');

% x3(t)
x3_real = real(x3);
x3_imag = imag(x3);

figure;
ezplot(x3_real);
title('Real Part of x3(t)');
xlabel('t');
ylabel('Re(x3)');

figure;
ezplot(x3_imag, [0, 6*pi]);
title('Imaginary Part of x3(t)');
xlabel('t');
ylabel('Im(x3)');

%
% 1.8 (c)
%

syms a;

E1 = int(abs(x1)^2,t,-a,a);
E2 = int(abs(x2)^2,t,-a,a);
E3 = int(abs(subs(x3,'1i','-1i'))^2,t,-a,a);

disp('Energy expression for x1(t):');
pretty(E1);
disp('Energy expression for x2(t):');
pretty(E2);
disp('Energy expression for x3(t):');
pretty(E3);

%
% 1.8 (d)
%

E1_T = subs(E1,a,5);
E2_T = subs(E2,a,5);
E3_T = subs(E3,a,1.5);
disp('In one period, E_T for x1(t):');
pretty(E1_T);
disp('In one period, E_T for x2(t):');
pretty(E2_T);
disp('In one period, E_T for x3(t):');
pretty(E3_T);

A = linspace(0.1,30,20);
e1 = subs(E1,a,A);
e2 = subs(E2,a,A);
e3 = subs(E3,a,A);

figure;
subplot(2,2,1);
stem(A, e1); 
title('In [0.1,30], E1');
subplot(2,2,2);
stem(A, e2); 
title('In [0.1,30], E2');
subplot(2,2,3);
stem(A, e3); 
title('In [0.1,30], E3');


%
% 1.8 (e)
%

syms T;

T1 = 10 ; T2 = 3 ;

P1 = E1/(2*a) ;
P2 = E2/(2*a);
P3 = E3/(2*a);

P1_T = E1_T / T1 ;
P2_T = E2_T / T1 ;
P3_T = E3_T / T2 ;


B = linspace(0.1,60,30);
p1 = subs(P1,a,B);
p2 = subs(P2,a,B);
p3 = subs(P3,a,B);

% plot
figure;
subplot(3,1,1);
stem(B, p1); 
title('Pa1 for [0.1, 60]');
xlabel('a');
ylabel('P1');

subplot(3,1,2);
stem(B, p2); 
title('Pa2 for [0.1, 60]');
xlabel('a');
ylabel('P2');

subplot(3,1,3);
stem(B, p3); 
title('Pa3 for [0.1, 60]');
xlabel('a');
ylabel('P3');

%
% 1.8 (e)
%

P_Total = P1 + P2;
P_Sim = simplify(P_Total);
disp('Energy expression for P1+P2:');
pretty(P_Sim);
