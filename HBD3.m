%collected from Nadim vai
%Github link: https://github.com/Nadim-Mahmud/Communication-Engineering-Lab/blob/master/HDB3.m
clear;
clc;
close;

bits = [0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0];

bit_rate=1;
voltage=5;
tmp = voltage;
sign = -1;
mrk = 1;
voltage = sign*voltage;
cn=0;
cn1=0;

for i = 1:length(bits)
    if bits(i) == 0
        cn = cn+1;
    else
        cn1=cn1+1;
        cn=0;
    end
    
    if cn>3
        if mod(cn1,2)==0
            y_level(i) = -voltage;
            voltage=y_level(i);
            y_level(i-3) = voltage;
        else
            y_level(i) = voltage;
        end
        cn=0;
        cn1=0;
    elseif bits(i)==0
        y_level(i) = 0;
    else 
        y_level(i) = -voltage;
        voltage=y_level(i);
    end
end

voltage=tmp;
Time=length(bits)/bit_rate; 
sampling_frequency = 1000;
sampling_period = 1/sampling_frequency;
time = 0:sampling_period:Time;
x = 1;

for i = 1:length(time)
    y_value(i)= y_level(x);
    if time(i)*bit_rate>=x
        x= x+1;
    end
end
     
plot(time,y_value);
axis([0 Time -voltage-2 voltage+2]);


% demodulation

i=1;
in=1;
tmp=sign;

for j=1:length(time)
  dm = y_value(j)/voltage;
  if time(j)*bit_rate>=in
      if dm==0
        ans_bits(in)=0;
      else
        ans_bits(in)=1;
        if tmp==dm&&in>3
            ans_bits(in) = 0;
            ans_bits(in-3) = 0;
        end
      end 
      
      if dm~=0
        tmp = dm;
      end
      in= in+1;
  end
end
 

disp('Demodulation : ')
disp(ans_bits)