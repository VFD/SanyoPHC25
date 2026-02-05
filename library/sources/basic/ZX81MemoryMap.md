# ZX81 Memory Map

## Introduction

To help conversion for the PHC-25.

https://www.zx81stuff.org.uk/index.html

https://www.timexsinclair.com/downloadable-software/downloadable-software-for-the-ts-1000/index.html

https://retroisle.com/sinclair/zx81/general.php

https://www.zx81keyboardadventure.com/


## Map

Not sure...

| Start | End   | Size | Usage | Comment |
|-------|-------|------|-------|---------|
| 0000h | 1FFFh | 8Ko  | ROM   | 0-8191 |
| 2000h | 3FFFh | 8Ko  |       | 8192-16383 not used |
| 4000h | 407Fh | 128  | RAM   | 16384-16511 system |
| 4080h | 4398h | 1Ko  | VRAM  | 16384-17407 |
| 439Ah | 7FFFh | 15Ko | RAM   | 16384-32767 |


ZX81 charset is stored at 1E00h-1FFFh in BIOS ROM

4080h – 4398h VRAM+Halt?




The fully expanded VRAM size is 793 bytes (32x24 + 25 HALTs, almost occupying the whole 1Kbyte of internal RAM)\
076h for halt

43A0h - prog Basic?






A 64 K RAM pack actually provided a maximum of 56 K, as the system had to always have its 8 K of ROM code mapped to memory.


## ZX81 - PHC-25


| ZX81    | PHC-25  | Comment   |
|---------|---------|-----------|
| 32x24   | 32x16   | Text      |
| 256x192 | 256x192 | Graphic   |
| 3,25MHz |         | Frequency |

8x8px vs 8x12px -> -8 lignes

 0.8046 MHz in SLOW mode.
 

Sound great.

“Calculation of the start of the REM bytes, to launch the assembly program.

```basic
1 REM ....
10 LET A=PEEK 16389+256*PEEK 16390
20 PRINT "PROG=";A
30 LET B=A+5
40 RAND USR B
```


___