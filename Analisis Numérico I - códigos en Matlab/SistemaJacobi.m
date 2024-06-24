function SistemaJacobi(A, B, Iteraciones)
    n = length(B);
    D = zeros(n);
    R = zeros(n);

    % Descomposición de la matriz A en D (diagonal) y R (resto)
    for i = 1 : n
        for j= 1 : n
            if i == j
                D(i, j) = A(i, j);
            else
                R(i, j) = A(i, j);
            end
        end
    end

    % Cálculo de la matriz de iteración T y el vector de términos independientes C
    T = -1 * inv(D) * R;
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

