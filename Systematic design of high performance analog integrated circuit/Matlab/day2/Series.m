%
% Hand calculation of Series feedback example
% Author: Saul Rodriguez
% Date: 2015-02-04
%
% Library: IL_3601_DAY2
% Cell: SERIES
%

clear all

gm = 6.792e-3
rds = 1863.3

RS = 1e3
RF = 1e3
RL = 10e3

VGS = -rds*RF/(rds + RL+ RF)

B = VGS

AB = B*gm


Af = (RL/RF)*(-AB)/(1-AB)


