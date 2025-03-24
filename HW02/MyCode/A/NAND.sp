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
.lib '../../bulk_32nm.l' TT
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
**     Circuit description    **
********************************
** .subckt NAND A B Y
** MN1   Y A  n12 gnd! nmos_lvt w = wn1 l = ln1
** MN2 n12 B gnd! gnd! nmos_lvt w = wn2 l = ln2
** MN3   Y B  n34 gnd! nmos_lvt w = wn3 l = ln3
** MN4 n34 A gnd! gnd! nmos_lvt w = wn4 l = ln4
** 
** MP1   Y A vdd! vdd! pmos_lvt w = wp1 l = lp1
** MP2   Y B vdd! vdd! pmos_lvt w = wp2 l = lp2
** .ends

.subckt NAND A Y
MN1   Y A  n12 gnd! nmos_lvt w = wn1 l = ln1
MN2 n12 A gnd! gnd! nmos_lvt w = wn2 l = ln2
MN3   Y A  n34 gnd! nmos_lvt w = wn3 l = ln3
MN4 n34 A gnd! gnd! nmos_lvt w = wn4 l = ln4

MP1   Y A vdd! vdd! pmos_lvt w = wp1 l = lp1
MP2   Y A vdd! vdd! pmos_lvt w = wp2 l = lp2
.ends

XNAND VA VY NAND

********************************
**     Power declaration      **
********************************
vvdd vdd! 0 0.8v
vgnd gnd! 0 0v

********************************
**     Analysis setting       **
********************************
VVA VA gnd!
.dc VVA 0v 0.8v 0.01v

* .dc VVA 0.8v 0v 0.01v


.end