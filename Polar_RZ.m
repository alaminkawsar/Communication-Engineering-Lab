clc;
clear;
bits = [1,0,1,0,0,1,1,1,0,1];
%bits = input("INPUT BITS: ");

T = length(bits);
n = 100;

N = n*T;
t = 0:T/N:T;
x = zeros(1,length(t));

k = 1;

for i=1:T
  if(bits(i)==1)
    x((i-1)*n+1:i*n-n/2)=1;
  else
    x((i-1)*n+1:i*n-n/2)=-1;
  end
end

plot(t,x,'LineWidth',3);
axis([0,T,-2,2]);
grid on;

j = 1;
for i=1:length(x)
  if mod(i,n/2)==0 && mod(i,n)~=0
    if x(i-1)==-1
      ans_bits(j) = 0;
    else
      ans_bits(j) = 1;
    end
    j++;
    
  endif
endfor

disp('Demodulation: ')
disp(ans_bits)


