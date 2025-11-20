# For MAME

___
# Introduction

Need to split the 24ko ROM in 3 parts.

So PS1 script to cut ROM.

___
# Next Step

Generate CRC etc.

Start MAME with the new ROM.

Add this Alternate ROM to official MAME.

___
# Debug with Mame

```command
mame phc25 -debug
````

## fonction

- F11 : Step Into (exécute une seule instruction).
- F10 : Step Over (exécute une instruction sans entrer dans les sous‑routines).
- F12 : Step Out (sort d’une sous‑routine).
- F5 : Continue (reprend l’exécution normale).

## breakpoint

Dans l'espace minuscule en bas de la fenètre.

- bp <adresse> : place un breakpoint à l’adresse donnée.
- bpclear : supprime tous les breakpoints.
- bpclear <numéro> : supprime un breakpoint spécifique.
- bplist : liste les breakpoints actifs.
- wp <adresse>,<taille>,r/w : crée un watchpoint (surveiller lecture/écriture mémoire).
- trace <fichier> : enregistre toutes les instructions exécutées dans un fichier texte.

Adresses en hexa 0xNNNN.

___

