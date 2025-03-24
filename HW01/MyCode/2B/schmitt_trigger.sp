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
.lib '../../../bulk_32nm.l' TT
.unprotect

********************************
**     Parameter setting      **
********************************
.global vdd! gnd!

.param xvdd = 0.9
.param xvct = 0.9

.param wp1  = 64n
.param lp1  = 80n

.param wp2  = 64n
.param lp2  = 80n

.param wp3  = 64n
.param lp3  = 32n

.param wp4  = 64n
.param lp4  = 32n

.param wn1  = 90n
.param ln1  = 32n

.param wn2  = 50n
.param ln2  = 32n

.param wn3  = 800n
.param ln3  = 32n

.param wn4  = 800n
.param ln4  = 32n

********************************
**     Circuit description    **
********************************
.subckt schmitt_trigger ct in out
MP1 p12  in  vdd! vdd! pmos_svt w = wp1 l = lp1
MP2 out  in  p12  vdd! pmos_svt w = wp2 l = lp2
MP3 p12  out p34  vdd! pmos_svt w = wp3 l = lp3
MP4 p34  ct  gnd! vdd! pmos_svt w = wp4 l = lp4
MN1 n12  in  gnd! gnd! nmos_svt w = wn1 l = ln1
MN2 out  in  n12  gnd! nmos_svt w = wn2 l = ln2
MN3 n12  out n34  gnd! nmos_svt w = wn3 l = ln3
MN4 n34  ct  vdd! gnd! nmos_svt w = wn4 l = ln4
.ends

xschmitt_trigger vct A Y schmitt_trigger

********************************
**     Power declaration      **
********************************
VVDD vdd! 0 xvdd
VGND gnd! 0 0
VVCT vct  0 xvct

********************************
**     Analysis setting       **
********************************
V_RISE A gnd!
.dc V_RISE 0 xvdd 0.01

* V_FALL A gnd!
* .dc V_FALL xvdd 0 0.01

.probe i(xschmitt_trigger.MN2)
.probe i(xschmitt_trigger.MN4)

.end