clc;
clear;
bits = [1,0,1,0,0,1,1,1,0,1];
%bits = input("INPUT BITS: ");

T = length(bits);
n = 100;

N = n*T;
t = 0:T/N:T;
x = ones(1,length(t));

k = 1;

for i=1:T
  if(bits(i)==1)
    k=k*(-1);
  end
  x((i-1)*n+1:i*n)=k;
end

plot(t,x,'LineWidth',3);
axis([0,T,-2,2]);
grid on;


j = 1;
if x(1) == 1
  ans_bits(1) = 0;
else
  ans_bits(1) = 1;
end
j++;
for i = 100:length(x)-100
  if mod(i,n)==0
    if x(i) == x(i+1)
        ans_bits(j) = 0;
    else
        ans_bits(j) = 1;
    end
    j++;
  end
end

disp('Dem')
disp(ans_bits)