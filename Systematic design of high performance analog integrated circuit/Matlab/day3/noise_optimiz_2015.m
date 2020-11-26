clear all
%Design independent parameters
k = 1.38e-23
T = 290
lambda = 2/3

% Design dependent parameters

%NMOS1: W1_tot = 20.00um  L1 = 0.18um  IDS1 = 1.0000mA  VDS1 = 0.50V
%  gm1 = 6.792m
%  rds1 = 1863.33
%  cgs1 = 18.80f
%  cgd1 = 6.24f
%  cds1 = 4.92f
%  cdb1 = 7.44f
%  vgs1 = 0.7162
%  Gain1 = 12.66
%  gm_id1 = 6.79
%  Ft1 = 43170.75 MHz 


Fc = 50e6 % 1/f noise corner frequency
gm = 6.792e-3
C = (18.8e-15 + 6.24e-15)

% Feedback Components
R1 = 400
R2 = 3.6e3

RP = R1*R2/(R1+R2) % Paralell combination of R1 and R2

Fmin = 1e3;
Fmax = 100e9;
Fstep = 1e6

f = Fmin:Fstep:Fmax; % Frequency of interest 10kHz to 5MHz
W = 2*pi*f;
N = length(f);

S = zeros(N,1);
S_V = zeros(N,1);
for i=1:N
    %Spectral noise power density (V^2/Hz)
    S(i) = 4*k*T*RP + 4*k*T*lambda/gm*(1+Fc/f(i))*(1 + W(i)^2*C^2*RP^2);
    
    %S(i) = 4*k*T*RP;
    
    %Spectral noise voltage (V/sqrt(Hz))
    S_V(i) = sqrt(S(i));
end

figure(1)
semilogx(f,S_V);
grid on

figure(2)
loglog(f,S_V)
grid on

Integrated_noise_2 = trapz(f,S)
Integrated_noise_Voltage = sqrt(Integrated_noise_2)
Integrated_noise_average = sqrt((Integrated_noise_2)/(Fmax-Fmin))

fprintf('Input referred integrated noise square = %4.2e V^2 \n', Integrated_noise_2)
fprintf('Input referred integrated noise = %4.2e V \n', Integrated_noise_Voltage)
fprintf('Average input referred voltage = %4.2e V/sqrt(Hz) \n', Integrated_noise_average)



