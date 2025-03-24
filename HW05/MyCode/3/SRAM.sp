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
.param wmin =  64n
.param lmin =  32n

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

xSRAM00 bit bit_b W00 SRAM
xSRAM01 bit bit_b gnd! SRAM
xSRAM02 bit bit_b gnd! SRAM
xSRAM03 bit bit_b gnd! SRAM
xSRAM04 bit bit_b gnd! SRAM
xSRAM05 bit bit_b gnd! SRAM
xSRAM06 bit bit_b gnd! SRAM
xSRAM07 bit bit_b gnd! SRAM
xSRAM08 bit bit_b gnd! SRAM
xSRAM09 bit bit_b gnd! SRAM

xSRAM10 bit bit_b gnd! SRAM
xSRAM11 bit bit_b gnd! SRAM
xSRAM12 bit bit_b gnd! SRAM
xSRAM13 bit bit_b gnd! SRAM
xSRAM14 bit bit_b gnd! SRAM
xSRAM15 bit bit_b gnd! SRAM
xSRAM16 bit bit_b gnd! SRAM
xSRAM17 bit bit_b gnd! SRAM
xSRAM18 bit bit_b gnd! SRAM
xSRAM19 bit bit_b gnd! SRAM

xSRAM20 bit bit_b gnd! SRAM
xSRAM21 bit bit_b gnd! SRAM
xSRAM22 bit bit_b gnd! SRAM
xSRAM23 bit bit_b gnd! SRAM
xSRAM24 bit bit_b gnd! SRAM
xSRAM25 bit bit_b gnd! SRAM
xSRAM26 bit bit_b gnd! SRAM
xSRAM27 bit bit_b gnd! SRAM
xSRAM28 bit bit_b gnd! SRAM
xSRAM29 bit bit_b gnd! SRAM

xSRAM30 bit bit_b gnd! SRAM
xSRAM31 bit bit_b gnd! SRAM
xSRAM32 bit bit_b gnd! SRAM
xSRAM33 bit bit_b gnd! SRAM
xSRAM34 bit bit_b gnd! SRAM
xSRAM35 bit bit_b gnd! SRAM
xSRAM36 bit bit_b gnd! SRAM
xSRAM37 bit bit_b gnd! SRAM
xSRAM38 bit bit_b gnd! SRAM
xSRAM39 bit bit_b gnd! SRAM

xSRAM40 bit bit_b gnd! SRAM
xSRAM41 bit bit_b gnd! SRAM
xSRAM42 bit bit_b gnd! SRAM
xSRAM43 bit bit_b gnd! SRAM
xSRAM44 bit bit_b gnd! SRAM
xSRAM45 bit bit_b gnd! SRAM
xSRAM46 bit bit_b gnd! SRAM
xSRAM47 bit bit_b gnd! SRAM
xSRAM48 bit bit_b gnd! SRAM
xSRAM49 bit bit_b gnd! SRAM

xSRAM50 bit bit_b gnd! SRAM
xSRAM51 bit bit_b gnd! SRAM
xSRAM52 bit bit_b gnd! SRAM
xSRAM53 bit bit_b gnd! SRAM
xSRAM54 bit bit_b gnd! SRAM
xSRAM55 bit bit_b gnd! SRAM
xSRAM56 bit bit_b gnd! SRAM
xSRAM57 bit bit_b gnd! SRAM
xSRAM58 bit bit_b gnd! SRAM
xSRAM59 bit bit_b gnd! SRAM

xSRAM60 bit bit_b gnd! SRAM
xSRAM61 bit bit_b gnd! SRAM
xSRAM62 bit bit_b gnd! SRAM
xSRAM63 bit bit_b gnd! SRAM

c1 bit_b gnd! 3f
c2 bit   gnd! 3f

********************************
**     Analysis setting       **
********************************
.tran 1ps 300ps

vphi phi gnd! pwl
+    0ps   0v
+   80ps   0v
+  100ps xvdd

vw00 W00 gnd! pwl
+   0ps   0v
+ 100ps   0v
+ 120ps xvdd

.ic v(xSRAM00.A  ) =   0v
.ic v(xSRAM00.A_b) = xvdd

.ic v(xSRAM01.A  ) = xvdd
.ic v(xSRAM02.A  ) = xvdd
.ic v(xSRAM03.A  ) = xvdd
.ic v(xSRAM04.A  ) = xvdd
.ic v(xSRAM05.A  ) = xvdd
.ic v(xSRAM06.A  ) = xvdd
.ic v(xSRAM07.A  ) = xvdd
.ic v(xSRAM08.A  ) = xvdd
.ic v(xSRAM09.A  ) = xvdd
.ic v(xSRAM10.A  ) = xvdd
.ic v(xSRAM11.A  ) = xvdd
.ic v(xSRAM12.A  ) = xvdd
.ic v(xSRAM13.A  ) = xvdd
.ic v(xSRAM14.A  ) = xvdd
.ic v(xSRAM15.A  ) = xvdd
.ic v(xSRAM16.A  ) = xvdd
.ic v(xSRAM17.A  ) = xvdd
.ic v(xSRAM18.A  ) = xvdd
.ic v(xSRAM19.A  ) = xvdd
.ic v(xSRAM20.A  ) = xvdd
.ic v(xSRAM21.A  ) = xvdd
.ic v(xSRAM22.A  ) = xvdd
.ic v(xSRAM23.A  ) = xvdd
.ic v(xSRAM24.A  ) = xvdd
.ic v(xSRAM25.A  ) = xvdd
.ic v(xSRAM26.A  ) = xvdd
.ic v(xSRAM27.A  ) = xvdd
.ic v(xSRAM28.A  ) = xvdd
.ic v(xSRAM29.A  ) = xvdd
.ic v(xSRAM30.A  ) = xvdd
.ic v(xSRAM31.A  ) = xvdd
.ic v(xSRAM32.A  ) = xvdd
.ic v(xSRAM33.A  ) = xvdd
.ic v(xSRAM34.A  ) = xvdd
.ic v(xSRAM35.A  ) = xvdd
.ic v(xSRAM36.A  ) = xvdd
.ic v(xSRAM37.A  ) = xvdd
.ic v(xSRAM38.A  ) = xvdd
.ic v(xSRAM39.A  ) = xvdd
.ic v(xSRAM40.A  ) = xvdd
.ic v(xSRAM41.A  ) = xvdd
.ic v(xSRAM42.A  ) = xvdd
.ic v(xSRAM43.A  ) = xvdd
.ic v(xSRAM44.A  ) = xvdd
.ic v(xSRAM45.A  ) = xvdd
.ic v(xSRAM46.A  ) = xvdd
.ic v(xSRAM47.A  ) = xvdd
.ic v(xSRAM48.A  ) = xvdd
.ic v(xSRAM49.A  ) = xvdd
.ic v(xSRAM50.A  ) = xvdd
.ic v(xSRAM51.A  ) = xvdd
.ic v(xSRAM52.A  ) = xvdd
.ic v(xSRAM53.A  ) = xvdd
.ic v(xSRAM54.A  ) = xvdd
.ic v(xSRAM55.A  ) = xvdd
.ic v(xSRAM56.A  ) = xvdd
.ic v(xSRAM57.A  ) = xvdd
.ic v(xSRAM58.A  ) = xvdd
.ic v(xSRAM59.A  ) = xvdd
.ic v(xSRAM60.A  ) = xvdd
.ic v(xSRAM61.A  ) = xvdd
.ic v(xSRAM62.A  ) = xvdd
.ic v(xSRAM63.A  ) = xvdd

.end