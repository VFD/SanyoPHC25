# Pour Extension PSG01

# Introduction

Nouvelle extension developpé par 6502man.

Son et port joystick.

Code assembleur à ajouter à la ROM 1.4

```asm
PSGREG    .EQU $C1
PSGDAT    .EQU $C0
    .ORG $0000
    ; destroy  A, B ,C
    LD A,7
    OUT (PSGREG),A     ; write registre
    IN A,(PSGDAT)  
    OR $C0
    LD B,A
    LD A,7
    OUT (PSGREG),A     ; write registre
    LD A,B
    OUT (PSGDAT),A

    LD A,$0E
    OUT (PSGREG),A    ; write registre
    IN A,(PSGDAT)  
    LD B,A

    LD A,$0F
    OUT (PSGREG),A    ; write registre        
    IN A,(PSGDAT)  
    LD C,A

    RET
```
Il faut changer le ORG pour pointer sur la bonne zone de la ROM.



___
