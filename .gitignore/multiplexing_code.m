clear;
a = arduino('/dev/ttyACM0','uno');
clk_pin = 'D12';
latch_pin = 'D11';
data_pin = 'D8';
data =[1, 1 ,1 ,1;
        1, 1, 1, 1;
        1, 1, 1, 1;
        1, 1, 1, 1];
ano = data;
cat = ones(4,4);
for i = 1:4
    for j = 1:4
        if (i) == j
            cat(i,j) = 0;
        end
    end
end
clear i  j;
led_data = [cat,ano];
while 1
for line = 1 : 4
grp_shift(led_data(line,:),clk_pin,data_pin,a);
writeDigitalPin(a,latch_pin,0);
writeDigitalPin(a,latch_pin,1);
end
pause(1);
end
function [] = shift(data,clk_pin,data_pin,a)
writeDigitalPin(a,data_pin,data);
writeDigitalPin(a,clk_pin,0);
writeDigitalPin(a,clk_pin,1);
end
function [] = grp_shift(string,clk_pin,data_pin,a)
for i = 1 : length(string)
    shift(string(i),clk_pin,data_pin,a);
end
end
