function interpolacionHermite(A)
    alappontok = A(:, 1);
    fvertekek = A(:, 2);
    [n, m] = size(A);
    M = zeros(1, n);
    
    % Calcular el número de diferencias divididas necesarias
    for i = 1:n
        o = 0;
        for j = 1:m
            if A(i, j) ~= Inf
                o = o + 1;
            end
        end
        M(i) = o - 1;
    end
    
    k = sum(M);
    B = zeros(k, k + 1);
    C = [];
    l = 1;
    aszam = 1;
    
    % Construir la tabla de diferencias divididas
    for i = l:k
        if l > M(aszam)
            l = 1;
            aszam = aszam + 1;
        end
    
        B(i, 1) = alappontok(aszam);
        B(i, 2) = fvertekek(aszam);
        C = [C; A(aszam, :)];
        l = l + 1;
    end
    
    szamlaloban = 2;
    nevezoben = 1;
    
    % Calcular las diferencias divididas
    for l = 3:k + 1
        for i = 1:k + 2 - l
            if B(i, nevezoben) == B(i + l - 2, nevezoben)
                B(i, l) = C(i + l - 1, m) / factorial(l - 2);
            else
                B(i, l) = (B(i, szamlaloban) - B(i + l - 2, szamlaloban)) / (B(i, nevezoben) - B(i + l - 2, nevezoben));
            end
        end
        szamlaloban = szamlaloban + 1;
    end
    
    % Imprimir la tabla de diferencias divididas
    disp("Tabla de diferencias divididas:");
    disp(B);
    
    E = B(1, :);
    X = B(:, m);
    syms x;
    syms H;
    H = E(2);
    
    % Construir el polinomio resultante
    for i = 3:k + 1
        z = 1;
        for j = 1:i - 2
            z = z * (sym(x) - X(j));
        end
        H = H + E(i) * z;
    end
    
    % Imprimir el polinomio
    disp("Polinomio de forma simbólica:");
    disp(H);
    
    % Convertir el polinomio a coeficientes
    Y = sym2poly(H);
    
    % Imprimir los coeficientes
    disp("Coeficientes del polinomio:");
    disp(Y);
    
    % Graficar el polinomio
    f = @(x) polyval(Y, x);
    xx = linspace(min(alappontok), max(alappontok), 1000);
    yy = arrayfun(f, xx);
    plot(alappontok, fvertekek, 'o', xx, yy, '-');
    title('Interpolación de Hermite');
    xlabel('x');
    ylabel('f(x)');
    legend('Datos', 'Polinomio de Hermite');
end
