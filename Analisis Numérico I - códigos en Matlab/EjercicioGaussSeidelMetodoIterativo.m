clear; 
clc;
A = [10, -1, 1; 1, 9, 1; 1, 2, 9];
B = [2; 8; 6];
n = length(B);

D = zeros(n);
L = zeros(n);
U = zeros(n);

for i = 1:n
    D(i, i) = A(i, i);
end

for i = 2:n
    for j = 1:i-1
        L(i, j) = -A(i, j);
    end
end

for i = 1:n-1
    for j = i+1:n
        U(i, j) = -A(i, j);
    end
end

T = inv(D) * (L + U);
C = inv(D) * B;

fprintf("Matriz D:\n");
disp(D);
fprintf("Matriz L:\n");
disp(L);
fprintf("Matriz U:\n");
disp(U);
fprintf("Matriz T:\n");
disp(T);
fprintf("Matriz C:\n");
disp(C);
