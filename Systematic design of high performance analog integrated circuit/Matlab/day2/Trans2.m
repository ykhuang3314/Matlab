clear all

gm = 6.792e-3
rds = 1863.3

RS = 10e3
RF = 10e3

VG = -rds^3*gm^2*RS/(rds + RS + RF)

B = VG

AB = B*gm

Af = AB/(1-AB)*RF
