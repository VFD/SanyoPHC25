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
5BEC                SCROLLUP2:   ; pour VRAM2
5BEC   21 20 E0               LD   HL,0E020h   ; source texte ligne 1
5BEF   11 00 E0               LD   DE,0E000h   ; dest texte ligne 0
5BF2   CD 0E 5C               CALL   CopyUp   
5BF5   21 20 E8               LD   HL,0E820h   ; source attributs ligne 1
5BF8   11 00 E8               LD   DE,0E800h   ; dest attributs ligne 0
5BFB   CD 0E 5C               CALL   CopyUp   
5BFE   C9                     RET   
5BFF                SCROLLUP1:   ; pour VRAM1
5BFF   21 20 60               LD   HL,6020h   ; source texte ligne 1
5C02   11 00 60               LD   DE,6000h   ; dest texte ligne 0
5C05   CD 0E 5C               CALL   CopyUp   
5C08   21 20 68               LD   HL,6820h   ; source attributs ligne 1
5C0B   11 00 68               LD   DE,6800h   ; dest attributs ligne 0
5C0E                COPYUP:   
5C0E   01 E0 01               LD   BC,480   ; 32*15  1E0h
5C11   CF                     RST   08h   ; VSYNC
5C12   ED B0                  LDIR   
5C14   C9                     RET   
5C15                          ; Scroll Down
5C15                SCROLLDOWN2:   ; pour VRAM2
5C15   21 DF E1               LD   HL,0E1DFh   ; source texte ligne 14
5C18   11 FF E1               LD   DE,0E1FFh   ; dest texte ligne 15
5C1B   CD 37 5C               CALL   CopyDown   
5C1E   21 DF E9               LD   HL,0E9DFh   ; source attributs ligne 14
5C21   11 FF E9               LD   DE,0E9FFh   ; dest attributs ligne 15
5C24   CD 37 5C               CALL   CopyDown   
5C27   C9                     RET   
5C28                SCROLLDOWN1:   ; pour VRAM1
5C28   21 DF 61               LD   HL,61DFh   ; source texte ligne 14
5C2B   11 FF 61               LD   DE,61FFh   ; dest texte ligne 15
5C2E   CD 37 5C               CALL   CopyDown   
5C31   21 DF 69               LD   HL,69DFh   ; source attributs ligne 14
5C34   11 FF 69               LD   DE,69FFh   ; dest attributs ligne 15
5C37                COPYDOWN:   
5C37   01 E0 01               LD   BC,480   ; 32*15  1E0h
5C3A   CF                     RST   08h   ; VSYNC
5C3B   ED B8                  LDDR   
5C3D   C9                     RET   
5C3E                          ; Effacer ligne 0 texte (VRAM1)
5C3E                LINE0V1:   
5C3E   21 00 60               LD   HL,6000h   
5C41   18 0D                  JR   FillLine   
5C43                          ; Effacer ligne 0 texte (VRAM2)
5C43                LINE0V2:   
5C43   21 00 E0               LD   HL,0E000h   
5C46   18 08                  JR   FillLine   
5C48                          ; Effacer ligne 15 texte (VRAM2)
5C48                LINE15V2:   
5C48   21 E0 E1               LD   HL,0E1E0h   
5C4B   18 03                  JR   FillLine   
5C4D                          ; Effacer ligne 15 texte (VRAM1)
5C4D                LINE15V1:   
5C4D   21 E0 61               LD   HL,61E0h   
5C50                          ; 
5C50                FILLLINE:   
5C50   3E 20                  LD   A,20h   
5C52   01 1F 00               LD   BC,31   
5C55   CF                     RST   08h   ; VSYNC
5C56   CD 9A 05               CALL   059Ah   ; MemSet ROM
5C59   C9                     RET   


SCROLLUP2:          5BEC DEFINED AT LINE 18
SCROLLUP1:          5BFF DEFINED AT LINE 28
COPYUP:             5C0E DEFINED AT LINE 36
                    > USED AT LINE 21
                    > USED AT LINE 25
                    > USED AT LINE 31
```

82 octets pour les scrolls up and down.\
28 octets pour effacer les lignes (utilise une routine MemSet ROM.\

100 octets utilisé.

| Type | Ecran | Call |
|------|-------|------|
| Scroll haut   | 1	| EXEC &H5BFF |
| Scroll bas    | 1	| EXEC &H5C28 |
| Scroll haut   | 2	| EXEC &H5BEC |
| Scroll bas    | 2	| EXEC &H5C15 |

A valider pour le type Texte.

En Screen 2, il faudrait faire un test préalable si possible (2 écrans) pour être propre. Mais le programmeur doit aussi savoir ce qu'il mijote...

___

| Type | Ecran | Call |
|------|-------|------|
| Scroll gauche | 1	| EXEC &H |
| Scroll droite | 1	| EXEC &H |
| Scroll gauche | 2	| EXEC &H |
| Scroll droite | 2	| EXEC &H |



Faire ensuite le screen 3.

Faire ensuite le screen 4.

Les RAZ sont à étudier de prêt.





___



















