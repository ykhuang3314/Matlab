% function to calculate the input referred noise current 
% of Exercise 1 
% Author: Saul Rodriguez

function  [V_in,Integrated_noise_average] = Vn_ex6(gm,Cg,fc,f)

k = 1.3805e-23;
T = 300;
garma = 2/3;
Cs = 10e-12;

R1 = 1e3;
R2 = 4e3;

N = length(f);

S_in = zeros(N,1);
V_in = zeros(N,1);


for i=1:N
   S_in(i) = 4*k*T*(R1*R2/(R1+R2) + garma/gm*(1+fc/f(i))*((2 + (Cg/(2*Cs)))^2 + (2*pi*f(i))^2 * Cg^2 *(R1*R2/(2*(R1+R2)))^2));
   V_in(i) = sqrt(S_in(i)); 
end


Integrated_noise_2 = trapz(f,S_in');
Integrated_noise_average = sqrt((Integrated_noise_2)/(f(N)-f(1)));
