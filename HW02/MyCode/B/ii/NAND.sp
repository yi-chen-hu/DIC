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
.lib '../../../bulk_32nm.l' TT
.unprotect

********************************
**     Parameter setting      **
********************************
.global vdd! gnd!

.param wn1  = 64n
.param ln1  = 32n

.param wn2  = 64n
.param ln2  = 32n

.param wn3  = 64n
.param ln3  = 32n

.param wn4  = 64n
.param ln4  = 32n

.param wp1  = 64n
.param lp1  = 40n

.param wp2  = 64n
.param lp2  = 40n

********************************
**     Power declaration      **
********************************
vvdd vdd! 0 0.8v
vgnd gnd! 0 0v

********************************
**     Circuit description    **
********************************
.subckt NAND A B Y
MN1   Y A  n12 gnd! nmos_lvt w = wn1 l = ln1
MN2 n12 B gnd! gnd! nmos_lvt w = wn2 l = ln2
MN3   Y B  n34 gnd! nmos_lvt w = wn3 l = ln3
MN4 n34 A gnd! gnd! nmos_lvt w = wn4 l = ln4

MP1   Y A vdd! vdd! pmos_lvt w = wp1 l = lp1
MP2   Y B vdd! vdd! pmos_lvt w = wp2 l = lp2
.ends

XNAND VA VB VY NAND

********************************
**     Analysis setting       **
********************************
VVA VA gnd! 0.8
VVB VB gnd! 0.8
.probe power = par('-p(vvdd)')
.tran 0.01n 20n
.meas tran leakagepower AVG power from = 0.01n to = 10n

.end