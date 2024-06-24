function [x] = SOR(A,b,x_0,omega)
format long;
N = 9; %%%iteraciones a realizar
n = length(A);
tol = 0.0001;
x =zeros(n,1);
D = diag(diag(A));
L =-tril(A,-1);
U = -triu(A,1);
a = (D-omega*L);
for i=1:N
    x = a\(((1-omega)*D + omega*U)*x_0) + omega*(a\b);
    if norm(x-x_0)<tol
        break;
    end
end
  %resultados
    fprintf("forma matricial sor")
    disp(((1-omega)*D + omega*U))
    x_0=x;
end

