%NMOS1: W1_tot = 400.00um  L1 = 0.50um  IDS1 = 0.8000mA  VDS1 = 0.50V
  gm1 = 13.674e-3
  rds1 = 3683.41
  cgs1 = 812.48e-15
  cgd1 = 129.15e-15
  cds1 = 290.31e-15
  cdb1 = 186.34e-15
  vgs1 = 0.4657
  Gain1 = 50.37
  gm_id1 = 17.09
%  Ft1 = 2311.17 MHz 

%PMOS1: W4_tot = 400.00um  L4 = 0.50um  IDS4 = 1.2000mA  VDS4 = 0.60V
%  gm4 = 9.8175e-3
%  rds4 = 8547.50
%  cgs4 = 1019.04e-15
%  cgd4 = 137.91e-15
%  cds4 = 424.33e-15
%  cdb4 = 214.57e-15
%  vgs4 = -0.6376
%  Gain4 = 83.91
%  gm_id4 = 8.18
%  Ft4 = 1350.52 MHz 

%;PMOS1: W4_tot = 400.00um  L4 = 0.25um  IDS4 = 1.2000mA  VDS4 = 0.60V
  gm4 = 13.9382e-3
  rds4 = 3549.92
  cgs4 = 486.62e-15
  cgd4 = 134.29e-15
  cds4 = 160.72e-15
  cdb4 = 147.68e-15
  vgs4 = -0.5609
  Gain4 = 49.48
  gm_id4 = 11.62
%;  Ft4 = 3572.68 MHz 

RS = 10e3
CS = 10e-12

R1 = 100e3
R2 = 400
RL = 50
AB = -(gm1^2*gm4*rds1^2*rds4*R2*RS)/((2*rds4+R2+RL)*(RS+R1))

P1 = 1/((2*pi)*(RS*R1/(RS+R1)*(CS+cgs1 + 2*cgd1)))
%P2 = 1/((2*pi)*gm1*rds1^2*(cds1 + cdb1 + cgs4/2+cgd4/2*(1+gm4/2*(RL+R2))))
P2 = 1/((2*pi)*gm1*rds1^2*(cgd1 + cgs4/2+cgd4/2*(1+gm4/2*(RL+R2))))

%P2_1 = 1/((2*pi)*rds1*(cgs4/2+cgd4/2*(1+gm4/2*(RL+R2))))
BW = sqrt((1-AB)*P1*P2)