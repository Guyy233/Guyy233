%1.6(a)
syms x t

x=str2sym('sin(2*pi*t/T)');

x5=subs(x,'T',5)

ezplot(x5);