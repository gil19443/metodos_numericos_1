load('HDT5.mat');
syms x
f = 0.4 + 0.008039216*(x-Ao(1))+2.37393E-05*(x-Ao(1))*(x-Ao(2)) ...
    + 1.89572E-06*(x-Ao(1))*(x-Ao(2))*(x-Ao(3))+ ...
    -4.82881E-08*(x-Ao(1))*(x-Ao(2))*(x-Ao(3))*(x-Ao(4))+...
    1.91676E-09*(x-Ao(1))*(x-Ao(2))*(x-Ao(3))*(x-Ao(4))*(x-Ao(5))+...
    1.24232E-12*(x-Ao(1))*(x-Ao(2))*(x-Ao(3))*(x-Ao(4))*(x-Ao(5))*(x-Ao(6))+...
    -2.3064E-12*(x-Ao(1))*(x-Ao(2))*(x-Ao(3))*(x-Ao(4))*(x-Ao(5))*(x-Ao(6))*(x-Ao(7))+...
    1.09809E-13*(x-Ao(1))*(x-Ao(2))*(x-Ao(3))*(x-Ao(4))*(x-Ao(5))*(x-Ao(6))*(x-Ao(7))*(x-Ao(8))+...
    -2.73458E-15*(x-Ao(1))*(x-Ao(2))*(x-Ao(3))*(x-Ao(4))*(x-Ao(5))*(x-Ao(6))*(x-Ao(7))*(x-Ao(8))*(x-Ao(9))+...
    5.57383E-17*(x-Ao(1))*(x-Ao(2))*(x-Ao(3))*(x-Ao(4))*(x-Ao(5))*(x-Ao(6))*(x-Ao(7))*(x-Ao(8))*(x-Ao(9))*(x-Ao(10))+...
    -1.01884E-18*(x-Ao(1))*(x-Ao(2))*(x-Ao(3))*(x-Ao(4))*(x-Ao(5))*(x-Ao(6))*(x-Ao(7))*(x-Ao(8))*(x-Ao(9))*(x-Ao(10))*(x-Ao(11));
fx = inline(f);

f2 = 7 + (x-hora(1)) + 0.125*(x-hora(1))*(x-hora(2)) + 0.041666667*(x-hora(1))*(x-hora(2))*(x-hora(3))+...
    -0.020833333*(x-hora(1))*(x-hora(2))*(x-hora(3))*(x-hora(4))+...
    0.003125*(x-hora(1))*(x-hora(2))*(x-hora(3))*(x-hora(4))*(x-hora(5))+...
    -0.000238715*(x-hora(1))*(x-hora(2))*(x-hora(3))*(x-hora(4))*(x-hora(5))*(x-hora(6))+...
    4.6503E-06*(x-hora(1))*(x-hora(2))*(x-hora(3))*(x-hora(4))*(x-hora(5))*(x-hora(6))*(x-hora(7));
fx2 = inline(f2);

f3 = 0.038461538 + 0.020361991*(x-x3(1)) + 0.01040724*(x-x3(1))*(x-x3(2))+...
    0.006334842*(x-x3(1))*(x-x3(2))*(x-x3(3))+...
    0.004298643*(x-x3(1))*(x-x3(2))*(x-x3(3))*(x-x3(4))+...
    -0.002036199*(x-x3(1))*(x-x3(2))*(x-x3(3))*(x-x3(4))*(x-x3(5))+...
    -0.001131222*(x-x3(1))*(x-x3(2))*(x-x3(3))*(x-x3(4))*(x-x3(5))*(x-x3(6))+...
    0.001085973*(x-x3(1))*(x-x3(2))*(x-x3(3))*(x-x3(4))*(x-x3(5))*(x-x3(6))*(x-x3(7))+...
    -0.000429864*(x-x3(1))*(x-x3(2))*(x-x3(3))*(x-x3(4))*(x-x3(5))*(x-x3(6))*(x-x3(7))*(x-x3(8))+...
    0.000113122*(x-x3(1))*(x-x3(2))*(x-x3(3))*(x-x3(4))*(x-x3(5))*(x-x3(6))*(x-x3(7))*(x-x3(8))*(x-x3(9))+...
    -2.26244E-05*(x-x3(1))*(x-x3(2))*(x-x3(3))*(x-x3(4))*(x-x3(5))*(x-x3(6))*(x-x3(7))*(x-x3(8))*(x-x3(9))*(x-x3(10));
fx3 = inline(f3);

figure(1)
plot(Ao,Poblacin,'o');
xlabel('Año');   % Etiqueta al eje x
ylabel('Población (millones de personas)');
title('Censo: Población de Guatemala');
hold on
plot(Ao,feval(fx,Ao));
legend('Datos','Polinomio interpolante');

figure(2)
plot(hora,Grados,'o');
xlabel('hora');   % Etiqueta al eje x
ylabel('grados');
title('Temperatura en el dia');
hold on
plot([6:0.001:20],feval(fx2,[6:0.001:20]));
legend('Datos','Polinomio interpolante');

figure(3)
plot(x3,f_x_,'o');
xlabel('x');   % Etiqueta al eje x
ylabel('f(x)');
title('Valores para f(x) = 1/(x^2+1)');
hold on
plot([-5:0.001:5],feval(fx3,[-5:0.001:5]));
hold on
f_x_3 = inline(1/(x^2+1));
plot([-5:0.001:5],feval(f_x_3,[-5:0.001:5]));
legend('Datos','Polinomio interpolante','f(x) = 1/(x^2+1)');
save('HDT5.mat');



    
    






