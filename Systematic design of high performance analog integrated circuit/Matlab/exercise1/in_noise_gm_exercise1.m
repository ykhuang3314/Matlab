% Calculation of curves of input referred noise Exercise 1
% as a function of gm
% Author: Saul Rodriguez
% Date: 2020-01-15%

clear all;
  
%gm = 2e-3:2e-3:30e-3;  
%M = length(gm);
%Cg = 310e-15;
%fc = 4e6; 

 
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


gm = 1e-3:1e-3:30e-3; 
M = length(gm);

Cg = 1030e-15
fc = 2e6

Fmin = 100
Fmax = 30e6
%f = Fmin:100:Fmax;
f = logspace(log10(Fmin),log10(Fmax));
N = length(f);

inv = zeros(M,N);
in = zeros(M);

for i= 1:M,
 [inv(i,:),in(i)] = in_ex1(gm(i),Cg,fc,f);     
 %loglog(f,inv(i,:))
 semilogx (f,inv(i,:))
 grid on
 hold on
 fprintf('gm = %4.3f mS Average Integrated noise = %4.3f pA/sqrt(Hz)\n', 1e3*gm(i), 1e12*in(i)); 
 %pause;
 
end
xlabel('Frequency (Hz)')
ylabel('Input referred noise (A/sqrt(Hz)')
hold off
 
figure(2)
plot(gm,in)
xlabel('Transconductance (S)')
ylabel('')
grid on
