% Calculation of curves of input referred noise Exercise 6
% as a function of gm
% Author: Yu-Kai Huang
% Date: 2020-03-10%

close all; clear all;
  
%gm = 2e-3:2e-3:30e-3;  
%M = length(gm);
%Cg = 310e-15;
%fc = 4e6; 

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


gm = 1e-3:1e-3:30e-3; 
M = length(gm);

Cg = 632.18e-15/2
fc = 10e7

Fmin = 10e6
Fmax = 30e6
f = logspace(log10(Fmin),log10(Fmax));
N = length(f);

vn = zeros(M,N);
vn_avg = zeros(M);

for i= 1:M
 [vn(i,:),vn_avg(i)] = Vn_ex6(gm(i),Cg,fc,f);     
 %loglog(f,inv(i,:))
 semilogx (f,vn(i,:))
 grid on
 hold on
 fprintf('gm = %4.3f mS Average Integrated noise = %4.3f nV/sqrt(Hz)\n', 1e3*gm(i), 1e9*vn_avg(i)); 
 %pause;
 
end
xlabel('Frequency (Hz)')
ylabel('Input referred noise (V/sqrt(Hz)')
hold off
 
figure(2)
plot(gm,vn_avg)
xlabel('Transconductance (S)')
ylabel('Average noise spectral density')
grid on