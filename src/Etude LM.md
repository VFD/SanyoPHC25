# Langage machine sur PHC-25

___
## Introduction

Capitalisation sur la mise en place du langage machine sur le PHC-25.

Pour améliorer le principe.\
Trouver le moyen d'obtenir rapidement l'emplacemant mémoire d'une ligne BASIC.

cf. RALP sur ZX81.

___
## Technique READ DATA

Classique avec les fonctions READ, RESTORE, DATA et POKE

- RESTORE n : pointeur vers la ligne DATA
- DATA nnnn : contient les codes hexa (nn) du LM (paquet de 16)
- READ : lecture DATA
- POKE : place l'octet à l'endroit spécifié

```basic
to do
```


___
### Technique de la ligne REM

Classique sur ce type de machine (issue notablement du ZX81).\
On se reserve la première ligne du code Basic pour y loger le LM.\
Nécessite un programme chargeur.\
Ou équivalent avec les techniques modernes. Hexa edition direct par exemple pour du code court.

```basic
0 REM 0123456789
1 EXEC &HC003
```
Les caractères après REM doivent être en nombre nécessaire (longueur du code LM).\
&hc003 est l'adress du 1er octet du code LM soit le "0".

Technique inverse.

```basic
0 EXEC &Hnnnn
1 REM 0123456789
```
La ligne 1 est optionnel. Le LM peut être forcé à l'adresse.

&Hnnnn : point d'entrée du LM.

Prévoir le ORG &hnnnn.

C'est le principe utilisé par les RPUFOS, issu du programmeur japonais ????.

___
### Sous programme en REM

Pour une sous routine avec paramètres.

```basic
0 REM 0123456789
1 REM LM sous-routine
...
100 POKE &HC003,0 : POKE &HC004,255 : ...
110 EXEC &Hcnnn
...
```

&Hcnnn : Point d'entrée de la sous routine ASM.

Par exemple pour faire du calcul, scroll écran.\
Plusieurs paramètres sont possibles, dépand du nombre d'octets réservés.

```asm
	LD (A), &hC003
	...
```

En retour.

```asm
	LD &hC003,A
	...
```

On fait un PEEK du &hc003 pour obtenir le résultat.


___
### Technique d'écrasement DATA

Plus complexe.\
Déterminer la position en mémoire d'une ligne REM.\
Derriere des DATA.\
Avec le READ, faire un POKE à partir de la ligne REM.

Coder par POKE la fin de programme avant, même si celà semble peu pertinant.\
NB : à cause d'un éventuel CSAVE.


```basic
...
1000 RESTORE 60010
1010 ...
...
1100 READ A$ ...
1110 POKE &hnnn, valeur
...
60000 REM XXXXXXXXXXXXXXXX
60010 DATA
```

Prévoir un flag P pour éviter le GOSUB 1000.

___


### NOTES

CHR$(10), passe à la ligne
CHR$(12), CLS
CHR$(13), curseur revient à gauche de la ligne


___