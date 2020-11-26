clear all; 
close all;

filename = 'Test_4channel.txt';
Num_ch = 4;
format = '%u';
arraySize = [Num_ch inf];

% open file (read-only)
fileID = fopen(filename, 'r'); 
Data = fscanf(fileID, format, arraySize);
fclose(fileID);

% convert digital data into voltage value
V_FS = 2450; % The 16-bit ADC in the RHD2000 chips operates over a total voltage range of 2.45 V
Resolution = 16;
V_LSB = V_FS/(2^Resolution);
Vout = Data.*V_LSB;

[numRows, numCols] = size(Data);

% x axis calculation
spibits = 16;
fclk = 500*10^3;
fcmd = fclk/spibits;
fs = fcmd/Num_ch;
T = 1/fs;

x = [1:numCols];
t = x.*T;
xmax = numCols*T;

for i = 1 : numRows
   figure(i);
   plot(t, Vout(i,:));
   axis([0, xmax, 0, V_FS]);
   %xlabel('samples');
   xlabel('time(sec)');
   ylabel('voltage(mV)');
   name = sprintf('Channel %d', i);
   title(name);
end

