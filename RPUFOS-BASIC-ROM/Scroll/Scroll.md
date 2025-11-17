# Etude scroll

## Introduction

### Inclure dans la ROM 1.4 des scroll écrans.

- 2 écrans Texte possibles
- 4 scroll possibles

Soit 8 programmes pour les SCREEN 1 & 2.

- 2 écrans Graphique possibles
- 4 scroll possibles

Soit 8 programmes pour les SCREEN 3 & 4.

### Le tout en un minimum d'octets et si possible sans glitch.

Nous disposons de 1044 octets pour faire ça.\
Il faut aussi penser à :
- Faire DI pour empêcher les interruption pendant la copie, puis EI
- Faire la synchro VBL


___
# Analyse de la ROM 1.3

Il s'agit de trouver des sous routines pour simplifier les actions.\
Grosso modo trouver ce que l'on appel des MemSets.

ça tombe bien il y en a.

## Table des adresses connues de MemSets

La notation hexadecimale utilise le formalisme du PHC-25.

| Adresse | Input       | Commentaire |
|---------|-------------|-------------|
| &h059A  | A=Char ; B=Count ; HL=Addr start | DE=HL+1 : LDIR [DO (HL)->(DE); HL+1; DE+1; BC-1; UNTIL BC=0] |


___
# Exemple à l'arrache de code de scroll 


```asm
        ORG $5BEC				; Point d'entrée dans la ROM

; === Efface une ligne texte (32 espaces)
EFFACE:
        LD A,32
        LD B,32
EFF_LOOP:
        LD (HL),A
        INC HL
        DJNZ EFF_LOOP
        RET

; === Scroll vertical haut écran 1
SVH1:
        DI
        LD HL,$6020+32
        LD DE,$6020
        LD BC,480
        LDIR
        LD HL,$6020+480
        CALL EFFACE
        EI
        RET

; === Scroll vertical bas écran 1
SVB1:
        DI
        LD HL,$6020+448
        LD DE,$6020+480
        LD BC,480
        LDDR
        LD HL,$6020
        CALL EFFACE
        EI
        RET

; === Scroll vertical haut écran 2
SVH2:
        DI
        LD HL,$E020+32
        LD DE,$E020
        LD BC,480
        LDIR
        LD HL,$E020+480
        CALL EFFACE
        EI
        RET

; === Scroll vertical bas écran 2
SVB2:
        DI
        LD HL,$E020+448
        LD DE,$E020+480
        LD BC,480
        LDDR
        LD HL,$E020
        CALL EFFACE
        EI
        RET

; === Scroll horizontal gauche écran 1
SHG1:
        DI
        LD B,15
        LD HL,$6001
        LD DE,$6000
SHG1_LOOP:
        LD BC,31
        LDDR
        LD A,32
        LD (DE+31),A
        LD HL,HL+32
        LD DE,DE+32
        DJNZ SHG1_LOOP
        EI
        RET

; === Scroll horizontal droite écran 1
SHD1:
        DI
        LD B,15
        LD HL,$6000
        LD DE,$6001
SHD1_LOOP:
        LD BC,31
        LDIR
        LD A,32
        LD (DE-1),A
        LD HL,HL+32
        LD DE,DE+32
        DJNZ SHD1_LOOP
        EI
        RET

; === Scroll horizontal gauche écran 2
SHG2:
        DI
        LD B,15
        LD HL,$E021
        LD DE,$E020
SHG2_LOOP:
        LD BC,31
        LDDR
        LD A,32
        LD (DE+31),A
        LD HL,HL+32
        LD DE,DE+32
        DJNZ SHG2_LOOP
        EI
        RET

; === Scroll horizontal droite écran 2
SHD2:
        DI
        LD B,15
        LD HL,$E020
        LD DE,$E021
SHD2_LOOP:
        LD BC,31
        LDIR
        LD A,32
        LD (DE-1),A
        LD HL,HL+32
        LD DE,DE+32
        DJNZ SHD2_LOOP
        EI
        RET

```

300 octets environ.

| Type | Ecran | Call |
|------|-------|------|
| Scroll haut   | 1	| EXEC &H5BEC |
| Scroll bas    | 1	| EXEC &H5BFA |
| Scroll haut   | 2	| EXEC &H5C08 |
| Scroll bas    | 2	| EXEC &H5C16 |
| Scroll gauche | 1	| EXEC &H5C24 |
| Scroll droite | 1	| EXEC &H5C37 |
| Scroll gauche | 2	| EXEC &H5C4A |
| Scroll droite | 2	| EXEC &H5C5D |

A valider pour le type Texte.

Faire ensuite le screen 3.

Faire ensuite le screen 4.

Les RAZ sont à étudier de prêt.


Peut poser problème de stop du son par le DI EI.

Alternative faire la synchro VBL.

___

___

___
## Test 1

