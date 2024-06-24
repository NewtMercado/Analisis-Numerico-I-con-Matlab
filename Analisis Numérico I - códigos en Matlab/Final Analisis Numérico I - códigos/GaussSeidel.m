function GaussSeidel(A, B, Iteraciones, epsilon)
    n = length(B);

    D = diag(diag(A));
    L = tril(A, -1);
    U = triu(A, 1);

    % Cálculo de la matriz de iteración T y el vector de términos independientes C
    T = -(D + L) \ U;
    C = (D + L) \ B;

    % Calcular el radio espectral de T para verificar la convergencia
    RadioEspectral = max(abs(eig(T)));

    % Si el radio espectral es menor que 1, proceder con las iteraciones
    if RadioEspectral < 1
        X = zeros(n, 1); % Vector inicial de soluciones
        for k = 1:Iteraciones
            X_new = T * X + C; % Actualizar el vector de soluciones
            % Criterio de parada
            if norm(X_new - X, inf) < epsilon
                fprintf("Convergencia alcanzada en %d iteraciones.\n", k);
                break;
            end
            X = X_new;
        end
        fprintf("La solución al sistema es: \n");
        disp(X);
    else
        fprintf("El método de Gauss-Seidel no converge para este sistema. \n");
    end
end
