%% Regla de trapecios
a = input('ingrese el limite inferior del intervalo: ');
b = input('ingrese el limite superior del intervalo:  ');
n = input('ingrese el numero de intervalos: ');
f = input('ingrese la funcion: ');
syms x;
fx = inline(f);
func = zeros(1,n-1);
for k=1:n-1
    func(k) = feval(fx,(a+k*((b-a)/n)));
end
trap = ((b-a)/n)*(((feval(fx,b)-feval(fx,a))/2)+sum(func)); 
fprintf('la aproximacion es: %f\n',trap);

%% Regla se Simpson
a = input('ingrese el limite inferior del intervalo: ');
b = input('ingrese el limite superior del intervalo:  ');
n = input('ingrese el numero de intervalos: ');
syms x;
f = input('ingrese la funcion: ');
fx = inline(f);
xi = zeros(1,(n+1));
u=0;
for k=1:(n+1)
    xi(k) = a+((k-1)*((b-a)/n));
end
func1 = zeros(1,(n+1));
for i=0:2:n
    if (i == 0)
    else
    func1(i-1) = 4*feval(fx,xi(i));
    end
end
for j=1:2:n
    if (j == 1)
    else
    func1(j+1) = 2*feval(fx,xi(j));
    end 
end
simp = ((b-a)/(3*n))*(feval(fx,a)+sum(func1)+feval(fx,b));
fprintf('la aproximacion es: %f\n',simp);
%% simpson 3/8 
a=input('Enter lower limit of integral=');
b=input('Enter upper limit of integral=');
n=input('Enter number of intervals (multiple of 3)=');
syms x;
f = input('ingrese la funcion: ');
fx = inline(f);
h=(b-a)/n;
sum1=0.0;
sum2=0.0;
sum3=0.0;
for i=1:3:n-2
    sum1=sum1+feval(fx,a+i*h);
end
for i=2:3:n-1
    sum2=sum2+feval(fx,a+i*h);
end
for i=3:3:n-3
    sum3=sum3+feval(fx,a+i*h);
end

simp=3*h*(feval(fx,a)+3.0*sum1+3.0*sum2+2.0*sum3+feval(fx,b))/8.0;

fprintf('Integrated value is %f\n',simp)