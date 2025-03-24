********************************
**     Simulator setting      **
********************************
.option accurate
.option post
.TEMP 25.0

********************************
**     Library setting        **
********************************
.protect
.include '../../7nm_files/7nm_FF_160803.pm'
.unprotect

********************************
**     Parameter setting      **
********************************
.global vdd! gnd!

.param xvdd = 0.8

********************************
**     Power declaration      **
********************************
vvdd vdd! 0 xvdd
vgnd gnd! 0 0

********************************
**     Circuit description    **
********************************
.subckt inverter in out
    MP out in vdd! vdd! pmos_rvt nfin = 2
    MN out in gnd! gnd! nmos_rvt nfin = 1
.ends

.subckt FA0 A B C carry_bar sum_bar
* begin of carry
    M1         n1         A vdd! vdd! pmos_rvt nfin = '4 * 1'
    M2         n1         B vdd! vdd! pmos_rvt nfin = '4 * 1'
    M3  carry_bar         C   n1 vdd! pmos_rvt nfin = '4 * 1'
    M4         n2         A vdd! vdd! pmos_rvt nfin = '4 * 1'
    M5  carry_bar         B   n2 vdd! pmos_rvt nfin = '4 * 1'
    M6  carry_bar         C   n3 gnd! nmos_rvt nfin = '2 * 1'
    M7         n3         A gnd! gnd! nmos_rvt nfin = '2 * 1'
    M8         n3         B gnd! gnd! nmos_rvt nfin = '2 * 1'
    M9  carry_bar         B   n4 gnd! nmos_rvt nfin = '2 * 1'
    M10        n4         A gnd! gnd! nmos_rvt nfin = '2 * 1'
* end of carry
* begin of sum
    M11        n5         A vdd! vdd! pmos_rvt nfin = 4
    M12        n5         B vdd! vdd! pmos_rvt nfin = 4
    M13        n5         C vdd! vdd! pmos_rvt nfin = 4
    M14   sum_bar carry_bar   n5 vdd! pmos_rvt nfin = 4
    M15        n6         A vdd! vdd! pmos_rvt nfin = 6
    M16        n7         B   n6 vdd! pmos_rvt nfin = 6
    M17   sum_bar         C   n7 vdd! pmos_rvt nfin = 6
    M18   sum_bar carry_bar   n8 gnd! nmos_rvt nfin = 2
    M19        n8         A gnd! gnd! nmos_rvt nfin = 2
    M20        n8         B gnd! gnd! nmos_rvt nfin = 2
    M21        n8         C gnd! gnd! nmos_rvt nfin = 2
    M22   sum_bar         C   n9 gnd! nmos_rvt nfin = 3
    M23        n9         B  n10 gnd! nmos_rvt nfin = 3
    M24       n10         A gnd! gnd! nmos_rvt nfin = 3
* end of sum
.ends

.subckt FA1 A B C carry_bar sum_bar
* begin of carry
    M1         n1         A vdd! vdd! pmos_rvt nfin = '4 * 2'
    M2         n1         B vdd! vdd! pmos_rvt nfin = '4 * 2'
    M3  carry_bar         C   n1 vdd! pmos_rvt nfin = '4 * 2'
    M4         n2         A vdd! vdd! pmos_rvt nfin = '4 * 2'
    M5  carry_bar         B   n2 vdd! pmos_rvt nfin = '4 * 2'
    M6  carry_bar         C   n3 gnd! nmos_rvt nfin = '2 * 2'
    M7         n3         A gnd! gnd! nmos_rvt nfin = '2 * 2'
    M8         n3         B gnd! gnd! nmos_rvt nfin = '2 * 2'
    M9  carry_bar         B   n4 gnd! nmos_rvt nfin = '2 * 2'
    M10        n4         A gnd! gnd! nmos_rvt nfin = '2 * 2'
