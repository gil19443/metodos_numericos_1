%% hoja de trabajo # 3 
% problema 1
% inciso 1.1
x = [4 4.2 4.5 4.7 5.1 5.5 5.9 6.3 6.8 7.1];
y = [102.6 113.2 130.1 142.1 167.5 195.1 224.9 256.7 299.5 326.7];
A1 = [length(x) sum(x);
      sum(x) sum(x.^2)];
b1 = [sum(y) sum(x.*y)]'; 
a1 = linsolve(A1, b1);
e1 = zeros(1,10);
syms r
R1 = a1(1) + a1(2)*r;
R1x = inline(R1);
for c = 1:10
    e1(c) = y(c) - feval(R1x,x(c));
end
sum(e1.^2)
%inciso 1.2
A2 = [10 sum(x) sum(x.^2);
    sum(x) sum(x.^2) sum(x.^3);
    sum(x.^2) sum(x.^3) sum(x.^4)];
b2 = [sum(y) sum(x.*y) sum((x.^2).*y)]'; 
a2 = linsolve(A2,b2)
R2 = a2(1) + a2(2)*r + a2(3)*r^2; 
R2x = inline(R2);
e2 = zeros(1,10);
for c = 1:10
    e2(c) = y(c) - feval(R2x,x(c));
end
sum(e2.^2)
%inciso 1.3
A3 = [10 sum(x) sum(x.^2) sum(x.^3);
    sum(x) sum(x.^2) sum(x.^3) sum(x.^4);
    sum(x.^2) sum(x.^3) sum(x.^4) sum(x.^5);
    sum(x.^3) sum(x.^4) sum(x.^5) sum(x.^6)];
b3 = [sum(y) sum(x.*y) sum((x.^2).*y) sum((x.^3).*y)]'; 
a3 = linsolve(A3,b3)
R3 = a3(1) + a3(2)*r + a3(3)*r^2 + a3(4)*r^3; 
R3x = inline(R3);
e3 = zeros(1,10);
for c = 1:10
    e3(c) = y(c) - feval(R3x,x(c));
end
sum(e3.^2)
%inciso 1.4
A4 = [length(x) sum(x);
      sum(x) sum(x.^2)];
b4 = [sum(log(y)) sum(x.*log(y))]'; 
a4 = linsolve(A4, b4)
e4 = zeros(1,10);
syms r
R4 = exp(a4(1))*exp(a4(2)*r);
R4x = inline(R4);
for c = 1:10
    e4(c) = y(c) - feval(R4x,x(c));
end
sum(e4.^2)
%inciso 1.5
A5 = [length(log10(x)) sum(log10(x));
      sum(log10(x)) sum(log10(x).^2)];
b5 = [sum(log10(y)) sum(log10(x).*log10(y))]'; 
a5 = linsolve(A5, b5)
e5 = zeros(1,10);
syms r
R5 = 10^(a5(1))*(r^(a5(2)));
R5x = inline(R5);
for c = 1:10
    e5(c) = y(c) - feval(R5x,x(c));
end
sum(e5.^2)

%% problema 2
x1 = [1 0 1 0];
x2 = [1 1 1 1];
x3 = [-1 2 0 1];
u1 = zeros(1,4);
u1 = 1/norm(x1)*x1
u2 = zeros(1,4);
u2 = x2 - dot(x2,u1)*u1;
u2 = 1/norm(u2)*u2
u3 = zeros(1,4);
u3 = x3 - dot(x3,u1)*u1-dot(x3,u2)*u2;
u3 = 1/norm(u3)*u3

%% problema 3
syms p 
syms H [1 6]
% p1 = 1, H1 = 1
H(1) = 1;
% p2
h2 = int(exp(-p^2)*p*H(1),-inf, inf);
h2m = int(exp(-p^2)*H(1)^2,-inf, inf);
H(2) = p - H(1)*(h2/h2m);
%p3
h3 = int(exp(-p^2)*p^2*H(1),-inf, inf);
h3_1 = int(exp(-p^2)*p^2*H(2),-inf, inf);
h3_1m = int(exp(-p^2)*H(2)^2,-inf, inf);
H(3) = p^2 - H(1)*(h3/h2m) - H(2)*(h3_1/h3_1m);

