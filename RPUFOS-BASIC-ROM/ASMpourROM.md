# Etude Assembleur pour compléter la ROM

1044 octets disponibles pour loger du code hardcore.\
Pas de possibilité de passer des valeurs.\

Lancement par la fonction EXEC.\
La fonction USR provoque des « Syntax error », car pas trouvé le fonctionnement dans les documents.\
Pourtant il y a trace dans la ROM.


## Exemples

Vider le buffer INKEY$ si présent.
Puis attendre une touche.

```asm
CLEAR_KEYBUF:
C3 83 24   JP 2483h            ; Appelle la routine INKEY$ du PHC-25 (A = touche ou 0)
FE 00      CP 0                ; Compare A avec 0
20 FB      JR NZ,CLEAR_KEYBUF  ; Si une touche est présente, consomme-la et recommence
C9         RET                 ; Sinon, buffer vidé → retour

WAIT_LOOP:
CD xx xx   CALL CLEAR_KEYBUF   ; Appelle la routine de vidage clavier
CD 83 24   CALL 2483h          ; Appelle INKEY$ pour lire une touche
FE 00      CP 0                ; Compare A avec 0
28 F9      JR Z,WAIT_LOOP      ; Si aucune touche, boucle jusqu’à détection
C9         RET                 ; Touche détectée → retour à BASIC
```
Ce prog est-il correct ?

```asm
C3 83 24    ; JP 2483h
FE 00       ; CP 00
20 FB       ; JR NZ, -5 (revient à JP)
C9          ; RET

CD EC 5B    ; CALL 5BEC (CLEAR_KEYBUF)
CD 83 24    ; CALL 2483h (INKEY$)
FE 00       ; CP 00
28 F9       ; JR Z, -7 (revient à CALL CLEAR_KEYBUF)
C9          ; RET
```

Soit :\
&H5BEC\
C3 83 24 FE 00 20 FB C9
&H5BF4\
CD EC 5B CD 83 24 FE 00 28 F9 C9

ECHEC!


## Afficher un caractère

Affiche « A »

```asm
    LD HL, 6000h   ; Adresse mémoire vidéo
    LD A, 'A'      ; Code ASCII de 'A' (0x41)
    LD (HL), A     ; Écrit le caractère à l’écran
    RET            ; Retourne au programme appelant
```
Code hexa:\
21 00 60 3E 41 77 C9

Fonctionne, on s'attendait à pas moins :-).

## Randomize

Soit le programme BASIC de randomize du PHC-25.

```basic
10 I=RND(-TIME)
```

Converti en ASM.\
Trouver l'adresse du compteur de temps.

```asm

???

RET               ; Retour de la sous-routine
```

hexa:\
TO DO.

## Refaire le choix de 1 ou 2 écrans

Passage de 1 à 2 :

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
Code hexa :\
3E F7 32 58 FB 3E 01 32 56 FB C9

Puis : 

```basic
EXEC &Hxxxx: CLEAR 50,&HF800
```

De 2 vers 1 :

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

Code hexa :\
3E DF 32 58 FB 3E 14 32 56 FB C9

```basic
CLEAR 50,&HE000: EXEC &Hxxxx
```

Il faut trouver comment faire le CLEAR 50,&Hxxxx en ASM.

__

___