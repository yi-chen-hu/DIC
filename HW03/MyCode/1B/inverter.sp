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

.param xvdd      = 0.8
.param nfin_pmos = 2

********************************
**     Power declaration      **
********************************
vvdd vdd! 0 xvdd
vgnd gnd! 0 0

********************************
**     Circuit description    **
********************************
.subckt inverter A Y
MP Y A vdd! vdd! pmos_rvt nfin = nfin_pmos
MN Y A gnd! gnd! nmos_rvt nfin = 1
.ends

xinv in out inverter

********************************
**     Analysis setting       **
********************************
VIN in gnd!
.dc VIN 0 xvdd 0.01

.end