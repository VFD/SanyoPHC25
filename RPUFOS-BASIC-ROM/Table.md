# Jeu de caractère PHC-25

## Introduction

Lire la ROM et récupérer les codes Hexa.

Création de nouveaux caractères.

Test à faire sur une vraie machine.\
Je n'en ai pas.

## Tables diverses

Adresse de début et de fin.

Message de bienvenu après le choix 1 ou 2 du boot.

| Deb. | Fin  | Comment  |
|------|------|----------|
| 005B | 0074 | Message après choix |
| 0130 | 0136 | Ready |


Messages d'erreurs

Début en &H0137 ou &H0138 si on prend le séparateur &H00.

| Deb. | Fin  | Comment  |
|------|------|----------|
| 0138 |      | Break |
|      |      | Next w/o for |
|      |      | Syntax error |
|      |      | Return w/o gosub |
|      |      | Not enough data |
|      |      | Illegal function call |
|      |      | Over flow |
|      |      | Out of memory |
|      |      | Undefined line number |
|      |      | Bad subscript |
|      |      | Duplicate definition |
|      |      | Divided by zero |
|      |      | Illegal direct call |
|      |      | Type mismatched |
|      |      | Out of string space |
|      |      | Too long string |
|      |      | String too complex |
|      |      | Can't continue |
|      |      | Undefined FN call |
|      |      | Tape read error |
|      | 028B | Missing operand |

Fin en &H028A ou &H028B si on prend en compte ou pas le séparateur &H00.


&H02C9 à &H0491 : Mots clés du BASIC.



___
## Tables adresse jeux de caractère

La colonne « Hexa » des tables correspond au 12 octets en hexadécimal.\
Suite à une boulette je les ai stupidement perdu... à refaire.

### Table ASCII basse

Les caractères de contrôles.\
Non affichable. Sauf si un CHR$(xxx) avant.\
à compléter.



| ASCII | &H | Char | Adresse  | Comment | Hexa |
|-------|----|------|----------|---------|------|
| 0     | 00 | NUL  |      |  |  |
| 1     | 01 | SOH  |      |  |  |
| 2     | 02 | STX  |      |  |  |
| 3     | 03 | ETX  |      |  |  |
| 4     | 04 | EOT  |      |  |  |
| 5     | 05 | ENQ  |      |  |  |
| 6     | 06 | ACK  |      |  |  |
| 7     | 07 | BEL  |      |  |  |
| 8     | 08 | BS   |      |  |  |
| 9     | 09 | TAB  |      |  |  |
| 10    | 0A | LF   |      | Line Feed |  |
| 11    | 0B | VT   |      |  |  |
| 12    | 0C | FF   |      |  |  |
| 13    | 0D | CR   |      | Carriage Return |  |
| 14    | 0E | SO   |      |  |  |
| 15    | 0F | SI   |      |  |  |
| 16    | 10 | DLE  |      |  |  |
| 17    | 11 | DC1  |      |  |  |
| 18    | 12 | DC2  |      |  |  |
| 19    | 13 | DC3  |      |  |  |
| 20    | 14 | DC4  |      |  |  |
| 21    | 15 | NAK  |      |  |  |
| 22    | 16 | SYN  |      |  |  |
| 23    | 17 | ETB  |      |  |  |
| 24    | 18 | CAN  |      |  |  |
| 25    | 19 | EM   |      |  |  |
| 26    | 1A | SUB  |      |  |  |
| 27    | 1B | ESC  |      |  |  |
| 28    | 1C | FS   |      | X |  |
| 29    | 1D | GS   | 5148     |  | 00 00 00 00 00 00 00 00 00 00 00 00 |
| 30    | 1E | RS   | 5154     |  | 00 00 00 00 00 00 00 00 00 00 00 00 |
| 31    | 1F | US   | 5160     |  | 00 00 00 00 00 00 00 00 00 00 00 00 |

Va savoir pourquoi SANYO y a collé des caractères graphique... :-/


### Table ASCII standard



