********************************
**     Simulator setting      **
********************************
.option accurate
.option post
.op
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

.param xvdd = 0.9

.param wp   = 115n
.param wn   = 64n
.param lmin = 32n

********************************
**     Circuit description    **
********************************
.subckt inv in out
MP out in vdd! vdd! pmos_svt w = wp l = lmin
MN out in gnd! gnd! nmos_svt w = wn l = lmin
.ends

XINV A Y inv

********************************
**     Power declaration      **
********************************
VVDD vdd! 0 xvdd
VGND gnd! 0 0
VIN  A gnd!

********************************
**     Analysis setting       **
********************************
.dc vin 0 xvdd 0.01

.end