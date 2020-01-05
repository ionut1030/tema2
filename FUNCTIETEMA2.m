function [a0, a, b] = FUNCTIETEMA2(f, P, N)
syms t;
P=40;
w0=2*pi/P;

f=heaviside(t)-heaviside(t-5);

a0_sym=1/P*int(f,t,0,P);
a0=double(a0_sym);

for n=1:50;
    a_sym(n)=2/P*int(f*cos(n*w0*t),t,0,P);
    b_sym(n)=2/P*int(f*sin(n*w0*t),t,0,P);
    
    a(n)=double(a_sym(n));
    b(n)=double(b_sym(n));
end