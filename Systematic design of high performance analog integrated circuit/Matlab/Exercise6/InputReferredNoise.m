% Calculation of input referred noise
% Exercise 6
% Author: Yu-Kai Huang
% Date: 2020-03-09

close all; 
clear all;

k = 1.3805e-23;
T = 300;
garma = 2/3;

Cs = 10e-12;

R1 = 1e3;
R2 = 4e3;
 
%  NMOS1: W1_tot = 400.00um  L1 = 0.35um  IDS1 = 0.6000mA  VDS1 = 0.50V
%  gm1 = 11.178m
%  rds1 = 23424.63
%  cgs1 = 500.14f
%  cgd1 = 132.04f
%  cds1 = 201.76f
%  cdb1 = 411.72f
%  vgs1 = 0.4547
%  Gain1 = 261.84
%  gm_id1 = 18.63
%  Ft1 = 2814.17 MHz 

gm = 11.178e-3;
Cg = 632.18e-15/2;
fc = 8e6;


Fmin = 1e6
Fmax = 30e6

%f = Fmin:100:Fmax;
f = logspace(log10(Fmin),log10(Fmax));

N = length(f)

S_in = zeros(N,1);
V_in = zeros(N,1);


for i=1:N
   S_in(i) = 4*k*T*(R1*R2/(R1+R2) + garma/gm*(1+fc/f(i))*((2 + (Cg/(2*Cs)))^2 + (2*pi*f(i))^2 * Cg^2 *(R1*R2/(2*(R1+R2)))^2));
   V_in(i) = sqrt(S_in(i)); 
end


semilogx(f,V_in);
grid on
xlabel('Frequency (Hz)')
ylabel('Input referred noise (Vreth/sqrt(Hz)')


Integrated_noise_2 = trapz(f,S_in')
Integrated_noise = sqrt(Integrated_noise_2)
Integrated_noise_average = sqrt((Integrated_noise_2)/(Fmax-Fmin))
Noise_fb_res = 4*k*T*(R1*R2/(R1+R2))