% p4
h4 = int(exp(-p^2)*p^3*H(1),-inf, inf);
h4_1 = int(exp(-p^2)*p^3*H(2),-inf, inf);
h4_2 = int(exp(-p^2)*p^3*H(3),-inf, inf);
h4_2m = int(exp(-p^2)*H(3)^2,-inf, inf);
H(4) = p^3 - H(1)*(h4/h2m) - H(2)*(h4_1/h3_1m) - H(3)*(h4_2/h4_2m);

%p5
h5 = int(exp(-p^2)*p^4*H(1),-inf, inf);
h5_1 = int(exp(-p^2)*p^4*H(2),-inf, inf);
h5_2 = int(exp(-p^2)*p^4*H(3),-inf, inf);
h5_3 = int(exp(-p^2)*p^4*H(4),-inf, inf);
h5_3m = int(exp(-p^2)*H(4)^2,-inf, inf);
H(5) = p^4 - H(1)*(h5/h2m) - H(2)*(h5_1/h3_1m) - H(3)*(h5_2/h4_2m) ... 
- H(4)*(h5_3/h5_3m);

%p6
h6 = int(exp(-p^2)*p^5*H(1),-inf, inf);
h6_1 = int(exp(-p^2)*p^5*H(2),-inf, inf);
h6_2 = int(exp(-p^2)*p^5*H(3),-inf, inf);
h6_3 = int(exp(-p^2)*p^5*H(4),-inf, inf);
h6_4 = int(exp(-p^2)*p^5*H(5),-inf, inf);
h6_4m = int(exp(-p^2)*H(5)^2,-inf, inf);
H(6) = p^5 - H(1)*(h6/h2m) - H(2)*(h6_1/h3_1m) - H(3)*(h6_2/h4_2m) ...
- H(4)*(h6_3/h5_3m) - H(5)*(h6_4/h6_4m);

%% ejercicio 4
syms L [1 4]
% p1 = 1, L1 = 1
L(1) = 1;
% p2
l2 = int(exp(-p)*p*L(1),0, inf);
l2m = int(exp(-p)*L(1)^2,0, inf);
L(2) = p - L(1)*(l2/l2m);
%p3
l3 = int(exp(-p)*p^2*L(1),0, inf);
l3_1 = int(exp(-p)*p^2*L(2),0, inf);
l3_1m = int(exp(-p)*L(2)^2,0, inf);
L(3) = p^2 - L(1)*(l3/l2m) - L(2)*(l3_1/l3_1m);

% p4
l4 = int(exp(-p)*p^3*L(1),0, inf);
l4_1 = int(exp(-p)*p^3*L(2),0, inf);
l4_2 = int(exp(-p)*p^3*L(3),0, inf);
l4_2m = int(exp(-p)*L(3)^2,0, inf);
L(4) = p^3 - L(1)*(l4/l2m) - L(2)*(l4_1/l3_1m) - L(3)*(l4_2/l4_2m);
display(L);
%% problema 5
syms poli [1 4] 
syms reg1 [1 4]
g1 = zeros(1,4);
for n = 1:4
    g1(n) = int(exp(-p)*p^2*L(n),0, inf)/int(exp(-p)*L(n)^2,0, inf);
    reg1(n) = g1(n)*L(n);
end
sum(reg1)
syms reg2 [1 4]
g2 = zeros(1,4);
for n = 1:4
    g2(n) = int(exp(-p)*exp(-p)*L(n),0, inf)/int(exp(-p)*L(n)^2,0, inf);
    reg2(n) = g2(n)*L(n);
end
sum(reg2)
syms reg3 [1 4]
g3 = zeros(1,4);
for n = 1:4
    g3(n) = int(exp(-p)*p^3*L(n),0, inf)/int(exp(-p)*L(n)^2,0, inf);
    reg3(n) = g3(n)*L(n);
end
sum(reg3)