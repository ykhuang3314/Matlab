%
% Hand calculation of Shunt feedback example 1
% Author: Saul Rodriguez
% Date: 2015-02-04
%
% Library: IL_3601_DAY2
% Cell: SHUNT1
%

clear all

gm = 1.576e-3
rds = 579303.50



RS = 10e3
RF = 100e3

VG = -rds*RS/(rds + RS + RF)

B = VG

AB = B*gm


Af = -RF*AB/(1-AB)
