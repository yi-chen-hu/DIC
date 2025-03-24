# Tutorial Update

## pp.7

把 `$./pdfInstall.pl` 改成 `$./pdkInstall.pl`

## pp.8

如果找不到 .cdsinit，自己新增一個 .cdsinit，再把 tutorial 所要求的新增內容寫在 .cdsinit 裡

## pp.9

`$source /ADFP/cshrc/ADFP_FC_Tool.cshrc` 改成 `$source /ADFP/cshrc/ADFP_Tool.cshrc`

## pp.56

加上指令 `$StarXtract -clean star_cmd`

# Notification

## pp.26-pp.29

Tutorial 是示範用 M2 來創 input port，但其實可以只用 M1 來創 input port 就好。

## pp.32

Tutorial 只示範了 PMOS 那側的 guard ring，NMOS 的 guard ring 有些設定上的不同

- Device: GR_PSub_CPO
- Net Name: VSS
- VT Layer: VTS_N

Guard ring 的寬度是最左側 dummy 到最右側 dummy

## pp.55

- 在 ./PEX/CCI_FLOW 下跑 `$calibre–query ./svdb/ < query_cmd`
- pin_order.sp 中預設是寫 `.subckt inv I Z VDD VSS`，請把它改成你自己在 sp 檔裡的宣告
- star_cmd 中的 BLOCK 一樣要改成你的 cell 的名字

## Open Virtuoso

每次開啟 Virtuoso 之前一定要先 cd 到 ./N16ADFP_iPDK 然後 `$source /ADFP/cshrc/ADFP_Tool.cshrc` 才能 `$virtuoso &`

否則你開啟的 Virtuoso 會有問題

## Schematic

在 create pin 時，VDD 跟 VSS 的 signal type 一樣是 signal，不要選成 power 或 ground

## Pre-sim

請另外創一個 testbench.sp 來寫 pattern，再 include inv.sp 進來

## Show Internal Layout

`ctrl` + `f` 可以顯示被隱藏起來的 layout

## LVS

- "XDB Database not available: No comparison was made": Layout 上有某些 input 與 output 沒有創建 label (e.g. VSS 或 VDD)
- 在給 IO 打 label 時，Select Layer 一定要選 pin (如 pp.29)，否則 LVS 會跑不過
