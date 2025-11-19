# Pour Extension PSG01

# Introduction

Nouvelle extension developpé par 6502man.

Son et port joystick.

Code assembleur à ajouter à la ROM 1.4

```asm
PSGREG    .EQU $C1
PSGDAT    .EQU $C0

; 31 octets en toute fin de ROM de $5FE1 à 5FFF.
    .ORG $5FE1
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

Prévision en toutes fin de ROM. Code modifié.

Appel par CALL $5FE1.\

Assemblé:

```
0000                PSGREG:   EQU   $C1   
0000                PSGDAT:   EQU   $C0   
0000                          ; 31 octets en toute fin de ROM de $5FE1 à 5FFF.
5FE1                          .ORG   $5FE1   
5FE1                          ; destroy  A, B ,C
5FE1   3E 07                  LD   A,7   
5FE3   D3 C1                  OUT   (PSGREG),A   ; write registre
5FE5   DB C0                  IN   A,(PSGDAT)   
5FE7   F6 C0                  OR   $C0   
5FE9   47                     LD   B,A   
5FEA   3E 07                  LD   A,7   
5FEC   D3 C1                  OUT   (PSGREG),A   ; write registre
5FEE   78                     LD   A,B   
5FEF   D3 C0                  OUT   (PSGDAT),A   
5FF1   3E 0E                  LD   A,$0E   
5FF3   D3 C1                  OUT   (PSGREG),A   ; write registre
5FF5   DB C0                  IN   A,(PSGDAT)   
5FF7   47                     LD   B,A   
5FF8   3E 0F                  LD   A,$0F   
5FFA   D3 C1                  OUT   (PSGREG),A   ; write registre
5FFC   DB C0                  IN   A,(PSGDAT)   
5FFE   4F                     LD   C,A   
5FFF   C9                     RET   


PSGREG:             00C1 DEFINED AT LINE 1
                    > USED AT LINE 8
                    > USED AT LINE 13
                    > USED AT LINE 18
                    > USED AT LINE 23
PSGDAT:             00C0 DEFINED AT LINE 2
                    > USED AT LINE 9
                    > USED AT LINE 15
                    > USED AT LINE 19
                    > USED AT LINE 24
```

___