| ASCII | &H | Char | Adresse  | Comment | Hexa |
|-------|----|------|----------|---------|------|
| 32    |    | SPC  | 516C     |  | 00 00 00 00 00 00 00 00 00 00 00 00 |
| 33    |    | !    | 5178     |  |  |
| 34    |    | "    | 5184     |  |  |
| 35    |    | \#   | 5190     |  |  |
| 36    |    | $    | 519C     |  |  |
| 37    |    | %    | 51A8     |  |  |
| 38    |    | &    | 51B4     |  |  |
| 39    |    | '    | 51C0     |  |  |
| 40    |    | (    | 51CC     |  |  |
| 41    |    | )    | 51D8     |  |  |
| 42    |    | \*   | 51E4     |  |  |
| 43    |    | +    | 51F0     |  |  |
| 44    |    | ,    | 51FC     |  |  |
| 45    |    | -    | 5208     |  |  |
| 46    |    | .    | 5214     |  |  |
| 47    |    | /    | 5220     |  |  |
| 48    |    | 0    | 522C     |  |  |
| 49    |    | 1    | 5238     |  |  |
| 50    |    | 2    | 5244     |  |  |
| 51    |    | 3    | 5250     |  |  |
| 52    |    | 4    | 525C     |  |  |
| 53    |    | 5    | 5268     |  |  |
| 54    |    | 6    | 5274     |  |  |
| 55    |    | 7    | 5280     |  |  |
| 56    |    | 8    | 528C     |  |  |
| 57    |    | 9    | 5298     |  |  |
| 58    |    | :    | 52A4     |  |  |
| 59    |    | ;    | 52B0     |  |  |
| 60    |    | <    | 52BC     |  |  |
| 61    |    | =    | 52C8     |  |  |
| 62    |    | >    | 52D4     |  |  |
| 63    |    | ?    | 52E0     |  |  |
| 64    |    | @    | 52EC     |  | 00 3c 42 02 02 32 4a 4a 4a 3c 00 00 |
| 65    |    | A    | 52F8     |  | 00 18 24 42 42 42 42 7E 42 42 42 00 |
| 66    |    | B    | 5304     |  |  |
| 67    |    | C    | 5310     |  |  |
| 68    |    | D    | 531C     |  |  |
| 69    |    | E    | 5328     |  |  |
| 70    |    | F    | 5334     |  |  |
| 71    |    | G    | 5340     |  |  |
| 72    |    | H    | 534C     |  |  |
| 73    |    | I    | 5358     |  |  |
| 74    |    | J    | 5364     |  |  |
| 75    |    | K    | 5370     |  |  |
| 76    |    | L    | 537C     |  |  |
| 77    |    | M    | 5388     |  |  |
| 78    |    | N    | 5394     |  |  |
| 79    |    | O    | 53A0     |  |  |
| 80    |    | P    | 53AC     |  |  |
| 81    |    | Q    | 53B8     |  |  |
| 82    |    | R    | 53C4     |  |  |
| 83    |    | S    | 53D0     |  |  |
| 84    |    | T    | 53DC     |  |  |
| 85    |    | U    | 53E8     |  |  |
| 86    |    | V    | 53F4     |  |  |
| 87    |    | W    | 5400     |  |  |
| 88    |    | X    | 540C     |  |  |
| 89    |    | Y    | 5418     |  |  |
| 90    |    | Z    | 5424     |  |  |
| 91    |    | \[   | 5430     |  |  |
| 92    |    | \    | 543C     |  |  |
| 93    |    | ]    | 5448     |  |  |
| 94    |    | ^    | 5454     |  |  |
| 95    |    | _    | 5460     |  |  |
| 96    |    | \`   | 546C     |  |  |
| 97    |    | a    | 5478     |  |  |
| 98    |    | b    | 5484     |  |  |
| 99    |    | c    | 5490     |  |  |
| 100   |    | d    | 549C     |  |  |
| 101   |    | e    | 54A8     |  |  |
| 102   |    | f    | 54B4     |  |  |
| 103   |    | g    | 54C0     |  |  |
| 104   |    | h    | 54CC     |  |  |
| 105   |    | i    | 54D8     |  |  |
| 106   |    | j    | 54E4     |  |  |
| 107   |    | k    | 54F0     |  |  |
| 108   |    | l    | 54FC     |  |  |
| 109   |    | m    | 5508     |  |  |
| 110   |    | n    | 5514     |  |  |
| 111   |    | o    | 5520     |  |  |
| 112   |    | p    | 552C     |  |  |
| 113   |    | q    | 5538     |  |  |
| 114   |    | r    | 5544     |  |  |
| 115   |    | s    | 5550     |  |  |
| 116   |    | t    | 555C     |  |  |
| 117   |    | u    | 5568     |  |  |
| 118   |    | v    | 5574     |  |  |
| 119   |    | w    | 5580     |  |  |
| 120   |    | x    | 558C     |  |  |
| 121   |    | y    | 5598     |  |  |
| 122   |    | z    | 55A4     |  |  |
| 123   |    | {    | 55B0     |  |  |
| 124   |    | \|   | 55BC     |  |  |
| 125   |    | }    | 55C8     |  |  |
| 126   |    | ~    | 55D4     |  |  |
| 127   |    |      | 55E0     |  | 00 00 00 00 00 00 00 00 00 00 00 00 |

Pour le 127, il faudrait voir la ROM Japonnaise. Quitte à le recoder.

### Table ASCII étendue

Codage de 121 caractères suplémentaires. Les 6 premiers déjà pris (128 à 133).\
Inspiré de l'AMSTRAD et du ZX81. Plus création pixel art.\

On peut étudier le remplacement de £ et d'autres par du pixel Art 8x12.\
Les caractères grecs par exemple, sauf le PI.

Les char affichés sont ceux de la normes UTF8. Mais ça donne une idée.

Un remix est possible pour mettre ensemble les caractères commun, par exemple les blocs.\
La série 144- 159 c'est pour les tableaux.\
Remonter les 2 carrés 232, 233 en 134, 135 ? ou la « X » et PI avant puisque dejà définis.\
Idem pour les ? ! inversés, les remonter.

Tout cela pour avoir une cohérence.


| ASCII | &H | Char | Adresse  | Comment | Hexa |
|-------|----|------|----------|---------|------|
| 128   |    | ♠    | 55EC     | pique (229) |  |
| 129   |    | ♥    | 55F8     | coeur (228) - bloc HG |  |
| 130   |    | ♣    | 5604     | trèfle (226) - bloc HD |  |
| 131   |    | ♦    | 5610     | carreau (227) - bloc H |  |
| 132   |    | ○    | 561C     | rond vide (230) - bloc BG |  |
| 133   |    | ●    | 5628     | rond plein (231) - Bloc G |  |
| 134   |    |      | 5634     | - bloc bg hd |  |
| 135   |    |      | 5640     | - bloc |  |
| 136   |    |      | 564C     | -bloc BD |  |
| 137   |    |      | 5658     | - bloc |  |
| 138   |    |      | 5664     | -bloc D |  |
| 139   |    |      | 5670     | - bloc |  |
| 140   |    |      | 567C     | -bloc B |  |
| 141   |    |      | 5688     | -bloc |  |
| 142   |    |      | 5694     | -bloc |  |
| 143   |    |      | 56A0     | Bloc plein |  |
| 144   |    |      | 56AC     | - tableau . |  |
| 145   |    |      | 56B8     | - tableau H |  |
| 146   |    |      | 56C4     | - tableau D |  |
| 147   |    | └    | 56D0     | - tableau HD |  |
| 148   |    |      | 56DC     | - tableau B |  |
| 149   |    | │    | 56E8     | - tableau HB |  |
| 150   |    | ┌    | 56F4     | - tableau DB |  |
| 151   |    | ├    | 5700     | - tableau HDB |  |
| 152   |    |      | 570C     | - tableau G |  |
| 153   |    | ┘    | 5718     | - tableau HG |  |
| 154   |    | ─    | 5724     | - tableau DG |  |
| 155   |    | ┴    | 5730     | - tableau HDG |  |
| 156   |    | ┐    | 573C     | - tableau GB |  |
| 157   |    | ┤    | 5748     | - tableau HGB |  |
| 158   |    | ┬    | 5754     | - tableau GBD |  |
| 159   |    | ┼    | 5760     | - tableau croix HBGD |  |
| 160   |    |      | 576C     | chapeau ^ |  |
| 161   |    |      | 5778     | ' |  |
| 162   |    |      | 5784     | auréole |  |
| 163   |    | £    | 5790     | £ |  |
| 164   |    |      | 579C     | (c) |  |
| 165   |    |      | 57A8     | P (inverse) |  |
| 166   |    |      | 57B4     | paragraphe |  |
| 167   |    |      | 57C0     | \` |  |
| 168   |    |      | 57CC     | 1/4 |  |
| 169   |    |      | 57D8     | 1/2 |  |
| 170   |    |      | 57E4     | 1/3 |  |
| 171   |    |      | 57F0     | Tombe (croix) |  |
| 172   |    |      | 57FC     | division |  |
| 173   |    |      | 5808     | char tab |  |
| 174   |    |      | 5814     | ? à l'envers |  |
| 175   |    |      | 5820     | ! à l'envers |  |
| 176   |    |      | 582C     | alpha |  |
| 177   |    |      | 5838     | beta |  |
| 178   |    |      | 5844     | . |  |
| 179   |    |      | 5850     | . |  |
| 180   |    |      | 585C     | . |  |
| 181   |    |      | 5868     | . |  |
| 182   |    |      | 5874     | . |  |
| 183   |    |      | 5880     | . |  |
| 184   |    |      | 588C     | .pi |  |
| 185   |    |      | 5898     | . |  |
| 186   |    |      | 58A4     | . |  |
| 187   |    |      | 58B0     | . |  |
| 188   |    |      | 58BC     | . |  |
| 189   |    |      | 58C8     | . |  |
| 190   |    |      | 58D4     | . |  |
| 191   |    |      | 58E0     | Omega |  |
| 192   |    |      | 58EC     | 4x4  |  |
| 193   |    |      | 58F8     | 4x4  |  |
| 194   |    |      | 5904     | 4x4  |  |
| 195   |    |      | 5910     | 4x4  |  |
| 196   |    |      | 591C     | 4x4  |  |
| 197   |    |      | 5928     | 4x4  |  |
| 198   |    |      | 5934     | escalier up |  |
| 199   |    |      | 5940     | porte |  |
| 200   |    |      | 594C     | fiole |  |
| 201   |    |      | 5958     | bombe ronde | 02 05 0A 18 3C 42 8D 8D 81 81 42 3C |
| 202   |    |      | 5964     | O |  |
| 203   |    | ⛌    | 5970     | X |  |
| 204   |    |      | 597C     | / |  |
| 205   |    |      | 5988     | \ |  |
| 206   |    |      | 5994     | damier 2x2 |  |
| 207   |    |      | 59A0     | damier 1x1 |  |
| 208   |    |      | 59AC     | barre H |  |
| 209   |    |      | 59B8     | barre G |  |
| 210   |    |      | 59C4     | barre B |  |
| 211   |    |      | 59D0     | barre D |  |
| 212   |    |      | 59DC     | damier 1x1 1 |  |
| 213   |    |      | 59E8     | damier 1x1 2 |  |
| 214   |    |      | 59F4     | damier 1x1 3 |  |
| 215   |    |      | 5A00     | damier 1x1 4 |  |
| 216   |    |      | 5A0C     | damier 1x1 H |  |
| 217   |    |      | 5A18     | damier 1x1 D |  |
| 218   |    |      | 5A24     | damier 1x1 B |  |
| 219   |    |      | 5A30     | damier 1x1 G |  |
| 220   |    |      | 5A3C     | damier 1x1 HG |  |
| 221   |    |      | 5A48     | damier 1x1 |  |
| 222   |    |      | 5A54     | damier 1x1 |  |
| 223   |    |      | 5A60     | damier 1x1 |  |
| 224   |    |      | 5A6C     | smiley :) |  |
| 225   |    |      | 5A78     | smiley :( |  |
| 226   |    |      | 5A84     | - bloc HD |  |
| 227   |    |      | 5A90     | - bloc H |  |
| 228   |    |      | 5A9C     | - bloc HG |  |
| 229   |    |      | 5AA8     | damier 1x2 |  |
| 230   |    |      | 5AB4     | - bloc BG |  |
| 231   |    |      | 5AC0     | - Bloc G |  |
| 232   |    |      | 5ACC     | carré |  |
| 233   |    |      | 5AD8     | carré plein |  |
| 234   |    |      | 5AE4     | Mâle |  |
| 235   |    |      | 5AF0     | Femelle |  |
| 236   |    |      | 5AFC     | note |  |
| 237   |    |      | 5B08     | note croche |  |
| 238   |    |      | 5B14     | etoile? |  |
| 239   |    |      | 5B20     | fusée |  |
| 240   |    | ↑    | 5B2C     | Flèche Haut |  |
| 241   |    | ↓    | 5B38     | Flèche Bas |  |
| 242   |    | ←    | 5B44     | Flèche Gauche |  |
| 243   |    | →    | 5B50     | Flèche Droite |  |
| 244   |    |      | 5B5C     | Triangle H |  |
| 245   |    |      | 5B68     | Triangle B |  |
| 246   |    |      | 5B74     | Triangle D |  |
| 247   |    |      | 5B80     | Triangle G |  |
| 248   |    |      | 5B8C     | homme |  |
| 249   |    |      | 5B98     | femme |  |
| 250   |    |      | 5BA4     | homme IoI  |  |
| 251   |    |      | 5BB0     | femme IoI |  |
| 252   |    |      | 5BBC     | Bombe |  |
| 253   |    |      | 5BC8     | Orage |  |
| 254   |    |      | 5BD4     | Flèche Haut bas |  |
| 255   |    |      | 5BE0     | Flèche Gauche Droite |  |



### work

AfficheA:
```
    LD HL, 6000h   ; Adresse mémoire vidéo
    LD A, 'A'      ; Code ASCII de 'A' (0x41)
    LD (HL), A     ; Écrit le caractère à l’écran
    RET            ; Retourne au programme appelant
