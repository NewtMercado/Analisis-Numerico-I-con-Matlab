function p=Newton(f, x0, Iteraciones,Tolerancia)  #NewtonRaicesMultiples
ezplot(f);
g=sym(f);
d1= function_handle(diff(g));

d2= diff(g,2);
i=1;

fprintf("Metodo de Newton para raices multiples en octave \n")
fprintf("i   xn     Error \n")

 for i=1:Iteraciones

   xn=x0 - (f(x0)/d1(x0));


  fprintf("%4.0f  %4.5f  %4.5f \n",i, xn,abs(xn-x0));

   if abs(xn-x0)< Tolerancia
      disp("Se termino las iteraciones");
     #fprintf("\n Se concluyo el numero de iteraciones \n");
     break;

   endif
   x0=xn;

endfor
p=double(xn);
