# Scroll écran texte

Pour aider au develeppement de jeu en mode texte ce serait assez utile.

https://www.asm80.com/onepage/asmz80.html

___
## Vers le haut

En basic :

```basic
10 CLS
20 LOCATE 30,15:PRINT"XX";
30 GOTO 20
```

Provoque un scroll vers le haut. Mais sintillement.\
De plus quoi qu'il arrive, quelle que soit la méthode, un PRINT en 31,15 provoque une remonté des lignes.\
Le seul moyen d'éviter ça c'est un poke sur l'adresse mémoire vidéo.

Sinon, ne pas utiliser la ligne 15.\
La dédier au score par exemple.

Le scroll est problématique.

___
## Vers le bas

Recopier la ligne 14 sur la 15.\
Puis remonter 13, 12....\
En BASIC on tombe aussi sur le problème du 31,15.

La solution est en assembleur ou directement en mémoire vidéo.



___
## vers la droite

Problème du 31,15.\
La solution est en assembleur ou directement en mémoire vidéo.

___
## Vers la gauche

Problème du 31,15.\
La solution est en assembleur ou directement en mémoire vidéo.


___
## Work in progress


### Mode screen 1 (text)

De &h6000 à &h61FF pour l'affichage.\
De &h6800 à &h69FF pour les attributs.

2 x 512 octets.\
Englobé dans la zone des 6ko.

Déplacer les affichages et les attributs.

4 directions.

En basic, peek et poke.

Scroll bas
```basic
100 FOR A=&H61DF TO &H6000 STEP -1
110 POKE A+32,PEEK(A)
120 POKE A+&H800+32,PEEK(A+&H800)
130 NEXT
140 REM 00 sur ligne 1

```

&h5BF0 pour test , mais relogeable.\
Efface la première ligne.
Ajouter efface ligne 15.

```asm
0000                          ; mode screen 1
0000                          ; en screen 2 c'est different
0000                ECRAN2_0:   
0000   21 00 E0               LD   HL,$E000   ; Ligne 0 texte écran 2
0003   11 00 E8               LD   DE,$E800   ; Ligne 0 attributs écran 2
0006   18 06                  JR   EFFACE   
0008                ECRAN1_0:   
0008   21 00 60               LD   HL,$6000   ; Ligne 0 texte écran 1
000B   11 00 68               LD   DE,$6800   ; Ligne 0 attributs écran 1
000E                EFFACE:   
000E   06 20                  LD   B,32   
0010                EFFACE_LIGNE0:   
0010   3E 00                  LD   A,0   
0012   77                     LD   (HL),A   ; Texte ← 00
0013   3E 80                  LD   A,$80   
0015   12                     LD   (DE),A   ; Attribut ← 80
0016   23                     INC   HL   
0017   13                     INC   DE   
0018   10 F6                  DJNZ   efface_ligne0   
001A   C9                     RET   
```

Fonctionne bien. revoir le JUMP ajouté après.

___

Algorithme à faire en assembleur Z80. Copie de lignes. Depuis 14 jusqu'à 0.

adresse1 = &h61C0.
adresse2 = &h69C0.
Compteur1 = 0
DO (
	Compteur2=0
	DO (
		Lire octet1 adresse1
		Lire octet2 adresse2
		Copier octet1 à adresse1 + 32
		Copier octet2 à adresse2 + 32
		Compteur2 + 1
	) until Compteur2 = 32
	adresse1 = adresse1 - 32
	adresse2 = adresse2 - 32
) until Compteur1 = 14


A tester, puis effacer la ligne 15

```asm
0000   21 C0 61               LD   HL,61C0h   ; adresse1 initiale
0003   11 C0 69               LD   DE,69C0h   ; adresse2 initiale
0006   06 0E                  LD   B,14       ; Compteur1 = 14
0008                BOUCLE1:   
0008   0E 20                  LD   C,32       ; Compteur2 = 32
000A                BOUCLE2:   
000A   7E                     LD   A,(HL)     ; Lire octet1 à adresse1
000B   E5                     PUSH   HL       ; Sauvegarder adresse1
000C   DD E1                  POP   IX        ; Copier dans IX
000E   DD 77 20               LD   (IX+32),A  ; Copier octet1 à adresse1 + 32
0011   1A                     LD   A,(DE)     ; Lire octet2 à adresse2
0012   D5                     PUSH   DE       ; Sauvegarder adresse2
0013   FD E1                  POP   IY        ; Copier dans IY
0015   FD 77 20               LD   (IY+32),A  ; Copier octet2 à adresse2 + 32
0018   23                     INC   HL        ; adresse1++
0019   13                     INC   DE        ; adresse2++
001A   0D                     DEC   C         ; Compteur2--
001B   C2 0A 00               JP   NZ,Boucle2 ; Répéter jusqu’à Compteur2 = 0
001E                          ; Reculer HL de 32
001E   7D                     LD   A,L   
001F   D6 20                  SUB   32   
0021   6F                     LD   L,A   
0022   D2 26 00               JP   NC,PasRetHL   
0025   25                     DEC   H   
0026                PASRETHL:   
0026                          ; Reculer DE de 32
0026   7B                     LD   A,E   
0027   D6 20                  SUB   32   
0029   5F                     LD   E,A   
002A   D2 2E 00               JP   NC,PasRetDE   
002D   15                     DEC   D   
002E                PASRETDE:   
002E   10 D8                  DJNZ   Boucle1   ; Répéter jusqu’à Compteur1 = 0
0030   C9                     RET   


BOUCLE1:            0008 DEFINED AT LINE 5
                    > USED AT LINE 43
BOUCLE2:            000A DEFINED AT LINE 8
                    > USED AT LINE 25
PASRETHL:           0026 DEFINED AT LINE 33
                    > USED AT LINE 31
PASRETDE:           002E DEFINED AT LINE 41
                    > USED AT LINE 39
```




### Mode screen 2 (text)

De &h6000 à &h61FF pour l'affichage.\
De &h6800 à &h69FF pour les attributs.

2 x 512 octets.\
Englobé dans la zone des 6ko.

Déplacer les affichages et les attributs.

### Mode screen 3 (graphic)

De &h6000 à &h77FF pour l’écran 1.\
De &hE000 à &hF700 pour l’écran 2.\
Chaque plage d’adresse occupe 6Ko.

Déplacer les octets.

### Mode screen 4 (graphic)

De &h6000 à &h77FF pour l’écran 1.\
De &hE000 à &hF700 pour l’écran 2.\
Chaque plage d’adresse occupe 6Ko.

Déplacer les octets.


___