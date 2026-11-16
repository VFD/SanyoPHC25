# USR sur Sanyo PHC-25

# Introduction

La fonction basic USR n'est pas documenter.
Le but ici est de documenter la fonction avec les différentes méthodes de retour trouvées.

Il faut aussi savoir que le Basic PHC n'a pas de fonction DEFUSR qui positionne le point d'entrée du programme assembleur.

Rédaction d'un markdown avant intégration dans le nouveau document du basic.

___
# Utiliser USR

## Faire le DEFUSR

DEFUSR n'étant pas présent, il faut donc tout faire.


### Définir la zone mémoire

En principe c'est un classique des machines de l'époque.

```basic
10 CLEAR 200,&HF700
```

Le code assembleur débutera à l'adresse &HF700.\
Par principe en mémoire haute. Ici le postulat est 1 seul écran.

<p align="center">────────────────────</p>

### Donner le point d'entrée

Il faut poker l'adresse dans la mémoire de travail du basic.

* &HFE59: adresse de poid faible
* &HFE5A: adresse de poid fort

```basic
70 POKE &HFE59,&H00:POKE &HFE5A,&HF7
```

Le PHC-25 est prêt pour exécuter du code via USR.

___
## Retour de la valeur

### Retour de la valeur via HL

On utilise une routine ROM qui écrit HL dans la FAC.

```asm
F700: D5          PUSH DE        ; keep the argument
F701: 7B          LD A,E         ; low byte = character code
F702: CD 8C 10    CALL 108Ch     ; print A
F705: E1          POP HL         ; HL = original argument
F706: C3 56 24    JP 2456h       ; return HL through the FAC
```

Il n'y a pas de RET car on fait un JP (on gagne 1 octet et quelques cycles).

Sinon:

```asm
F706: CD 56 24    CALL 2456h     ; return HL through the FAC
F709: C9                         ; Return
```


```basic
10 REM Reserve memory: BASIC ends at &HF6FF, machine code starts at &HF700
20 CLEAR 200,&HF700
30 REM Load the 9-byte routine
40 FOR J=0 TO 8:READ N:POKE &HF700+J,N:NEXT J
50 DATA &HD5,&H7B,&HCD,&H8C,&H10,&HE1,&HC3,&H56,&H24
60 REM Set the USR vector (operand of the JP at &HFE58)
70 POKE &HFE59,&H00:POKE &HFE5A,&HF7
80 X=USR(42)
90 PRINT:PRINT X
```

<p align="center">────────────────────</p>

### Retour par écriture dans la FAC

Le routine $2B7A charge le FAC à partir de quatre registres.
B reçoit l'exposant, et C, D, E reçoivent la mantisse (C est l'octet de poids fort).
Elle écrit ces valeurs en FDAC à FDAF et met le signe en FDB0. Elle normalise ensuite le nombre, puis fait RET.
$2456 n'est qu'un préambule: il prépare C=H, D=L, E=0, B=8Fh et saute à $2B7A.
Vous pouvez donc appeler $2B7A vous-même avec vos propres valeurs.

Cela résout aussi la limite des entiers signés.
Le bit 7 de C est le signe, et $2456 place H dans C, d'où le passage en négatif au-delà de 32767.
Si vous mettez C à 0, D à H et E à L, la mantisse est décalée de 8 bits vers la droite par rapport à $2456.
Il faut alors ajouter 8 à l'exposant, soit B=97h. Le résultat est un entier non signé de 0 à 65535.

```asm
F700: D5          PUSH DE        ; save N
F701: 7B          LD A,E         ; A = character code
F702: CD 8C 10    CALL 108Ch     ; print the character
F705: D1          POP DE         ; DE = N again (unsigned 16-bit value)
F706: 01 00 97    LD BC,9700h    ; B = exponent 97h, C = 00h (positive, mantissa high byte)
F709: C3 7A 2B    JP 2B7Ah       ; load FAC from B,C,D,E and return to the dispatcher
```

Il n'y a pas de RET car on fait un JP (on gagne 1 octet et quelques cycles).

Sinon:

```asm
F709: CD 7A 2B    CALL 2B7Ah     ; load FAC from B,C,D,E and return to the dispatcher
F70C: C9                         ; Return
```


```basic
10 REM Load the machine code routine
20 CLEAR 200,&HF700
30 FOR J=0 TO 11
40 READ B:POKE &HF700+J,B
50 NEXT J
60 DATA &HD5,&H7B,&HCD,&H8C,&H10,&HD1,&H01,&H00,&H97,&HC3,&H7A,&H2B
70 REM Patch the USR vector to point at &HF700
80 POKE &HFE59,&H00:POKE &HFE5A,&HF7
90 X=USR(42):PRINT:PRINT X
```



eof
___