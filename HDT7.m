%% hoja de trabajo 7
syms f x
N = 5000;
a = -1;
b = 2;
c = -1;
d = 8;
%f = (1+(cos(x).^2)).^(1/2);
%f = (x-2).^4
%f = sin(x).^5
f = x.^3
int = monte_carlo(N,a,b,c,d,f)


%% funciones 
function int = monte_carlo(N,a,b,c,d,f)
    rng('shuffle')
    fx = inline(f);
    cont = 0
    rand_vect = (b-a).*rand(1,N) + a;
    f_rand = feval(fx,rand_vect);
    rand_vect_2 = (d-c).*rand(1,N) + c;
    figure(1)
    if c < 0
    plot(rand_vect,feval(fx,rand_vect),'*');
    hold on
    for i=1:N
        if rand_vect_2(i)<=f_rand(i) && 0<=rand_vect_2(i)
            cont = cont + 1;
            plot(rand_vect(i),rand_vect_2(i),'b*');   

        elseif rand_vect_2(i)>=f_rand(i) && 0>=rand_vect_2(i)
            cont = cont - 1;
            plot(rand_vect(i),rand_vect_2(i),'r*'); 
        else
           plot(rand_vect(i),rand_vect_2(i),'g*');   
        end
    end
    else
    for i=1:N
        if f_rand(i)<=rand_vect_2(i)<=0
            cont = cont + 1
        end
    end
    plot(rand_vect,feval(fx,rand_vect),'*');
    hold on
    plot(rand_vect,rand_vect_2,'r*'); 
    xlim([a b]);
    ylim([c d]);
    title('Método de montecarlo');
    end 
    xlim([a b]);
    ylim([c d]);
    title('Método de montecarlo');
    int = (b-a)*(d-c)*(cont/N);
    fprintf("el valor aprox de la integral es: %d \n",int);
end
