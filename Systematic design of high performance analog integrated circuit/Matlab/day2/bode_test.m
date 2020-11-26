% Define the polynomial constants
pkg load control

n1 = 1;
n0 = 0;
d2 = 1;
d1 = 1;
d0 = 1;

%%% Creating the transfer function
g = tf([n1 n0],[d2 d1 d0])

figure (1)
bode(g)
grid on

figure(2)
pzmap(g)
%grid on