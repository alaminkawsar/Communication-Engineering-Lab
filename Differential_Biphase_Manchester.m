clc;
clear;
bits = [1,0,1,0,0,1,1,1,0,1];
%bits = input("INPUT BITS: ");

T = length(bits);
n = 100;

N = n*T;
t = 0:T/N:T;
x = ones(1,length(t));
val = -1
for i=1:T
  if bits(i)==1
    val = val*-1;
  end
  x((i-1)*n+1:i*n-n/2)=val;
  x((i-1)*n+n/2:i*n)=val*-1;
end

plot(t,x,'LineWidth',3);
axis([0,T,-2,2]);
grid on;

j=2;
if x(1)==1
  ans_bits(1)=1;
else
  ans_bits(1)=0;
end

%Demodulation
for i=101:length(x)-1
  if mod(i-1,n)==0
    if x(i)==x(i-n)
        ans_bits(j) = 0;
    else
        ans_bits(j) = 1;
    end
    j = j+1;
  end
end

disp('Demodulation : ')
disp(ans_bits)