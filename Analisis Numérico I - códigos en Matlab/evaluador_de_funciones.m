function [y, Matriz] = evaluador_de_funciones(x)
    n = length(x);
    funcion = input('Ingrese la función: ', 's');
    y = [];
    Matriz = {}; % Celda para la tabla con valores

    for i = 1:n
        valor = eval(funcion);
        y = [y, valor];
        Matriz = [Matriz; {x(i), valor}];
    end

    print(Matriz);
end

%%"def evaluador de funciones():
%%	n= length(x)
%%	funcion = labelx: (input())
%%	y=[ ]
%%	Matriz=[ ] #tabla con valores
%%	for i in range(n):
%%		valor = funcion(X[i])
%%		y.append(valor)
%%	Matriz.append(x,y)	
%%	return y, Matriz

%% x= input([ ])%
