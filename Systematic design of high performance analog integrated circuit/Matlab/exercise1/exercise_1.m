% Calculation of input referred noise
% Exercise 1
% Author: Saul Rodriguez
% Date: 2020-01-15
%

k = 1.3805e-23
T = 300

RS = 10e3
CS = 10e-12

R1 = 100e3
R2 = 400
 
% NMOS1: W1_tot = 800.00um  L1 = 0.35um  IDS1 = 0.8000mA  VDS1 = 0.50V
%  gm1 = 15.871m
%  rds1 = 17084.86
%  cgs1 = 773.18f
%  cgd1 = 264.04f
%  cds1 = 280.63f
%  cdb1 = 789.59f
%  vgs1 = 0.4331
%  Gain1 = 271.15
%  gm_id1 = 19.84
%  Ft1 = 2435.24 MHz 

gm = 15.871e-3
Cg = 1030e-15
fc = 2e6


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% NMOS1: W1_tot = 100.00um  L1 = 1.00um  IDS1 = 0.1000mA  VDS1 = 0.50V
%  gm1 = 1.576m
%  rds1 = 579303.50
%  cgs1 = 478.16f
%  cgd1 = 33.11f
%  cds1 = 229.60f
%  cdb1 = 148.55f
%  vgs1 = 0.4792
%  Gain1 = 913.07
%  gm_id1 = 15.76
%  Ft1 = 490.65 MHz 
%fc = 800k

%gm = 5.0e-3
%Cg = 510e-15
%fc = 800e3


Fmin = 100
Fmax = 30e6

%f = Fmin:100:Fmax;
f = logspace(log10(Fmin),log10(Fmax));

N = length(f)

S_in = zeros(N,1);
I_in = zeros(N,1);


for i=1:N
   S_in(i) = 4*k*T*(1/RS + 1/(R1+R2) + (2/3)/gm*(1+fc/f(i))*((1/RS+ 1/(R1+R2))^2 + (2*pi*f(i))^2*(CS + Cg)^2) );

%   S_in(i) = 4*k*T*(1/RS + 1/(R1+R2)); % + (2/3)/gm*(1+fc/f(i))*((1/RS+ 1/(R1+R2))^2 + (2*pi*f(i))^2*(CS + Cg)^2) );
   I_in(i) = sqrt(S_in(i)); 
end


semilogx(f,I_in);
grid on
xlabel('Frequency (Hz)')
ylabel('Input referred noise (A/sqrt(Hz)')

Integrated_noise_2 = trapz(f,S_in')
Integrated_noise = sqrt(Integrated_noise_2)
Integrated_noise_average = sqrt((Integrated_noise_2)/(Fmax-Fmin))
