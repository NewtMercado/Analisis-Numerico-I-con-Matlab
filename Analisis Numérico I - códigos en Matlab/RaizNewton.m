function p = RaizNewton(f, x0, Iteraciones, Tolerancia)
    ezplot(f);
    g = sym(f);
    d1 = matlabFunction(diff(g));
    d2 = diff(g, 2);
    fprintf("Método de Newton para raíces múltiples en MATLAB\n");
    fprintf("i    xn       Error\n");
    for i = 1:Iteraciones
        xn = x0 - (f(x0) / d1(x0));
        fprintf("%4.0f  %4.5f  %4.5f\n", i, xn, abs(xn - x0));
        if abs(xn - x0) < Tolerancia
            disp("Se terminaron las iteraciones");
            %fprintf("\nSe concluyó el número de iteraciones\n");
            break;
        end
        x0 = xn;
    end
    p = double(xn);
end
