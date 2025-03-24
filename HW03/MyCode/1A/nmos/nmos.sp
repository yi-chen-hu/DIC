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
.include '../../../7nm_files/7nm_FF_160803.pm'
.unprotect

********************************
**     Parameter setting      **
********************************
.global vdd! gnd!

.param xvdd = 0.8
.param xvgs = 0.35

********************************
**     Power declaration      **
********************************
vvdd vdd! 0 xvdd
vgnd gnd! 0 0

********************************
**     Circuit description    **
********************************
M1 drain gate gnd! gnd! nmos_rvt nfin = 1

********************************
**     Analysis setting       **
********************************
VGS gate  gnd! xvgs
VDS drain gnd!
.dc VDS 0 xvdd 0.01
.probe i(M1)

.end