 %matrix de coeficientes
 T=[0 1/10 -1/5 0;
    1/11 0 1/11 -3/11;
    -1/5 1/10 0 1/10;
    0 -3/8 1/8 0];

 radio_espectral_alternativo = max(abs(eig(T)));
 %vector inicial
 x=[0;0;0;0];
 %vector de error o de terminos independientes
 c=[3/5; 25/11; -11/10; 15/8];

 i=0;
 for i=1:100
   x=T*x+c;
 endfor

