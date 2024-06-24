function EcuLagrange = Interpolacionlagrange(xi, fxi)
n = length(xi);
syms x;

for i = 1:n
    Li = 1;
    for j = 1:n
        if j ~= i
            Li = Li * ((x - xi(j))) / ((xi(i) - xi(j)));
        end
    end
    L(i) = Li;
end

EcuLagrange = 0;

for i = 1:n
    EcuLagrange = L(i) * fxi(i) + EcuLagrange;
end

% muestra la ecuación interpolante de Lagrange
EcuLagrange = simplify(expand(EcuLagrange));

% Graficar la ecuación interpolante de Lagrange
figure;
ezplot(EcuLagrange, [min(xi), max(xi)]);
hold on;

% Graficar puntos de interpolación
plot(xi, fxi, 'ro', 'MarkerSize', 10);
title('Interpolación de Lagrange');
xlabel('x');
ylabel('f(x)');
legend('Ecuación Interpolante', 'Puntos de Interpolación', 'Location', 'best');
hold off;

end

