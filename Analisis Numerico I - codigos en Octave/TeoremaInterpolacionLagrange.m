function [C, L] = lagrange(X,Y)
%DATOS
%X es un vector que contiene la lista de abscisas
%Y es un vector que contiene la lista de ordenadas
%RESULTADOS
% C es la matriz que contiene los coeficientes del polinomio
% interpolador de Lagrange
% L es la matriz que contiene los coeficientes de los polinomios
% Li de Lagrange
w= length(X);
n=w-1;
L=zeros(w,w);
% FORMACION DE LOS POLINOMIOS Li DE LAGRANGE
for k=1: n+ 1
    V=1;
    for r=1:n+1
        if k~=r
            V = conv(V, poly(X(r)))/(X(k)-X(r));
        end
    end
    L(k,:) = V
end
% CALCULO DE LOS COEFICIENTES DEL POLINOMIO INTERPOLADOR
C=Y*L;
