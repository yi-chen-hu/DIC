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

MN1 A     A_b  gnd! gnd! nmos_svt w = wn1 l = lmin
MN2 bit   word A    gnd! nmos_svt w = wn2 l = lmin
MN3 A_b   A    gnd! gnd! nmos_svt w = wn3 l = lmin
MN4 bit_b word A_b  gnd! nmos_svt w = wn4 l = lmin
MP1 A     A_b  vdd! vdd! pmos_svt w = wp1 l = lmin
MP2 A_b   A    vdd! vdd! pmos_svt w = wp2 l = lmin

xbitline_conditioner bit bit_b phi bitline_conditioner

c1 bit   gnd! 3f
c2 bit_b gnd! 3f

********************************
**     Analysis setting       **
********************************
vphi phi gnd! xvdd
vw word gnd! xvdd
.ic V(bit  ) = xvdd
.ic V(bit_b) = xvdd

* VA A gnd!
* .dc VA 0  xvdd  0.01
* .print V(A_b)

VA_b A_b gnd!
.dc VA_b 0  xvdd  0.01
.print V(A)


.end