% Neg_Feedbac.m
% Author: Saul Rodriguez
% Date: 2011-08-31

% This script shows the root-locus of in negative feedback systems. The
% Loop gain of the system (AB) can contain 0-1 zeros and 1-3 poles
% Instructions:
% 1) Define the position of the zeros (n) and poles (p)
% 2) Comment/Uncomment the ZERO/POLE assignemts for the numerator (NAB) or
% denominator (DAB)
% 3) Assign a value to the DC loop gain AB0
% 4) Execute the script

% 1) Define the zeros and poles
clear all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here you can modify zeros (n) and
% poles (p) of AB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load control


n1 = -10e3;
n2 = -1;

p1 = -1e3;
p2 = -5e3;
p3 = -15e3;

% POLES in AB
DABP1 = tf([-1/p1 1],1);
DABP2 = tf([-1/p2 1],1);
DABP3 = tf([-1/p3 1],1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comment/Uncomment the following 
% lines to add/removes zero/poles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% NO ZERO in AB
%NAB = 1;

% SINGLE ZERO in AB
NAB = tf([-1/n1 1],1)

% SINGLE POLE in AB
%DAB = DABP1;

% TWO POLE in AB
%DAB = DABP1*DABP2;

% THREE POLE in AB
DAB = DABP1*DABP2*DABP3

% define the DC loop gain AB0
AB0 = 60;

ab0 = 0:-.5:-AB0
N = length(ab0)

for i=1:N,

    % Create the loop gain polynomial
    AB = ab0(i)*NAB/DAB;

    %%% Creating the transfer function
    %g = tf([n1 n0],[d2 d1 d0])
    %F = AB
    F = -AB/(1-AB);
    %F = NAB/(DAB - NAB)

    figure(1);
    pzmap(F);
    hold on;
    pause;
end

hold off;

