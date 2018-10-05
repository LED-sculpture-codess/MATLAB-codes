a = [1 1 0 0 1 1 0 0];
arduino = serial('/dev/tty.usbmodem14201','BaudRate',9600); % create serial communication object 
fopen(arduino); % initiate arduino communication
for b = 1:8
    fprintf(arduino, '%d', a(b)); % send answer variable content to arduino
end
fclose(arduino);
