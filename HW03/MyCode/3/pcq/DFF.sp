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
.param fin_inv1     = 5
.param fin_trans1   = 1
.param fin_inv2     = 2
.param fin_tri_inv1 = 1
.param fin_trans2   = 1
.param fin_inv3     = 3
.param fin_inv4     = 2
.param fin_tri_inv2 = 1
.param fin_inv5     = 3

********************************
**     Power declaration      **
********************************
vvdd vdd! 0 xvdd
vgnd gnd! 0 0

********************************
**     Circuit description    **
********************************
.subckt inverter in out fin = 1
MP out in vdd! vdd! pmos_rvt nfin = 'fin'
MN out in gnd! gnd! nmos_rvt nfin = 'fin'
.ends

.subckt transmission_gate pmos_gate nmos_gate in out fin = 1
MP out pmos_gate in vdd! pmos_rvt nfin = 'fin'
MN out nmos_gate in gnd! nmos_rvt nfin = 'fin'
.ends

.subckt tristate_inverter en en_bar in out fin = 1
MP1  n1     in vdd! vdd! pmos_rvt nfin = 'fin'
MP2 out en_bar   n1 vdd! pmos_rvt nfin = 'fin' 
MN1 out     en   n2 gnd! nmos_rvt nfin = 'fin'
MN2  n2     in gnd! gnd! nmos_rvt nfin = 'fin'
.ends

.subckt DFF D phi phi_bar Q Q_bar
xinverter1 
+ D
+ inv1_out
+ inverter
+ fin = 'fin_inv1'

xtransmission_gate1
+ phi
+ phi_bar
+ inv1_out
+ trans1_out
+ transmission_gate
+ fin = 'fin_trans1'

xinverter2
+ trans1_out
+ inv2_out
+ inverter
+ fin = 'fin_inv2'

xtristate_inverter1
+ phi
+ phi_bar
+ inv2_out
+ trans1_out
+ tristate_inverter
+ fin = 'fin_tri_inv1'

xtransmission_gate2
+ phi_bar
+ phi
+ inv2_out
+ trans2_out
+ transmission_gate
+ fin = 'fin_trans2'

xinverter3
+ trans2_out
+ Q_bar
+ inverter
+ fin = 'fin_inv3'

xinverter4
+ trans2_out
+ inv4_out
+ inverter
+ fin = 'fin_inv4'

xinverter5
+ inv4_out
+ Q
+ inverter
+ fin = 'fin_inv5'

xtristate_inverter2
+ phi_bar
+ phi
+ inv4_out
+ trans2_out
+ tristate_inverter
+ fin = 'fin_tri_inv2'
.ends

xdff D phi phi_bar Q Q_bar DFF

xinverter1 Q out1 inverter fin = '1'
xinverter2 Q out2 inverter fin = '1'
xinverter3 Q out3 inverter fin = '1'
xinverter4 Q out4 inverter fin = '1'

xinverter5 Q out5 inverter fin = '1'
xinverter6 Q out6 inverter fin = '1'
xinverter7 Q out7 inverter fin = '1'
xinverter8 Q out8 inverter fin = '1'

********************************
**     Analysis setting       **
********************************
.tran 1ps 10ns

vd       D       gnd! pulse(  0v   xvdd 0.5ns 0.1ns 0.1ns 2ns 4ns)
vphi     phi     gnd! pulse(  0v   xvdd   0ns 0.1ns 0.1ns 1ns 2ns)
vphi_bar phi_bar gnd! pulse(xvdd     0v   0ns 0.1ns 0.1ns 1ns 2ns)

.end