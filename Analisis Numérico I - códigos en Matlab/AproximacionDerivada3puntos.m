function AproximacionDerivada3puntos(tablax, tablay, h)
    n = length(tablax);
    
    if n >= 3
        for i = 1:n
            if i < n - 1
                % Fórmula progresiva
                faproxPrima = (1 / (2 * h)) * (-3 * tablay(i) + 4 * tablay(i+1) - tablay(i+2));
                disp('Aproximación de la derivada progresiva:');
                disp(faproxPrima);
            elseif i == n - 1  % Si es el penúltimo valor
                % Fórmula central
                faproxPrima = (1 / (2 * h)) * (tablay(i+1) - tablay(i-1));
                disp('Aproximación de la derivada central:');
                disp(faproxPrima);
            elseif i == n  % Si es el último valor
                % Fórmula de extremo hacia atrás
                faproxPrima = (1 / (2 * h)) * (3 * tablay(i) - 4 * tablay(i-1) + tablay(i-2));
                disp('Aproximación de la derivada de extremo hacia atrás:');
                disp(faproxPrima);
            end
        end
    else
        disp('Error: La lista de valores debe tener al menos tres puntos para calcular las derivadas.');
    end
end
