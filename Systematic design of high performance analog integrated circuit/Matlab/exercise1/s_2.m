%SIGNAL PATH 1

% NMOS1: W1_tot = 800.00um  L1 = 0.35um  IDS1 = 0.8000mA  VDS1 = 0.50V
  gm1 = 15.871e-3
  rds1 = 17084.86
  cgs1 = 773.18e-15
  cgd1 = 264.04e-15
  cds1 = 280.63e-15
  cdb1 = 789.59e-15
  vgs1 = 0.4331
  Gain1 = 271.15
  gm_id1 = 19.84
  %Ft1 = 2435.24 MHz 

%PMOS1: W4_tot = 50.00um  L4 = 0.18um  IDS4 = 1.3000mA  VDS4 = 0.50V
  gm4 = 6.448e-3
  rds4 = 1384.77
  cgs4 = 58.14e-15
  cgd4 = 16.04e-15
  cds4 = 0.06e-15
  cdb4 = 43.70e-15
  vgs4 = -0.6735
  Gain4 = 8.93
  gm_id4 = 4.96
  Ft4 = 13833.46

RS = 10e3
CS = 10e-12

R1 = 100e3
R2 = 400
RL = 50

AB = -gm1*rds1*(gm4*R2/(1+gm4*R2))*(RS/(RS+R1))

P1 = 1/((2*pi)*(RS*R1/(RS+R1)*(CS+cgs1)))
P2 = 1/((2*pi)*rds1*(cds1 + cdb1 + cgd4))

BW = sqrt((1-AB)*P1*P2)