```

21 00 60 3E 41 77 C9

RANDOMIZE(-TIME)

```asm
; Supposons que l'adresse de TIME soit accessible à 0xF3F0 (exemple fictif)
LD HL, 0xF3F0     ; Adresse du compteur temps
LD A, (HL)        ; Lire la valeur du temps
LD B, A           ; Stocker dans B comme graine

; Exemple de génération pseudo-aléatoire simple
; (très basique, juste pour illustrer)
INC B             ; Modifier la graine
LD A, B
AND 0x0F          ; Limiter à 0–15
LD (0x7000), A    ; Stocker le résultat dans une variable à 0x7000

RET               ; Retour de la sous-routine
```



```basic
1000 POKE &HFB58,247:20:POKE &HFB56,1:CLEAR 50,&HF800:RETURN
```

```asm
LD A, 0xF7        ; Valeur à écrire à FB58
LD (0xFB58), A    ; POKE &HFB58,247

LD A, 0x01        ; Valeur à écrire à FB56
LD (0xFB56), A    ; POKE &HFB56,1

RET               ; RETURN
```

EXEC &Hxxxx: CLEAR 50,&HF800

3E F7 32 58 FB 3E 01 32 56 FB C9


2 vers 1

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

on aurait CLEAR 50,&HE000: EXEC &Hxxxx

3E DF 32 58 FB 3E 14 32 56 FB C9


### Inspiration

[Jeu de caractères AMSTRAD](https://asmtradcpc.zilog.fr/docs/Table_des_caracteres_ASCII.php)

et ZX81.
___

```basic
10 A=&H55EC
20 B=&H5BEB
30 C=0
40 FOR I=A TO B
50 D=PEEK(I)
60 E=INT(D/16)
70 F=D-(E*16)
80 IF E<10 THEN G=E+48 ELSE G=E+55
90 IF F<10 THEN H=F+48 ELSE H=F+55
100 LPRINT CHR$(G)+CHR$(H);" ";
110 C=C+1
120 IF C=12 THEN LPRINT:C=0
130 NEXT
140 IF C<>0 THEN LPRINT
```


