function EcuLagrange = lagrange(xi,fxi)
n = length(xi);
syms x;

for i=1:n
  Li=1;
  for j=1:n
    if j~=i
      Li = Li * ((x - xi))/((xi-xj(j)));
    endif
  end
  L(i)=Li;
end

EcuLagrange=0;

for i=1:n
  EcuLagrange= L(i)*fxi(i)+ EcuLagrange;

end
EcuLagrange = simplify(expand(EcuLagrange));

end
