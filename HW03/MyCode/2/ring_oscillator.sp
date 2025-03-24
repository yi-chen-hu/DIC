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
.subckt inverter A Y
MP Y A vdd! vdd! pmos_rvt nfin = 2
MN Y A gnd! gnd! nmos_rvt nfin = 1
.ends

xinv1  in1 out1 inverter
xinv2 out1 out2 inverter
xinv3 out2  in1 inverter

********************************
**     Analysis setting       **
********************************
.ic v(in1) = 0
.tran 0.1ps 100ps
.meas tran avgpwr AVG power from = 10p to = 90p
.meas tran peakpwr MAX power from = 10p to = 90p
.meas tran period trig V(out1) val = 0.4 rise = 2 targ V(out1) val = 0.4 rise = 3

.end