* end of carry
* begin of sum
    M11        n5         A vdd! vdd! pmos_rvt nfin = 4
    M12        n5         B vdd! vdd! pmos_rvt nfin = 4
    M13        n5         C vdd! vdd! pmos_rvt nfin = 4
    M14   sum_bar carry_bar   n5 vdd! pmos_rvt nfin = 4
    M15        n6         A vdd! vdd! pmos_rvt nfin = 6
    M16        n7         B   n6 vdd! pmos_rvt nfin = 6
    M17   sum_bar         C   n7 vdd! pmos_rvt nfin = 6
    M18   sum_bar carry_bar   n8 gnd! nmos_rvt nfin = 2
    M19        n8         A gnd! gnd! nmos_rvt nfin = 2
    M20        n8         B gnd! gnd! nmos_rvt nfin = 2
    M21        n8         C gnd! gnd! nmos_rvt nfin = 2
    M22   sum_bar         C   n9 gnd! nmos_rvt nfin = 3
    M23        n9         B  n10 gnd! nmos_rvt nfin = 3
    M24       n10         A gnd! gnd! nmos_rvt nfin = 3
* end of sum
.ends

.subckt FA2 A B C carry_bar sum_bar
* begin of carry
    M1         n1         A vdd! vdd! pmos_rvt nfin = '4 * 3'
    M2         n1         B vdd! vdd! pmos_rvt nfin = '4 * 3'
    M3  carry_bar         C   n1 vdd! pmos_rvt nfin = '4 * 3'
    M4         n2         A vdd! vdd! pmos_rvt nfin = '4 * 3'
    M5  carry_bar         B   n2 vdd! pmos_rvt nfin = '4 * 3'
    M6  carry_bar         C   n3 gnd! nmos_rvt nfin = '2 * 3'
    M7         n3         A gnd! gnd! nmos_rvt nfin = '2 * 3'
    M8         n3         B gnd! gnd! nmos_rvt nfin = '2 * 3'
    M9  carry_bar         B   n4 gnd! nmos_rvt nfin = '2 * 3'
    M10        n4         A gnd! gnd! nmos_rvt nfin = '2 * 3'
* end of carry
* begin of sum
    M11        n5         A vdd! vdd! pmos_rvt nfin = 4
    M12        n5         B vdd! vdd! pmos_rvt nfin = 4
    M13        n5         C vdd! vdd! pmos_rvt nfin = 4
    M14   sum_bar carry_bar   n5 vdd! pmos_rvt nfin = 4
    M15        n6         A vdd! vdd! pmos_rvt nfin = 6
    M16        n7         B   n6 vdd! pmos_rvt nfin = 6
    M17   sum_bar         C   n7 vdd! pmos_rvt nfin = 6
    M18   sum_bar carry_bar   n8 gnd! nmos_rvt nfin = 2
    M19        n8         A gnd! gnd! nmos_rvt nfin = 2
    M20        n8         B gnd! gnd! nmos_rvt nfin = 2
    M21        n8         C gnd! gnd! nmos_rvt nfin = 2
    M22   sum_bar         C   n9 gnd! nmos_rvt nfin = 3
    M23        n9         B  n10 gnd! nmos_rvt nfin = 3
    M24       n10         A gnd! gnd! nmos_rvt nfin = 3
* end of sum
.ends

.subckt FA3 A B C carry_bar sum_bar
* begin of carry
    M1         n1         A vdd! vdd! pmos_rvt nfin = '4 * 4'
    M2         n1         B vdd! vdd! pmos_rvt nfin = '4 * 4'
    M3  carry_bar         C   n1 vdd! pmos_rvt nfin = '4 * 4'
    M4         n2         A vdd! vdd! pmos_rvt nfin = '4 * 4'
    M5  carry_bar         B   n2 vdd! pmos_rvt nfin = '4 * 4'
    M6  carry_bar         C   n3 gnd! nmos_rvt nfin = '2 * 4'
    M7         n3         A gnd! gnd! nmos_rvt nfin = '2 * 4'
    M8         n3         B gnd! gnd! nmos_rvt nfin = '2 * 4'
    M9  carry_bar         B   n4 gnd! nmos_rvt nfin = '2 * 4'
    M10        n4         A gnd! gnd! nmos_rvt nfin = '2 * 4'
