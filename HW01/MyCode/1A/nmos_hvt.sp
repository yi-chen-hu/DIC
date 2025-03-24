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
.lib '../../../../bulk_32nm.l' TT
.unprotect

********************************
**     Parameter setting      **
********************************
.global gnd!

.param xvdd = 0.9

.param wmin = 64n
.param lmin = 32n

********************************
**     Circuit description    **
********************************
M1 drain gate gnd! gnd! nmos_hvt w = wmin l = lmin

********************************
**     Power declaration      **
********************************
VDS drain gnd!
VGS gate  gnd!
VGND gnd! 0 0

********************************
**     Analysis setting       **
********************************
.dc VDS 0 xvdd 0.01 sweep VGS 0.1 xvdd 0.2
.probe i(M1)

.end