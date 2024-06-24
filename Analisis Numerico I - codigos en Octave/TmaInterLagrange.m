A=[1904,1906,1989,1992,2000];
P =[53000,71000,91000,02000,73000];
A1=1905;
P1= interp1 (A, P, A1)
plot (A, P, ' o')
x=1984: 0.1: 2000
y= interp1 (A, P, x, 'linear')
hold on
plot ( x, y)
r= interp1 (A, P, x,'cubic')
plot (x, r)
