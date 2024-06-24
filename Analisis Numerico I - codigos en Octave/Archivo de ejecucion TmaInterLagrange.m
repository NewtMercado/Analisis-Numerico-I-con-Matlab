clc
clear
X=[-4 -2 0 2 6]
Y=(X.^3 -3*X.^2 +6*X +30)./(X.^2 +9)
format rat
[C, L] = lagrange(X,Y)
%graficamos f(x)  y su polinomio de lagrange
x=[-5:0.1:7];
y=(x.^3 -3*x.^2 +6*x +30)./(x.^2 +9);
y1=polyval(C,x);  % EVALÚA EL POLINOMIO de lagrange C  en el vector x
plot(x,y,'b','linewidth',2)  % grafica la funcion que voy a aproximar con el polinomio de lagrange
hold on
plot(x,y1,'m','linewidth',2)  % grafica el polinomio de lagrange
grid on
hold off
