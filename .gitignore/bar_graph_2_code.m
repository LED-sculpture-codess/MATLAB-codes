%plots  one sided frequency graph
clear;
file_name = 'despacito_1_min.wav';
%y is the audio data in time domain
%Fs is the sampling frequency,1/time between two samples
[y,Fs] = audioread(file_name);
%samp_period time period at which we are samping
len = length(y);
samp_period = 0.05;
samp_freq =1/samp_period;
step = samp_period*Fs;
clear y Fs
klow=1;
y_index = 1;
net = zeros([(len/step) 8]);
for kup = step:step:len
    clf; %clears the frame
    sample = [klow, kup];
    klow = kup;
    [y,Fs] = audioread(file_name,sample);
    Y = fft(y);
    Y = abs(Y);
    %disp(Y');
    l = length(Y);
    Y = Y(1:(round(l/2)+1)); %round rounds the data to nearest integer 
    %f is frequencies obtained in fft
    f = linspace(0,1,(l/2)+1)*Fs/2;  
    x_index = 1;
    for higher = [11, 26, 51, 101, 251, 501, 1001,length(Y)]
        if higher == 11
                lower = 1;
        end
        lower = higher;
        net(y_index,x_index) = max(Y(lower:higher));
        x_index = x_index + 1;
    end
    y_index = y_index + 1;
end
glob_max = max(max(net));
for i = [1:size(net,1)]
    bar(net(i,1:8));
    ylim([0 glob_max]);
    pause on;
    pause(0.001);     
end
