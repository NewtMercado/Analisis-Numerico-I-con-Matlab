function SistemaGaussJacobi(A, B, Iteraciones)
n = length(B);

D = zeros(n);
L = zeros(n);
U = zeros(n);

for i = 1:n
    D(i, i) = A(i, i);
end

for i = 2:n
    for j = 1:i-1
        L(i, j) = -A(i, j);
    end
end

for i = 1:n-1
    for j = i+1:n
        U(i, j) = -A(i, j);
    end
end

T = inv(D) * (L + U);
C = inv(D) * B;

    % Calcular el radio espectral de T para verificar la convergencia
    RadioEspectral = max(abs(eig(T)));

    % Si el radio espectral es menor que 1, proceder con las iteraciones
    if RadioEspectral < 1
        X = zeros(n, 1); % Vector inicial de soluciones
        for i = 1 : Iteraciones
            X = T * X + C; % Actualizar el vector de soluciones
        end
        fprintf("La solución al sistema es: \n");
        disp(X);
    else
        fprintf("El método de Jacobi no converge para este sistema. \n");
    end
end
