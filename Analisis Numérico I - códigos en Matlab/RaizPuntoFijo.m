function p = RaizPuntoFijo(g, p0, Iteraciones, Tolerancia)
    i = 1;
    fprintf("Método de punto fijo en MATLAB\n");
    fprintf("i    p         Error\n");
    while i <= Iteraciones
        p = g(p0);
        fprintf("%d    %.5f    %.6f\n", i, p, abs(p - p0));
        if abs(p - p0) < Tolerancia
            fprintf("\nSe concluyó el número de iteraciones.\n");
            break;
        else
            p0 = p;
            i = i + 1;
        end
    end
end
