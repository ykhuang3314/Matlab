% function to calculate the input referred noise current 
% of Exercise 1 
% Author: Saul Rodriguez

function  [I_in,Integrated_noise_average] = in_ex1(gm,Cg,fc,f)

k = 1.3805e-23;
T = 300;

RS = 10e3;
CS = 10e-12;

R1 = 100e3;
R2 = 400;

N = length(f);

S_in = zeros(N,1);
I_in = zeros(N,1);


for i=1:N
   S_in(i) = 4*k*T*(1/RS + 1/(R1+R2) + (2/3)/gm*(1+fc/f(i))*((1/RS+ 1/(R1+R2))^2 + (2*pi*f(i))^2*(CS + Cg)^2) );
   I_in(i) = sqrt(S_in(i)); 
end


%semilogx(f,I_in);
%grid on

Integrated_noise_2 = trapz(f,S_in');
Integrated_noise_average = sqrt((Integrated_noise_2)/(f(N)-f(1)));
