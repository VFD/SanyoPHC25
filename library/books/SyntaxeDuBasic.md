# Syntaxe d'une ligne BASIC du PHC-25


## Introduction

Le but est de montrer la syntaxe d'une ligne du BASIC.

Il sera étudier de mettre ou non ceci dans la documentation (rtf et PDF).

___
## Syntaxe d'une ligne BASIC

Le schéma ci-dessous est fait avec Mermaid.\
Il utilise le railroad-peg.
Ce type de schéma est spécialisé dans la grammaire.

```mermaid
---
title "PHC-25 grammaire du BASIC 1.3"
---
railroad-peg-beta
title "PHC-25 grammaire du BASIC 1.3"

# A BASIC line: number, then at least one instruction or one colon
Ligne <- Numero Espaces (Instruction / Separateur) Espaces Suite ;

# Zero or more chained items after the first one
Suite <- (Separateur Espaces)* ;

# A colon, optionally followed by an instruction
Separateur <- ":" Espaces Instruction? ;

Numero <- Chiffre+ ;
Chiffre <- "0" / "1" / "2" / "3" / "4" / "5" / "6" / "7" / "8" / "9" ;
Espaces <- " "* ;

```

* Une ligne du BASIC commence par un numéro, de 0 à 65535.
* Le signe ":" peut apparaître plusieurs fois en début de ligne
* Le signe ":" sert à séparer les instructions, il peut en exister plusieurs
* L'espace est toujours facultatif
* L'instruction du Basic sera définie en fonction de l'avancée de ce document.

Pour chaque instruction on va tenter un schema de type PEG.

On défini par ailleurs ce qu'est un caractère ASCII.


```mermaid
railroad-peg-beta

ASCII <- ((Majuscule? Minuscule? Chiffre? )?)+ ;
```


```mermaid
railroad-peg-beta

Majuscule <- "A" / "B" / "C" / "D" / "E" / "F" / "G" / "H" / "I" / "J" / "K" / "L" / "M"
        / "N" / "O" / "P" / "Q" / "R" / "S" / "T" / "U" / "V" / "W" / "X" / "Y" / "Z" ;
```

```mermaid
railroad-peg-beta

Minuscule <- "a" / "b" / "c" / "d" / "e" / "f" / "g" / "h" / "i" / "j" / "k" / "l" / "m"
        / "n" / "o" / "p" / "q" / "r" / "s" / "t" / "u" / "v" / "w" / "x" / "y" / "z" ;
```

___
## Instruction PRINT

Les éléments définis précédement restent valide (chiffre, espace, etc.)

```mermaid

```

___

