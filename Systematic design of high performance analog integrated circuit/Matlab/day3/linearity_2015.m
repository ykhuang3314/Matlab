% Linearity.m
% Author: Saul Rodriguez
% Date: 2012-02-16



% Polynomial coefficients for y =  ax + bx² + cx³

%Make sure there are weak non-linearities b,c < a/10!!

a = 1
b = .05
c = -.05

%Amplitude of an sinusoidal input
Vm = 0.5; %Amplitude of the tone


%Time domain output waveforms

t = 0:.01:20; % simulation time
N = length(t);

freq = 5;   % frequency
T = 1/freq;

x = Vm*sin(2*pi*t/T)

y = zeros(N,1);

for i=1:N,
    y(i) = a*x(i) + b*x(i)^2 + c*x(i)^3;
end

%Out/In transfer curve:

delta_in = 0.01
in = -2:delta_in:2;
M = length(in);
out = zeros(M,1);

for i=1:M,
    out(i) = a*in(i) + b*in(i)^2 + c*in(i)^3;
end

gain = diff(out)/delta_in;

figure(1);
plot(in(1:(M-1)),gain)
xlabel('Input (V)')
ylabel('Gain')
grid on

figure(2)
plot(t,y)
xlabel('time (S)')
ylabel('Amplitude (V)')
s = fft(y)/N;
s = s/Vm; %Normalization
sm = fftshift(s);

sm_dB = zeros(N,1)

for i=1:N,
    sm_dB(i) = 20*log10(abs(sm(i)));
end

figure(3)
plot(sm_dB)
axis([0 N -100 0])
grid on
xlabel('Discrete Frequency')
ylabel('Power (dB)')

% The following code requires that you write values for GQ,GP,and GN 
% taken with markers from Figure 1.
% GQ = gain at input 0 (biasing point)
% GP = gain at positive excursion to Vm
% GN = gain at negative excursion to -Vm

GQ = 4.984
GP = 5.0196
GN = 4.960

ep = (GQ-GP)/GQ
en = (GQ-GN)/GQ

d2 = abs((ep-en)/4)

d3 = abs((ep+en)/8)

d2_dB = 20*log10(d2)
d3_dB = 20*log10(d3)