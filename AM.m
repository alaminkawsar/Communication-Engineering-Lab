clear;
clc;
close;

Ac = 1; %carier Amlitude
Am = 1; %Message signal Amlitude

Fc = 5; %carier Frequency
Fm = 2; %Message signal Amlitude (Must be less than Carrier freq)

T = 5;
sampling_frequency = 1000;
sampling_period = 1/sampling_frequency;
time = 0:sampling_period:T;

Ym = Am*sin(2*pi*Fm*time);

subplot(3,1,1);
title('Message Signal');
plot(time,Ym);
grid on;

Yc = Ac*sin(2*pi*Fc*time);

subplot(3,1,2);
title('Carrier Signal');
plot(time,Yc);
grid on;

Z = (Ac+Ym).*Yc;

subplot(3,1,3);
title('Amlitude Modulated Signal');
plot(time,Z,'b');
grid on;

