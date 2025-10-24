# Hack de la ROM Basic

___
## Introduction

Le passage de la ROM Basic du Japonnais au PAL à provoqué la mise à 0 de tous les caractères au-delà de chr$(134) inclu.\
Un PRINT CHR$(134) est l'équivalent d'un espace.

L'idée est donc de hacker la ROM Basic et d'y loger de nouveaux caractères (134 à 255).

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
Grosso modo nous avons de quoi loger pour 1K+ de programme assembleur.

### Idées

Bascule 1 vers 2 et 2 vers 1 pour les écran (quelques octets).

Randomize ?

...
___
