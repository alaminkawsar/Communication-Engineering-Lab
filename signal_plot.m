

fs = 100;
a = 10;
T = 2;
f = 2;

t = 0:1/fs:T;

a1 = 10;
f1 = 4;

a2 = 10
f2 = 8


y = a * sin(2*pi*f*t)
y1 = a1 * sin(2*pi*f1*t)
y2 = a2 * sin(2*pi*f2*t)

plot(t,y+y1,'r',t,y1,'g',t,y2,'b')
grid on;
