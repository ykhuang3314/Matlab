clear all
%Design independent parameters
k = 1.38e-23
T = 290
lambda = 2/3

%Source resistance
RS = 10e3

%Feedback resistance
RF = 100e3

% Input transistor

% NMOS1: W1_tot = 100.00um  L1 = 1.00um  IDS1 = 0.1000mA  VDS1 = 0.50V
% gm1 = 1.576m
% rds1 = 579303.50
% cgs1 = 478.16f
% cgd1 = 33.11f
% cds1 = 229.60f
% cdb1 = 148.55f
% vgs1 = 0.4792
% Gain1 = 913.07
% gm_id1 = 15.76
% ; Ft1 = 490.65 MHz 

Fc = .1e6 % 1/f noise corner frequency
gm = 1.576e-3
C = (478e-15 + 33e-15)

Fmin = 0.1;
Fmax = 10e6;
%Fstep = 1e6

%f = Fmin:Fstep:Fmax; % Frequency of interest 0.1 Hz to 5MHz
f = logspace(log10(Fmin), log10(Fmax),40);
W = 2*pi*f;
N = length(f);

S = zeros(N,1);
S_V = zeros(N,1);

S_RS = zeros(N,1);
S_RF = zeros(N,1);
S_MOS = zeros(N,1);

for i=1:N,
    %Spectral noise power density (V^2/Hz)
    
    %S(i) = 4*k*T*RP + 4*k*T*lambda/gm*(1+Fc/f(i))*(1 + W(i)^2*C^2*RP^2);    
    %S(i) = 4*k*T*RP;
    
    S_RS(i) = 4*k*T/RS;
    S_RF(i) = 4*k*T/RF;
    S_MOS(i) = 4*k*T*lambda/gm*(1+ Fc/f(i))*( (1/RS+1/RF)^2 + (2*pi*f(i))^2*C^2 );
    
    %Spetral noise power (A²/Hz)
    S = S_RS + S_RF + S_MOS; 
    
    %Spectral noise current (A/sqrt(Hz))
    S_A(i) = sqrt(S(i));
end

figure(1)
semilogx(f,S_A,'b','LineWidth',2);
grid on
title('Input referred noise current A/sqrt(Hz)');

figure(2)
loglog(f,S_A,'b','LineWidth',2);
grid on
title('Input referred noise current A/sqrt(Hz)');

figure(3)
loglog(f,S,'b','LineWidth',2,
      f,S_RS,'r','LineWidth',2,
      f,S_RF,'g','LineWidth',2,
      f,S_MOS,'y','LineWidth',2)
grid on
title('Input referred noise power A^2/Hz');
legend('Total','RS','RF','MOS');

Integrated_noise_2 = trapz(f,S');
Integrated_noise_Voltage = sqrt(Integrated_noise_2);
Integrated_noise_average = sqrt((Integrated_noise_2)/(Fmax-Fmin))

fprintf('Input referred integrated noise square = %4.2e A^2 \n', Integrated_noise_2);
fprintf('Input referred integrated noise = %4.2e A \n', Integrated_noise_Voltage);
fprintf('Average input referred voltage = %4.2e A/sqrt(Hz) \n', Integrated_noise_average);



