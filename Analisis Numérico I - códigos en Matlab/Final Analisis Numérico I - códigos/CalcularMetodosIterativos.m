function [RadioEspectral, T_J, C_J, T_GS, C_GS] = CalcularMetodosIterativos(A)
    n = size(A, 1);
    
    % Matrices para el método de Jacobi
    D = diag(diag(A));
    R = A - D;
    T_J = -D \ R;
    C_J = D \ diag(A);
    
    % Matrices para el método de Gauss-Seidel
    D_L = tril(A);
    U = triu(A, 1);
    T_GS = -(D_L \ U);
    C_GS = (D_L \ diag(A));
    
    % Calcular el radio espectral de T para ambos métodos
    RadioEspectral_J = max(abs(eig(T_J)));
    RadioEspectral_GS = max(abs(eig(T_GS)));
    
    % Resultados
    RadioEspectral = [RadioEspectral_J, RadioEspectral_GS];
    % Resultados
    fprintf("Resultados: matriz Tj")
    disp(T_J)
    fprintf("Resultados: matriz Tg")
    disp(T_GS)
end
