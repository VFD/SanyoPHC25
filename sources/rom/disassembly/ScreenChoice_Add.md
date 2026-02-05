# Refaire le choix de 1 ou 2 écrans

## Introduction

Simplifier le swap.

## Passage de 1 à 2 écrans

Fourni par la documentation.

```basic
1000 POKE &HFB58,247:POKE &HFB56,1:CLEAR 50,&HF800:RETURN
```

Passage en assembleur pour la ROM 1.4.

```asm
0000   3E F7                  LD   A,0xF7   	; Valeur à écrire à FB58
0002   32 58 FB               LD   (0xFB58),A   ; POKE &HFB58,247
0005   3E 01                  LD   A,0x01   	; Valeur à écrire à FB56
0007   32 56 FB               LD   (0xFB56),A   ; POKE &HFB56,1
000A   C9                     RET
```
Puis : 

```basic
EXEC &Hxxxx: CLEAR 50,&HF800
```
Le code étant relogeable n'importe où, ce n'est pas encore décidé.

___
## Passage de 2 vers 1 écran

Fourni par la documentation.

```basic
1000 CLEAR 50,&HE000:POKE &HFB58,223:POKE &HFB56,20:RETURN
```

En assembleur; pas de commentaires.

```asm
0000   3E DF                  LD   A,0xDF   
0002   32 58 FB               LD   (0xFB58),A   
0005   3E 14                  LD   A,0x14   
0007   32 56 FB               LD   (0xFB56),A   
000A   C9                     RET  
```
Puis :

```basic
CLEAR 50,&HE000: EXEC &Hxxxx
```
Le code étant relogeable n'importe où, ce n'est pas encore décidé.

## Pour finir

Il faut trouver comment faire :
- CLEAR 50,&HF800
- CLEAR 50,&HE000

Pour améliorer le code.\
Ainsi que pour les programmes en assembleur.

___