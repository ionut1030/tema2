syms t;
P = 40;
w0 = 2*pi/P;

f = heaviside(t) - heaviside(t - 3);

N = 50;
    

[a0, a, b] = FUNCTIETEMA2(f, P, N);

t_num = [-50:0.02:50];
f_num = a0;
t1 = [-50:0.02:50];
freq = 0.025;
square_wave = 0.5 + 0.5 * square(2*pi*freq.*t1, 12.5);


for n = 1:N
    arm = a(n)*cos(n*w0*t_num) + b(n)*sin(n*w0*t_num);
    f_num = f_num + arm;
      subplot(3,1,2)
    plot(t1,square_wave,'blue','LineWidth',2)
    title('Semnal reconstruit')
    hold on
    plot(t_num,f_num,'blue')
    hold off

end

hold on

subplot(3,1,1)
plot(t1, square_wave)
title('Semnal x(t)')
hold off

for n = 1:50
    An(n) = sqrt(a(n)^2+b(n)^2);
end

x = [fliplr(An) a0 An];
k = -50:1:50;
subplot(3,1,3)
stem(k, x)
hold on
plot(k, x)
title('Spectrul lui x(t)')