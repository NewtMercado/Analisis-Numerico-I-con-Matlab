function omega_opt = OmegaOptimo(A)
    % Rango de valores de omega a probar
    omega_range = 0.1:0.1:1.9;
    
    % Inicialización de variables
    num_iters_min = Inf;
    omega_opt = NaN;
    
    % Iteración sobre los valores de omega
    for omega = omega_range
        % Aplicar SOR con el valor actual de omega
        [~, num_iters] = SOR(A, zeros(size(A, 1), 1), 1e-6, omega);
        
        % Actualizar el valor óptimo de omega si se encuentra uno mejor
        if num_iters < num_iters_min
            num_iters_min = num_iters;
            omega_opt = omega;
        end
    end
end

function [x, num_iters] = SOR(A, b, tol, omega)
    % Parámetros
    N = 1000; % Número máximo de iteraciones
    x = zeros(size(A, 1), 1); % Vector inicial
    
    % Descomposición de A
    D = diag(diag(A));
    L = tril(A, -1);
    U = triu(A, 1);
    
    % Matriz de iteración
    M = inv(D + omega * L) * ((1 - omega) * D - omega * U);
    f = omega * inv(D + omega * L) * b;
    
    % Iteraciones
    for num_iters = 1:N
        x_new = M * x + f;
        % Criterio de convergencia
        if norm(x_new - x) < tol
            x = x_new;
            return;
        end
        x = x_new;
    end
    error('No se pudo converger en %d iteraciones', N);
end
