%% iteracion de punto fijo 
close all
clear all
clc
syms x;
%f=((3*x-1)^(1/2));
%f = (x^(2) + 1)/3;
f = 3*x*(1-x);
fx = inline(f);
x0=0.3;
error = 100;
i=0;
fprintf('\ti  \txi  \terror \n');
while (abs(error)>0.0000001)
    i = i+1;
    xi= feval(fx,x0);
    error = xi - x0;
    fprintf('\t%d  \t%f  \t%f \n',i,xi,abs(error))
    x0=xi;
    
end
%% metodo de NR
clc;
close all;
clear all;
syms x;
%f=x-2*sin(x); %Enter the Function here
%f = 2/x - 1/sin(x);
%f=sin(x)/x - 1/2;
%f=diff((x^2+log(x)^2)^(1/2));
%f=3*x*(1-x)-x;
f = tanh(x);
fx= inline(f);
g=diff(f); %The Derivative of the Function
gx = inline(g);
x0 = input('Enter the intial approximation:');
i = 0;
error = 1;
fprintf('\ti  \txi  \terror \n');
% while(abs(error)>0.0000001)
    c=0;
    for c = 1:9
        i = i + 1;
        f0=feval(fx,x0); %Calculating the value of function at x0
        f0_der=feval(gx, x0); %Calculating the value of function derivative at x0
        y=x0-f0/f0_der; % The Formula
        error=abs(y-x0);
        x0 = y;
        fprintf('\t%d  \t%f  \t%f \n',i,y,error)
        try 
            figure(1);
            x1 = linspace(-14,14,100); 
            plot(x1,tanh(x1),'r');
            yt = ((sech(x0))^2*(x1-x0))+tanh(x0);
            plot(x1,yt,'b');
            plot(x0, tanh(x0),'*');
            hold on;
            xlabel("eje x");
            ylabel("eje y");
            ylim([-3 3]);
            title('tanh(xi) con x0 = 1.09');
        catch 
            fprintf('el metodo murio');
        end
    end
% end
%% metodo de la secante 
x0=input('Ingrese el intervalo inferior: ');
x1=input('Ingrese el intervalo superior: ');
syms x;
%f=x-2*sin(x);
f = tanh(x);
fx = inline(f); 
error = 1;
fprintf('\ti  \txi  \terror \n');
i=0;
while error > 0.0000001
   i = i+1;
   x2= x1 - (feval(fx,x1)*(x1-x0))/(feval(fx,x1)-feval(fx,x0));  
   error = abs(x2-x1);
   x0 = x1;
   x1 = x2;
   fprintf('\t%d  \t%f  \t%f \n',i,x2,error)
end
%% NR junto con biseccion 
clc;
syms x;
f=diff((x^2+log(x)^2)^(1/2));
% f = tanh(x);
fx = inline(f);
error = 1;
i = 0;
a = input('ingrese el intervalo inferior:' );
b = input('ingrese el intervalo superior:' );
for c = 1:10
    xi = (a+b)/2;
    if feval(fx,a)*feval(fx,xi)<0
        b = xi;
    else
        a = xi;
    end
end
fprintf("el intervalo resultante es: (%f,%f)\n",a,b);
x0 = (a+b)/2;
fprintf('\ti  \txi  \terror \n');
while(abs(error)>0.0000001)
    i = i + 1;
    f0=feval(fx,x0); %Calculating the value of function at x0
    f0_der=feval(gx, x0); %Calculating the value of function derivative at x0
    y=x0-f0/f0_der; % The Formula
    error=abs(y-x0);
    x0 = y;
    fprintf('\t%d  \t%f  \t%f \n',i,y,error);
end