* end of carry
* begin of sum
    M11        n5         A vdd! vdd! pmos_rvt nfin = '4 * 1'
    M12        n5         B vdd! vdd! pmos_rvt nfin = '4 * 1'
    M13        n5         C vdd! vdd! pmos_rvt nfin = '4 * 1'
    M14   sum_bar carry_bar   n5 vdd! pmos_rvt nfin = '4 * 1'
    M15        n6         A vdd! vdd! pmos_rvt nfin = '6 * 1'
    M16        n7         B   n6 vdd! pmos_rvt nfin = '6 * 1'
    M17   sum_bar         C   n7 vdd! pmos_rvt nfin = '6 * 1'
    M18   sum_bar carry_bar   n8 gnd! nmos_rvt nfin = '2 * 1'
    M19        n8         A gnd! gnd! nmos_rvt nfin = '2 * 1'
    M20        n8         B gnd! gnd! nmos_rvt nfin = '2 * 1'
    M21        n8         C gnd! gnd! nmos_rvt nfin = '2 * 1'
    M22   sum_bar         C   n9 gnd! nmos_rvt nfin = '3 * 1'
    M23        n9         B  n10 gnd! nmos_rvt nfin = '3 * 1'
    M24       n10         A gnd! gnd! nmos_rvt nfin = '3 * 1'
* end of sum
.ends

.subckt RCA A0 A1 A2 A3 B0 B1 B2 B3 Cin S0 S1 S2 S3 Cout
    xinverter1  A0  A0_  inverter
    xinverter2  B0  B0_  inverter
    xinverter3  Cin Cin_ inverter
                
    xinverter4  A1  A1_  inverter
    xinverter5  A1_ A1__ inverter
    xinverter6  B1  B1_  inverter
    xinverter7  B1_ B1__ inverter
                
    xinverter8  A2  A2_  inverter
    xinverter9  B2  B2_  inverter
    
    xinverter10 A3  A3_  inverter
    xinverter11 A3_ A3__ inverter
    xinverter12 B3  B3_  inverter
    xinverter13 B3_ B3__ inverter
    
    xFA0 A0_  B0_  Cin_  C1       S0     FA0
    xFA1 A1__ B1__ C1    C2       S1_bar FA1
    xFA2 A2_  B2_  C2    C3       S2     FA2
    xFA3 A3__ B3__ C3    Cout_bar S3_bar FA3
    
    xinverter14 S1_bar   S1   inverter
    xinverter15 S3_bar   S3   inverter
    xinverter16 Cout_bar Cout inverter
.ends

.subckt FO5 in
    xinverter1 in out1 inverter
    xinverter2 in out2 inverter
    xinverter3 in out3 inverter
    xinverter4 in out4 inverter
    xinverter5 in out5 inverter
.ends


xRCA A0 A1 A2 A3 B0 B1 B2 B3 Cin S0 S1 S2 S3 Cout RCA
xload1 S0   FO5
xload2 S1   FO5
xload3 S2   FO5
xload4 S3   FO5
xload5 Cout FO5

********************************
**     Analysis setting       **
********************************
.trans 1ps 16ns
V0 A0  gnd!   0v
V1 A1  gnd!   0v
V2 A2  gnd!   0v
V3 A3  gnd!   0v
V4 B0  gnd! xvdd
V5 B1  gnd! xvdd
V6 B2  gnd! xvdd
V7 B3  gnd! xvdd
V8 Cin gnd!   0v

.meas tran  LeakagePower AVG power from = 0ns to = 16ns

.end