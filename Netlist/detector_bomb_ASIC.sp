* detector_bomb_ASIC - cleaned for ALIGN
* Original: /mnt/c/Users/Nitro/Desktop/ASIC/xschem-master/Schematics/detector_bomb_ASIC.sch

.subckt detector_bomb_ASIC AND_OUT GRE_LED Sch_in BUZZER

* NAND-style logic block (net1, net2, net3 internal)
XM1  net1    Sch_in  net2    GND  sky130_fd_pr__nfet_01v8 L=150n W=420n nf=2 m=1
XM2  net3    Sch_in  VDD     VDD  sky130_fd_pr__pfet_01v8 L=150n W=420n nf=2 m=1
XM3  net1    Sch_in  net3    VDD  sky130_fd_pr__pfet_01v8 L=150n W=420n nf=2 m=1
XM4  VDD     net1    net2    GND  sky130_fd_pr__nfet_01v8 L=150n W=420n nf=2 m=1
XM5  GND     net1    net3    VDD  sky130_fd_pr__pfet_01v8 L=150n W=420n nf=2 m=1
XM6  net2    Sch_in  GND     GND  sky130_fd_pr__nfet_01v8 L=150n W=420n nf=2 m=1

* AND_OUT output buffer
XM7  AND_OUT net1    GND     GND  sky130_fd_pr__nfet_01v8 L=150n W=420n nf=2 m=1
XM8  AND_OUT net1    VDD     VDD  sky130_fd_pr__pfet_01v8 L=150n W=420n nf=2 m=1

* BUZZER driver
XM9  BUZZER  net4    GND     GND  sky130_fd_pr__nfet_01v8 L=150n W=420n nf=2 m=1
XM10 BUZZER  net4    VDD     VDD  sky130_fd_pr__pfet_01v8 L=150n W=420n nf=2 m=1
XM11 net4    AND_OUT VDD     VDD  sky130_fd_pr__pfet_01v8 L=150n W=420n nf=2 m=1
XM12 net4    AND_OUT VDD     VDD  sky130_fd_pr__pfet_01v8 L=150n W=420n nf=2 m=1
XM13 net4    AND_OUT net5    GND  sky130_fd_pr__nfet_01v8 L=150n W=420n nf=2 m=1
XM14 net5    AND_OUT GND     GND  sky130_fd_pr__nfet_01v8 L=150n W=420n nf=2 m=1

* GRE_LED driver
XM15 GRE_LED AND_OUT GND     GND  sky130_fd_pr__nfet_01v8 L=150n W=420n nf=2 m=1
XM16 GRE_LED AND_OUT VDD     VDD  sky130_fd_pr__pfet_01v8 L=150n W=420n nf=2 m=1

.ends detector_bomb_ASIC

.GLOBAL GND
.GLOBAL VDD
.end
