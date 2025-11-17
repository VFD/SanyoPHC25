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

## Table des adresses connues de MemSets

La notation hexadecimale utilise le formalisme du PHC-25.

&h059A
```asm
0000059A:	LD (HL),A		; A -> (HL)
0000059B:	LD E,L			; HL -> DE
0000059C:	LD D,H
0000059D:	INC DE			; DE+1
0000059E:	LDIR			; DO (HL)->(DE); HL+1; DE+1; BC-1; UNTIL BC=0
000005A0:	RET
```

&h1BDF
```asm
00001BDF:	LD E,L						; HL -> DE
00001BE0:	LD D,H
00001BE1:	INC DE						; DE + 1
00001BE2:	LD (HL),A					; A -> (HL)
00001BE3:	LDIR						; DO (HL)->(DE); HL+1; DE+1; BC-1; UNTIL BC=0
00001BE5:	RET
```

Les 2 sont quasi identique, si quelqu'un peut expliquer si cela change quelque chose.


Pour RAZ d'une ligne c'est jouable pour economiser quelques octets.

```
LD A,20h                        ; SPACE
LD HL, addr_ligne
LD BC,0020h                       ; 32 fois
RST   08h   ; VSYNC
CALL 059Ah
RET
```

___
# Tentative avec VSYNC


```asm
0000                          ; ----------------------------------------
0000                          ; Scroll texte + attributs (PHC-25)
0000                          ; Deux points d'entrée : VRAM1 et VRAM2
0000                          ; ----------------------------------------
0000                          ; 6000h - 77FFh   : Video RAM 1 (6ko) - SCREEN 3 & SCREEN 4
0000                          ;   6000h - 61FFh : SCREEN 1 & 2 Text
0000                          ;   6800h - 69FFh : SCREEN 1 & 2 Attibuts
0000                          ; 
0000                          ; E000h - F7FFh : Video RAM 2 (6ko) - SCREEN 3 & SCREEN 4
0000                          ;   E000h - E1FFh : SCREEN 1 & 2 Text
0000                          ;   E800h - E9FFh : SCREEN 1 & 2 Attibuts
5BEC                          .ORG   $5BEC   ; Point d'entrée dans la ROM
5BEC                          ; Scroll UP
5BEC                SCROLLUP1:   ; pour VRAM1
5BEC   21 20 60               LD   HL,6020h   ; source texte ligne 1
5BEF   11 00 60               LD   DE,6000h   ; dest texte ligne 0
5BF2   CD 12 5C               CALL   CopyUp   
5BF5   21 20 68               LD   HL,6820h   ; source attributs ligne 1
5BF8   11 00 68               LD   DE,6800h   ; dest attributs ligne 0
5BFB   CD 12 5C               CALL   CopyUp   
5BFE   C9                     RET   
5BFF                SCROLLUP2:   ; pour VRAM2
5BFF   21 20 E0               LD   HL,0E020h   ; source texte ligne 1
5C02   11 00 E0               LD   DE,0E000h   ; dest texte ligne 0
5C05   CD 12 5C               CALL   CopyUp   
5C08   21 20 E8               LD   HL,0E820h   ; source attributs ligne 1
5C0B   11 00 E8               LD   DE,0E800h   ; dest attributs ligne 0
5C0E   CD 12 5C               CALL   CopyUp   
5C11   C9                     RET   
5C12                COPYUP:   
5C12   01 E0 01               LD   BC,480   ; 32*15  1E0h
5C15   CF                     RST   08h   ; VSYNC
5C16   ED B0                  LDIR   
5C18   C9                     RET   
5C19                          ; Scroll Down
5C19                SCROLLDOWN1:   ; pour VRAM1
5C19   21 DF 61               LD   HL,61DFh   ; source texte ligne 14
5C1C   11 FF 61               LD   DE,61FFh   ; dest texte ligne 15
5C1F   CD 3F 5C               CALL   CopyDown   
5C22   21 DF 69               LD   HL,69DFh   ; source attributs ligne 14
5C25   11 FF 69               LD   DE,69FFh   ; dest attributs ligne 15
5C28   CD 3F 5C               CALL   CopyDown   
5C2B   C9                     RET   
5C2C                SCROLLDOWN2:   ; pour VRAM2
5C2C   21 DF E1               LD   HL,0E1DFh   ; source texte ligne 14
5C2F   11 FF E1               LD   DE,0E1FFh   ; dest texte ligne 15
5C32   CD 3F 5C               CALL   CopyDown   
5C35   21 DF E9               LD   HL,0E9DFh   ; source attributs ligne 14
5C38   11 FF E9               LD   DE,0E9FFh   ; dest attributs ligne 15
5C3B   CD 3F 5C               CALL   CopyDown   
5C3E   C9                     RET   
5C3F                COPYDOWN:   
5C3F   01 E0 01               LD   BC,480   ; 32*15  1E0h
5C42   CF                     RST   08h   ; VSYNC
5C43   ED B8                  LDDR   
5C45   C9                     RET   


SCROLLUP1:          5BEC DEFINED AT LINE 18
SCROLLUP2:          5BFF DEFINED AT LINE 28
COPYUP:             5C12 DEFINED AT LINE 38
                    > USED AT LINE 21
                    > USED AT LINE 25
                    > USED AT LINE 31
                    > USED AT LINE 35
SCROLLDOWN1:        5C19 DEFINED AT LINE 46
SCROLLDOWN2:        5C2C DEFINED AT LINE 56
COPYDOWN:           5C3F DEFINED AT LINE 66
                    > USED AT LINE 49
                    > USED AT LINE 53
                    > USED AT LINE 59
                    > USED AT LINE 63
```

89 octets environ.

| Type | Ecran | Call |
|------|-------|------|
| Scroll haut   | 1	| EXEC &H5BEC |
| Scroll bas    | 1	| EXEC &H5C19 |
| Scroll haut   | 2	| EXEC &H5C08 |
| Scroll bas    | 2	| EXEC &H5C16 |

A valider pour le type Texte.

___

| Type | Ecran | Call |
|------|-------|------|
| Scroll gauche | 1	| EXEC &H5C24 |
| Scroll droite | 1	| EXEC &H5C37 |
| Scroll gauche | 2	| EXEC &H5BFF |
| Scroll droite | 2	| EXEC &H5C2C |



Faire ensuite le screen 3.

Faire ensuite le screen 4.

Les RAZ sont à étudier de prêt.





___
