```asm
        ORG     $5BEC          ; Point de départ du programme

; === Scroll vers le haut ===

ECRAN2H:
        DI
        LD HL,$E020+32         ; Source ligne 1
        LD DE,$E020            ; Destination ligne 0
        LD BC,480              ; 15 lignes × 32 octets
        LDIR
        LD HL,$E820+32         ; Attributs ligne 1
        LD DE,$E820            ; Attributs ligne 0
        LD BC,480
        LDIR
        EI
        RET

ECRAN1H:
        DI
        LD HL,$6020+32
        LD DE,$6020
        LD BC,480
        LDIR
        LD HL,$6820+32
        LD DE,$6820
        LD BC,480
        LDIR
        EI
        RET

; === Scroll vers le bas ===

ECRAN2B:
        DI
        LD HL,$E020+448        ; Source ligne 14
        LD DE,$E020+480        ; Destination ligne 15
        LD BC,480
        LDDR
        LD HL,$E820+448
        LD DE,$E820+480
        LD BC,480
        LDDR
        EI
        RET

ECRAN1B:
        DI
        LD HL,$6020+448
        LD DE,$6020+480
        LD BC,480
        LDDR
        LD HL,$6820+448
        LD DE,$6820+480
        LD BC,480
        LDDR
        EI
        RET

```


```asm

        ORG     $5BEC          ; Point de départ du programme

; === Scroll vers le haut ===

ECRAN2H:
        DI
        LD HL,$E020+32
        LD DE,$E020
        LD BC,480
        LDIR
        LD HL,$E820+32
        LD DE,$E820
        LD BC,480
        LDIR
        LD HL,$E020+480        ; Effacer ligne 15 texte
        CALL EffaceLigne
        EI
        RET

ECRAN1H:
        DI
        LD HL,$6020+32
        LD DE,$6020
        LD BC,480
        LDIR
        LD HL,$6820+32
        LD DE,$6820
        LD BC,480
        LDIR
        LD HL,$6020+480        ; Effacer ligne 15 texte
        CALL EffaceLigne
        EI
        RET

; === Scroll vers le bas ===

ECRAN2B:
        DI
        LD HL,$E020+448
        LD DE,$E020+480
        LD BC,480
        LDDR
        LD HL,$E820+448
        LD DE,$E820+480
        LD BC,480
        LDDR
        LD HL,$E020             ; Effacer ligne 0 texte
        CALL EffaceLigne
        EI
        RET

ECRAN1B:
        DI
        LD HL,$6020+448
        LD DE,$6020+480
        LD BC,480
        LDDR
        LD HL,$6820+448
        LD DE,$6820+480
        LD BC,480
        LDDR
        LD HL,$6020             ; Effacer ligne 0 texte
        CALL EffaceLigne
        EI
        RET

; === Effacement d'une ligne texte (32 espaces) ===

EffaceLigne:
        LD A,32                ; Code ASCII espace
        LD B,32
EffaceLoop:
        LD (HL),A
        INC HL
        DJNZ EffaceLoop
        RET


```

```asm

        ORG     $5D00          ; Nouveau bloc pour scroll horizontal

; === Scroll vers la gauche ===

ECRAN1G:
        DI
        LD HL,$6020           ; Début écran 1
        LD DE,$6021           ; Source = HL + 1
        LD B,15               ; 15 lignes
LIGNEG1:
        LD C,31               ; 31 déplacements par ligne
        PUSH HL
        PUSH DE
DEPLG1:
        LD A,(DE)
        LD (HL),A
        INC HL
        INC DE
        DEC C
        JP NZ,DEPLG1
        POP DE
        POP HL
        LD (HL+31),32         ; Efface dernier caractère
        LD HL,HL+32
        LD DE,DE+32
        DEC B
        JP NZ,LIGNEG1
        EI
        RET

ECRAN2G:
        DI
        LD HL,$E020
        LD DE,$E021
        LD B,15
LIGNEG2:
        LD C,31
        PUSH HL
        PUSH DE
DEPLG2:
        LD A,(DE)
        LD (HL),A
        INC HL
        INC DE
        DEC C
        JP NZ,DEPLG2
        POP DE
        POP HL
        LD (HL+31),32
        LD HL,HL+32
        LD DE,DE+32
        DEC B
        JP NZ,LIGNEG2
        EI
        RET

; === Scroll vers la droite ===

ECRAN1D:
        DI
        LD HL,$6020+480-1     ; Fin écran 1
        LD DE,$6020+480-2     ; Source = HL - 1
        LD B,15
LIGNED1:
        LD C,31
        PUSH HL
        PUSH DE
DEPLD1:
        LD A,(DE)
        LD (HL),A
        DEC HL
        DEC DE
        DEC C
        JP NZ,DEPLD1
        POP DE
        POP HL
        LD (HL-31),32         ; Efface premier caractère
        LD HL,HL-32
        LD DE,DE-32
        DEC B
        JP NZ,LIGNED1
        EI
        RET

ECRAN2D:
        DI
        LD HL,$E020+480-1
        LD DE,$E020+480-2
        LD B,15
LIGNED2:
        LD C,31
        PUSH HL
        PUSH DE
DEPLD2:
        LD A,(DE)
        LD (HL),A
        DEC HL
        DEC DE
        DEC C
        JP NZ,DEPLD2
        POP DE
        POP HL
        LD (HL-31),32
        LD HL,HL-32
        LD DE,DE-32
        DEC B
        JP NZ,LIGNED2
        EI
        RET


```

BOF BOF.



___






