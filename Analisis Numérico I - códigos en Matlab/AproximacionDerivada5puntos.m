function AproximacionDerivada5puntos(tablax, tablay, h)
    n = length(tablax);
    
    if n >= 5
        for i = 1:n
            if i <= 2 % Si es el primer o segundo valor
                % Fórmula de extremo hacia atrás
                faproxPrima = (1 / (12 * h)) * (-25 * tablay(i) + 48 * tablay(i+1) - 36 * tablay(i+2) + 16 * tablay(i+3) - 3 * tablay(i+4));
                disp('Aproximación de la derivada de extremo hacia atrás:');
                disp(faproxPrima);
            elseif i >= 3 && i <= n - 2 % Si es un valor central
                % Fórmula central
                faproxPrima = (1 / (12 * h)) * (tablay(i-2) - 8 * tablay(i-1) + 8 * tablay(i+1) - tablay(i+2));
                disp('Aproximación de la derivada central:');
                disp(faproxPrima);
            elseif i == n - 1% Si es el penúltimo 
                % Fórmula de extremo hacia adelante
                faproxPrima = (1 / (12 * h)) * (-25 * tablay(i-4) + 48 * tablay(i-3) - 36 * tablay(i-2) + 16 * tablay(i-1) - 3 * tablay(i));
                disp('Aproximación de la derivada de extremo hacia adelante:');
                disp(faproxPrima);
            elseif  i == n %o último valor
                % Fórmula de extremo hacia adelante
                faproxPrima = (-1 / (12 * h)) * (-25 * tablay(i-4) + 48 * tablay(i-3) - 36 * tablay(i-2) + 16 * tablay(i-1) - 3 * tablay(i));
                disp('Aproximación de la derivada de extremo hacia adelante:');
                disp(faproxPrima);
            end
        end
    else
        disp('Error: La lista de valores debe tener al menos cinco puntos para calcular las derivadas.');
    end
end
