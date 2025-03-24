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

.param xvdd = 0.9v
.param wmin = 64n
.param lmin = 32n

.param wn1  = 100n
.param wn2  =  64n
.param wn3  = 100n
.param wn4  =  64n
.param wp1  =  64n
.param wp2  =  64n

********************************
**     Power declaration      **
********************************
vvdd vdd! 0 xvdd
vgnd gnd! 0 0

********************************
**     Circuit description    **
********************************
.subckt bitline_conditioner bit bit_b phi
    MP1 bit   phi vdd! vdd! pmos_svt w = wmin l = lmin
    MP2 bit_b phi vdd! vdd! pmos_svt w = wmin l = lmin
.ends

.subckt SRAM bit bit_b word
    MN1 A     A_b  gnd! gnd! nmos_svt w = wn1 l = lmin
    MN2 bit   word A    gnd! nmos_svt w = wn2 l = lmin
    MN3 A_b   A    gnd! gnd! nmos_svt w = wn3 l = lmin
    MN4 bit_b word A_b  gnd! nmos_svt w = wn4 l = lmin
    MP1 A     A_b  vdd! vdd! pmos_svt w = wp1 l = lmin
    MP2 A_b   A    vdd! vdd! pmos_svt w = wp2 l = lmin
.ends

xbitline_conditioner bit bit_b phi bitline_conditioner
xSRAM bit bit_b word SRAM


c1 bit   gnd! 3f
c2 bit_b gnd! 3f


********************************
**     Analysis setting       **
********************************
.ic v(xSRAM.A  ) =   0v
.ic v(xSRAM.A_b) = xvdd

.tran 1ps 500ps

vphi phi gnd! pwl
+   0ps   0v
+  80ps   0v
+ 100ps xvdd

vword word gnd! pwl
+   0ps   0v
+ 100ps   0v
+ 120ps xvdd


.end