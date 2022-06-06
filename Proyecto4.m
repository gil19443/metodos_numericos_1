%% proyecto 4
syms x y 
%inciso a
% x0=0;
% y0=-2;
% h=0.2;
% f = (-3*exp(-2*x)-1)/(1+exp(-2*x));
% f_p = -(y+1)*(y+3)+0*x;
% a = 0;
% b = 2;
%inciso b
% x0=0;
% y0=1/3;
% h=0.1;
% f = x^2-(2*x/5)+(137/25)-((386*exp(-5*x))/75);
% f_p = -5*y+5*x^2+27;
% a = 0;
% b = 1;
%inciso c
% x0=0;
% y0=0;
% h=0.5;
% f = ((exp(3*x)*(5*x-1))+exp(-2*x))/25;
% f_p = x*exp(3*x)-2*y;
% a = 0;
% b = 1;
% inciso d
x0=2;
y0=1;
h=0.5;
f = (-1/(x-1))+x;
f_p = 1+(x-y)^2;
a = 2;
b = 3;
[xn, yn, err1] = euler(x0,y0,h,f,f_p,a,b);
[xn, yn, err2] = predictor(x0,y0,h,f,f_p,a,b);
[xn, yn, err3] = runge(x0,y0,h,f,f_p,a,b);
%% Funciones
function [xn, yn, err1] = euler(x0,y0,h,f,f_p,a,b)
%metodo de euler
syms x y 
xn = linspace(a,b,((b-a)/h)+1);
yn = zeros(1,((b-a)/h)+1); 
err1 = zeros(1,((b-a)/h)+1); 
fx = inline(f);
xn(1) = x0;
yn(1) = y0;
for i=2:((b-a)/h)+1
    yn(i) = yn(i-1) + h*(subs(f_p,[x,y],[xn(i-1),yn(i-1)]));
    err1(i) = abs(yn(i)-feval(fx,xn(i)));
end
%polinomio interpolante
p=vander(xn)\yn'
p = flip(p)
g1 = 0;
for i=1:((b-a)/h)+1
    g1 = g1 + p(i)*x^(i-1);
end
gx = inline(g1);
err1 = err1';
figure(1)
plot(linspace(a,b,100),feval(fx,linspace(a,b,100)),'b')
hold on 
plot(xn,yn,'og')
hold on 
plot(xn,feval(gx,xn),'r')
xlabel('Eje x');
ylabel('Eje y');
legend('Solución analítica','Aproximación','Polinomio Interpolante')
title('Método de Euler');
end
function [xn, yn, err2] = predictor(x0,y0,h,f,f_p,a,b)
%metodo de predictor corrector
syms x y 
xn = linspace(a,b,((b-a)/h)+1);
yn = zeros(1,((b-a)/h)+1); 
err2 = zeros(1,((b-a)/h)+1); 
fx = inline(f);
xn(1) = x0;
yn(1) = y0;
for i=2:((b-a)/h)+1
    yn(i) = yn(i-1) +  h*(subs(f_p,[x,y],[xn(i-1),yn(i-1)]));
    yn(i) = yn(i-1) + h/2*(subs(f_p,[x,y],[xn(i-1),yn(i-1)]) + subs(f_p,[x,y],[xn(i),yn(i)]));
    err2(i) = abs(yn(i)-feval(fx,xn(i)));
end
%polinomio interpolante
p=vander(xn)\yn'
p = flip(p)
g1 = 0;
for i=1:((b-a)/h)+1
    g1 = g1 + p(i)*x^(i-1);
end
gx = inline(g1);
err2 = err2';
figure(2)
plot(linspace(a,b,100),feval(fx,linspace(a,b,100)),'b')
hold on 
plot(xn,yn,'og')
hold on 
plot(xn,feval(gx,xn),'r')
xlabel('Eje x');
ylabel('Eje y');
legend('Solución analítica','Aproximación','Polinomio Interpolante')
title('Método de Predictor Corrector');
end
function [xn, yn, err3] = runge(x0,y0,h,f,f_p,a,b)
%metodo de runge kutta
syms x y 
xn = linspace(a,b,((b-a)/h)+1);
yn = zeros(1,((b-a)/h)+1); 
err3 = zeros(1,((b-a)/h)+1); 
fx = inline(f);
xn(1) = x0;
yn(1) = y0;
k1=0;
k2=0;
k3=0;
k4=0;
for i=2:((b-a)/h)+1
    k1 = h*(subs(f_p,[x,y],[xn(i-1),yn(i-1)]));
    k2 = h*(subs(f_p,[x,y],[(xn(i-1)+(h/2)),(yn(i-1)+(k1/2))]));
    k3 = h*(subs(f_p,[x,y],[(xn(i-1)+(h/2)),(yn(i-1)+(k2/2))]));
    k4 = h*(subs(f_p,[x,y],[(xn(i-1)+h),(yn(i-1)+k3)]));
    yn(i) = yn(i-1) + (1/6)*(k1+2*k2+2*k3+k4);
    err3(i) = abs(yn(i)-feval(fx,xn(i)));
end
%polinomio interpolante
p=vander(xn)\yn'
p = flip(p)
g1 = 0;
for i=1:((b-a)/h)+1
    g1 = g1 + p(i)*x^(i-1);
end
gx = inline(g1);
err3 = err3';
figure(3)
plot(linspace(a,b,100),feval(fx,linspace(a,b,100)),'b')
hold on 
plot(xn,yn,'og')
hold on 
plot(xn,feval(gx,xn),'r')
xlabel('Eje x');
ylabel('Eje y');
legend('Solución analítica','Aproximación','Polinomio Interpolante')
title('Método de Runge-Kutta');
end