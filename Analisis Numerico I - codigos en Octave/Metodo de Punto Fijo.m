function p= PuntoFijo(g, p0, Iteraciones,Tolerancia)

 i=1;
 fprintf("Metodo de punto fijo en octave \n")
 fprintf("i   p     Error \n")

 while i<=Iteraciones
   p=g(p0);
   fprintf("\%.0f  \%.5f  \%.6f \n",  i,  p,  abs(p-p0))

   if abs(p-p0)< Tolerancia
     fprintf("\n Se concluyo el numero de iteraciones \n");
     break;

   else
     p0=p;
     i=i+1;
   endif
 endwhile

