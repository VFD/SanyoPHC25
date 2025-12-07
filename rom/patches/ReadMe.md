# Hack de la ROM Basic

___
## Introduction

Le passage de la ROM Basic du Japonnais au PAL à provoqué la mise à 0 de tous les caractères au-delà de chr$(134) inclu.\
Un PRINT CHR$(134) est l'équivalent d'un espace.

L'idée est donc de hacker la ROM Basic et d'y loger de nouveaux caractères (134 à 255).

Un source pour l'ASM de la ROM Basic :\
https://github.com/z88dk/techdocs/blob/master/targets/phc25/phc25rom.asm



___
## Méthode

- Trouver l'emplacement de l'encodage des caractères
- Designe des nouveaux caractère en 8x12 (matrice des caractères)
  - Création d'un outil simple (HTML, CSS, Javascript) pour recoder : [GRID](grid.html)
- Encoder les caractère dans la ROM
- Tester

Le générateur peut être adapté à la dimension que l'on souhaite.

___
## Nouveau caractères

### Version Alpha

Test élémentaire et rapide de faisabilité.

### Version Beta

Réorganisation du jeu de caractère et choix d'un ensemble de semi-graphique jugés plus pertinents.

Voir [table](Table.md).

Il s'agit ici d'une première version qui peut évoluer.\
Validation Team RPUFOS nécessaire.

___
## Utilisation

### Emulteur

Renommer la rom en « phc25rom.bin », puis la placer dans le répertoire de l'émulateur.\
Pour MAME, je ne sais pas.

### Sur la machine physique

Il faut dumper le BIN sur une ROM 24K et remplacer dans le PHC-25.\
N'ayant rien de tout ça, je ne peux pas faire.

### Affichage des caractères

Programme BASIC : 

```basic
10 REM TO DO
```

___
## Espace disponible

de 5BEC à 5FFF, soit 1044 octets.\
Grosso modo nous avons de quoi loger pour 1K+ de programme assembleur.\
Proposition d'une table des vecteurs d'appel système :

| Adr.   | action | Octets | Commentaire     |
|--------|--------|--------|-----------------|
| &h     | 1->2   | 11     | force 2 écrans  |
| &h     | 2->1   | 11     | force 1 écran   |


- Scroll texte UP (mode screen 1 et 2) (écran 1 ou 2)
- Scroll texte UP (mode screen 1 et 2) (écran 1 ou 2)
- Scroll texte Gauche (mode screen 1 et 2) (écran 1 ou 2)
- Scroll texte Droite (mode screen 1 et 2) (écran 1 ou 2)

Reset de la nouvelle ligne à faire.

- Scroll graph UP (mode screen 3 et 4) (écran 1 ou 2)
- Scroll graph UP (mode screen 3 et 4) (écran 1 ou 2)


___
### Idées

#### USR

Il semble que la commande USR se code comme ci-dessous :

```basic
100 CLEAR 50,&HE000
110 POKE &HE000,&HC9
120 X=USR(&HE000)
```

Mais provoque une erreur qui n'est pas une ereur de syntaxe.\
"Illegal function call".



#### Scroll UP de l'écran Texte

Implentation d'un code ASM pour le screen 1.\
Dans la ROM RPUFOS-Basic-phc25rom-Beta2.bin.\
Faire :

```basic
EXEC &HFBF0
```
L'appel peut aussi se faire en assembleur.

L'écran remonte d'une ligne vers le haut.\
Le reset de la ligne 15 n'est pas encore implémenté.

#### Refaire le choix de 1 ou 2 écrans
##### Passage de 1 à 2 écrans :

```basic
1000 POKE &HFB58,247:POKE &HFB56,1:CLEAR 50,&HF800:RETURN
```

```asm
LD A, 0xF7        ; Valeur à écrire à FB58
LD (0xFB58), A    ; POKE &HFB58,247

LD A, 0x01        ; Valeur à écrire à FB56
LD (0xFB56), A    ; POKE &HFB56,1

RET               ; RETURN
```
Code hexa de 11 octets :\
3E F7 32 58 FB 3E 01 32 56 FB C9

Puis : 

```basic
EXEC &Hxxxx: CLEAR 50,&HF800
```
Adresse d'implentation de la routine.

#### De 2 vers 1 écran :

```basic
1000 CLEAR 50,&HE000:POKE &HFB58,223:POKE &HFB56,20:RETURN
```

```asm
LD A, 0xDF
LD (0xFB58), A
LD A, 0x14
LD (0xFB56), A
RET
```

Code hexa (11 octets) :\
3E DF 32 58 FB 3E 14 32 56 FB C9

```basic
CLEAR 50,&HE000: EXEC &Hxxxx
```
Adresse d'implentation de la routine.

22 octets consomés pour un usage pas forcément utile.\
Mais peut servir en début de programme pour tester si on est dans le bon mode et le forcer si nécessaire.\
Le CLEAR reste, car c'est un élément de choix pour le programmeur.

NDR: En attente d'implementation dans la ROM. Relogeable n'importe où.

___
Randomize ?

...
___
