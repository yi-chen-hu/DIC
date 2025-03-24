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
.global vdd! gnd!

.param xvdd = 0.9

.param wmin = 64n
.param lmin = 32n

********************************
**     Circuit description    **
********************************
M1 drain gate vdd! vdd! pmos_lvt w = wmin l = lmin

********************************
**     Power declaration      **
********************************
VDS drain vdd!
VGS gate  vdd!
VVDD vdd! 0 xvdd
VGND gnd! 0 0

********************************
**     Analysis setting       **
********************************
.dc VDS 0 -xvdd -0.01 sweep VGS 0.1 -xvdd -0.2
.probe i(M1)

.end