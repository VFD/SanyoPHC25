# Jeu de caractère PHC-25

___
## Introduction

Analyse de la ROM Basic et recherche des adresses mémoire pour le jeu de caractères.\
Il est logè en fin de ROM.\
Création de nouveaux caractères sur la plage étendue qui a été RAZ par SANYO.

Test à faire sur une vraie machine.\
Je n'en ai pas.

___
## Tables diverses

### Plage Mémoire du PHC-25

#### Rappel

Mode screen 1 et screen 2 (text)

De &h6000 à &h61FF pour l'affichage.\
De &h6800 à &h69FF pour les attributs.

2 x 512 octets.


Mode Screen 3 et screen 4 (graphic)

De &h6000 à &h77FF pour l’écran 1.\
De &hE000 à &hF700 pour l’écran 2.\
Chaque plage d’adresse occupe 6Ko.

![Image Plage Mémoire PHC-25](Assets/memoryMapPHC-25.png)



#### Adresse mémoire des instructions du basic

&H02C9 à &H0491 : Mots clés du BASIC.


| Comment | Adresse | Comment  |
|---------|---------|----------|
| ABS     |  |
| AND     |  |
| ASC     |  |
| CHR$    |  |
| CLEAR   | &H1981 |
| CLOAD   | &H40F2 |
| CLOAD?  |
| CLS     | &H3F70 |
| COLOR   | &H3CF6 |
| CONSOLE | &H3EA9 |
| CONT    | &H193F |
| COS     | |
| CSAVE   | &H4442 |
| CSRLIN  | |
| CTOFF   | &H4555 |
| CTON    | &H454E |
| DATA    | &H2553 |
| DEF     | &H236E |
| DIM     | &H213F |
| ELSE    | &H05E1 |
| END     | &H1907 |
| EXEC    | &H1070 |
| EXP     |  |
| FN      | &H2E49 |
| FOR     | &H07BF |
| FRE     |  |
| GOSUB   | &H08E0 |
| GOTO    | &H08F5 |
| IF      | &H0979 |
| INKEY$  |  |
| &H2483  |
| INP     |  |
| INPUT   | &H0A1F |
| INPUT#  |  |
| INT     |  |
| KEY     | &H0F3A |
| LCOPY   | &H0FC6 |
| LEFT$   |  |
| LEN     |  |
| LET     | &H24F9 |
| LINE    | &H3921 |
| LIST    | &H25DB |
| LLIST   | &H25D6 |
| LOCATE  | &H3E73 |
| LOG     |  |
| LPOS    |  |
| LPRINT  | &H266C |
| MID$    |  |
| NEW     | &H1866 |
| NEXT    | &H1A4C |
| NOT     |  |
| ON      | &H095C |
| OR      |  |
| OUT     | &H24E2 |
| PAINT   | &H37A2 |
| PEEK    |  |
| PLAY    | &H4907 |
| POINT   |  |
| POKE    | &H24EE |
| POS     |  |
| PRESET  | &H3B56 |
| PRINT   | &H2673 |
| PRINT#  |  |
| PSET    | &H3B36 |
| READ    | &H0A66 |
| REM     | &H254D |
| RESTORE | &H18D1 |
| RETURN  | &H0936 |
| RIGHT$  |  |
| RND     |  |
| RUN     | &H08C2 |
| SCREEN  | &H3F1B |
| SCRIN   |  |
| SGN     |  |
| SIN     |  |
| SLOAD   | &H4086 |
| SOUND   | &H4679 |
| SPC     | &H1AA6 |
| SQR     |  |
| SSAVE   | &H4344 |
| STEP    |  |
| STICK   |  |
| STOP    | &H18FD |
| STRIG   |  |
| STR$    |  |
| TAB     | &H2E43 |
| TAN     |  |
| TIME    |  |
| THEN    |  |
| TO      | &H2E35 |
| USR     |  |
| VAL     |  |




### ROM BASIC

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






___
## Tables adresse jeux de caractère

La colonne « Hexa » des tables correspond au 12 octets en hexadécimal.\
Suite à une boulette je les ai stupidement perdu... à refaire.

### Table ASCII basse

Les caractères de contrôles.\
Non affichable.\
à compléter pour savoir si il y a une adresse ROM.

Si un CHR$(xxx) avant affichage du char ?\
à étudier plus avant.



| ASCII | &H | Char | Adresse  | Comment | Hexa |
|-------|----|------|----------|---------|------|
| 0     | 00 | NUL  |          |         |  |
| 1     | 01 | SOH  |          |         |  |
| 2     | 02 | STX  |          |         |  |
| 3     | 03 | ETX  |          |         |  |
| 4     | 04 | EOT  |          |         |  |
| 5     | 05 | ENQ  |          |         |  |
| 6     | 06 | ACK  |          |         |  |
| 7     | 07 | BEL  |          |         |  |
| 8     | 08 | BS   |          |         |  |
| 9     | 09 | TAB  |          |         |  |
| 10    | 0A | LF   |          | Line Feed |  |
| 11    | 0B | VT   |          |         |  |
| 12    | 0C | FF   |          |         |  |
| 13    | 0D | CR   |          | Carriage Return |  |
| 14    | 0E | SO   |          |         |  |
| 15    | 0F | SI   |          |         |  |
| 16    | 10 | DLE  |          | pi      |  |
| 17    | 11 | DC1  |          | ┴       |  |
| 18    | 12 | DC2  |          | ┬       |  |
| 19    | 13 | DC3  |          | ┤       |  |
| 20    | 14 | DC4  |          | ├       |  |
| 21    | 15 | NAK  |          | ┼       |  |
| 22    | 16 | SYN  |          | │       |  |
| 23    | 17 | ETB  |          | ─       |  |
| 24    | 18 | CAN  |          | ┌       |  |
| 25    | 19 | EM   |          | ┐       |  |
| 26    | 1A | SUB  |          | └       |  |
| 27    | 1B | ESC  |          | ┘       |  |
| 28    | 1C | FS   |          | X       |  |
| 29    | 1D | GS   |          |         |  |
| 30    | 1E | RS   |          |         |  |
| 31    | 1F | US   |          |         |  |

Va savoir pourquoi SANYO y a collé des caractères graphique... :-/

___
### Table ASCII standard

RAS.

| ASCII | &H | Char | Adresse  | Comment | Hexa |
|-------|----|------|----------|---------|------|
| 32    | 20 | SPC  | 516C     |  | 00 00 00 00 00 00 00 00 00 00 00 00 |
| 33    | 21 | !    | 5178     |  | 00 00 10 10 10 10 10 00 00 10 00 00 |
| 34    | 22 | "    | 5184     |  | 00 28 28 28 00 00 00 00 00 00 00 00 |
| 35    | 23 | \#   | 5190     |  | 00 44 44 FE 44 44 44 FE 44 44 00 00 |
| 36    | 24 | $    | 519C     |  | 00 10 7E 90 90 7C 12 12 FC 10 00 00 |
| 37    | 25 | %    | 51A8     |  | 00 E0 A2 E4 08 10 20 4E 8A 0E 00 00 |
| 38    | 26 | &    | 51B4     |  | 00 70 88 88 50 20 50 8A 84 7A 00 00 |
| 39    | 27 | '    | 51C0     |  | 00 30 30 10 20 00 00 00 00 00 00 00 |
| 40    | 28 | (    | 51CC     |  | 00 0C 10 20 20 20 20 20 10 0C 00 00 |
| 41    | 29 | )    | 51D8     |  | 00 60 10 08 08 08 08 08 10 60 00 00 |
| 42    | 2A | \*   | 51E4     |  | 00 00 10 92 54 38 54 92 10 00 00 00 |
| 43    | 2B | +    | 51F0     |  | 00 00 10 10 10 FE 10 10 10 00 00 00 |
| 44    | 2C | ,    | 51FC     |  | 00 00 00 00 00 00 30 30 10 20 00 00 |
| 45    | 2D | -    | 5208     |  | 00 00 00 00 00 FE 00 00 00 00 00 00 |
| 46    | 2E | .    | 5214     |  | 00 00 00 00 00 00 00 00 60 60 00 00 |
| 47    | 2F | /    | 5220     |  | 00 00 02 04 08 10 20 40 80 00 00 00 |
| 48    | 30 | 0    | 522C     |  | 00 3C 42 42 46 5A 62 42 42 3C 00 00 |
| 49    | 31 | 1    | 5238     |  | 00 08 18 28 08 08 08 08 08 3E 00 00 |
| 50    | 32 | 2    | 5244     |  | 00 3C 42 02 02 04 18 20 40 7E 00 00 |
| 51    | 33 | 3    | 5250     |  | 00 7E 02 04 18 04 02 02 42 3C 00 00 |
| 52    | 34 | 4    | 525C     |  | 00 0C 14 24 44 44 44 7E 04 04 00 00 |
| 53    | 35 | 5    | 5268     |  | 00 7E 40 40 7C 02 02 02 42 3C 00 00 |
| 54    | 36 | 6    | 5274     |  | 00 1C 20 40 40 7C 42 42 42 3C 00 00 |
| 55    | 37 | 7    | 5280     |  | 00 7E 42 42 04 08 10 10 10 10 00 00 |
| 56    | 38 | 8    | 528C     |  | 00 3C 42 42 42 3C 42 42 42 3C 00 00 |
| 57    | 39 | 9    | 5298     |  | 00 3C 42 42 42 3E 02 02 04 38 00 00 |
| 58    | 3A | :    | 52A4     |  | 00 00 00 30 30 00 00 30 30 00 00 00 |
| 59    | 3B | ;    | 52B0     |  | 00 00 00 30 30 00 00 30 10 20 00 00 |
| 60    | 3C | <    | 52BC     |  | 00 04 08 10 20 40 20 10 08 04 00 00 |
| 61    | 3D | =    | 52C8     |  | 00 00 00 FE 00 00 FE 00 00 00 00 00 |
| 62    | 3E | >    | 52D4     |  | 00 40 20 10 08 04 08 10 20 40 00 00 |
| 63    | 3F | ?    | 52E0     |  | 00 38 44 44 04 08 10 10 00 10 00 00 |
| 64    | 40 | @    | 52EC     |  | 00 3C 42 02 02 32 4A 4A 4A 3C 00 00 |
| 65    | 41 | A    | 52F8     |  | 00 18 24 42 42 42 7E 42 42 42 00 00 |
| 66    | 42 | B    | 5304     |  | 00 7C 22 22 22 3C 22 22 22 7C 00 00 |
| 67    | 43 | C    | 5310     |  | 00 1C 22 40 40 40 40 40 22 1C 00 00 |
| 68    | 44 | D    | 531C     |  | 00 78 44 42 42 42 42 42 44 78 00 00 |
| 69    | 45 | E    | 5328     |  | 00 7E 40 40 40 7C 40 40 40 7E 00 00 |
| 70    | 46 | F    | 5334     |  | 00 7E 40 40 40 78 40 40 40 40 00 00 |
| 71    | 47 | G    | 5340     |  | 00 3C 42 40 40 4E 42 42 46 3A 00 00 |
| 72    | 48 | H    | 534C     |  | 00 42 42 42 42 7E 42 42 42 42 00 00 |
| 73    | 49 | I    | 5358     |  | 00 38 10 10 10 10 10 10 10 38 00 00 |
| 74    | 4A | J    | 5364     |  | 00 3E 08 08 08 08 08 08 48 30 00 00 |
| 75    | 4B | K    | 5370     |  | 00 42 44 48 50 60 50 48 44 42 00 00 |
| 76    | 4C | L    | 537C     |  | 00 40 40 40 40 40 40 40 40 7E 00 00 |
| 77    | 4D | M    | 5388     |  | 00 82 C6 AA 92 92 82 82 82 82 00 00 |
| 78    | 4E | N    | 5394     |  | 00 82 82 C2 A2 92 8A 86 82 82 00 00 |
| 79    | 4F | O    | 53A0     |  | 00 3C 42 42 42 42 42 42 42 3C 00 00 |
| 80    | 50 | P    | 53AC     |  | 00 7C 42 42 42 7C 40 40 40 40 00 00 |
| 81    | 51 | Q    | 53B8     |  | 00 3C 42 42 42 42 42 4A 44 3A 00 00 |
| 82    | 52 | R    | 53C4     |  | 00 7C 42 42 42 7C 50 48 44 42 00 00 |
| 83    | 53 | S    | 53D0     |  | 00 3C 42 40 40 3C 02 02 42 3C 00 00 |
| 84    | 54 | T    | 53DC     |  | 00 FE 10 10 10 10 10 10 10 10 00 00 |
| 85    | 55 | U    | 53E8     |  | 00 42 42 42 42 42 42 42 42 3C 00 00 |
| 86    | 56 | V    | 53F4     |  | 00 82 82 82 82 44 44 28 28 10 00 00 |
| 87    | 57 | W    | 5400     |  | 00 82 82 82 82 92 92 92 AA 44 00 00 |
| 88    | 58 | X    | 540C     |  | 00 82 82 44 28 10 28 44 82 82 00 00 |
| 89    | 59 | Y    | 5418     |  | 00 82 82 44 28 10 10 10 10 10 00 00 |
| 90    | 5A | Z    | 5424     |  | 00 FE 02 04 08 10 20 40 80 FE 00 00 |
| 91    | 5B | \[   | 5430     |  | 00 38 20 20 20 20 20 20 20 38 00 00 |
| 92    | 5C | \    | 543C     |  | 00 40 40 20 10 08 04 02 02 00 00 00 |
| 93    | 5D | ]    | 5448     |  | 00 38 08 08 08 08 08 08 08 38 00 00 |
| 94    | 5E | ^    | 5454     |  | 00 10 28 44 82 00 00 00 00 00 00 00 |
| 95    | 5F | _    | 5460     |  | 00 00 00 00 00 00 00 00 00 FE 00 00 |
| 96    | 60 | \`   | 546C     |  | 00 30 30 20 10 00 00 00 00 00 00 00 |
| 97    | 61 | a    | 5478     |  | 00 00 00 00 38 04 3C 44 44 3A 00 00 |
| 98    | 62 | b    | 5484     |  | 00 40 40 40 78 44 44 44 44 78 00 00 |
| 99    | 63 | c    | 5490     |  | 00 00 00 00 38 44 40 40 44 38 00 00 |
| 100   | 64 | d    | 549C     |  | 00 04 04 04 3C 44 44 44 44 3C 00 00 |
| 101   | 65 | e    | 54A8     |  | 00 00 00 00 38 44 7C 40 40 3C 00 00 |
| 102   | 66 | f    | 54B4     |  | 00 0C 10 10 7E 10 10 10 10 10 00 00 |
| 103   | 67 | g    | 54C0     |  | 00 00 00 00 3C 44 44 44 3C 04 04 38 |
| 104   | 68 | h    | 54CC     |  | 00 40 40 40 58 64 44 44 44 44 00 00 |
| 105   | 69 | i    | 54D8     |  | 00 00 10 00 30 10 10 10 10 38 00 00 |
| 106   | 6A | j    | 54E4     |  | 00 00 08 00 18 08 08 08 08 08 08 70 |
| 107   | 6B | k    | 54F0     |  | 00 40 40 40 44 48 50 68 44 42 00 00 |
| 108   | 6C | l    | 54FC     |  | 00 10 10 10 10 10 10 10 10 08 00 00 |
| 109   | 6D | m    | 5508     |  | 00 00 00 00 EC 92 92 92 92 92 00 00 |
| 110   | 6E | n    | 5514     |  | 00 00 00 00 3C 22 22 22 22 22 00 00 |
| 111   | 6F | o    | 5520     |  | 00 00 00 00 38 44 44 44 44 38 00 00 |
| 112   | 70 | p    | 552C     |  | 00 00 00 00 78 44 44 44 78 40 40 40 |
| 113   | 71 | q    | 5538     |  | 00 00 00 00 3C 44 44 44 3C 04 04 04 |
| 114   | 72 | r    | 5544     |  | 00 00 00 40 5C 60 40 40 40 40 00 00 |
| 115   | 73 | s    | 5550     |  | 00 00 00 38 44 40 38 04 44 38 00 00 |
| 116   | 74 | t    | 555C     |  | 00 00 00 10 7C 10 10 10 10 0C 00 00 |
| 117   | 75 | u    | 5568     |  | 00 00 00 00 44 44 44 44 44 3A 00 00 |
| 118   | 76 | v    | 5574     |  | 00 00 00 00 44 44 44 28 28 10 00 00 |
| 119   | 77 | w    | 5580     |  | 00 00 00 00 82 92 92 92 AA 44 00 00 |
| 120   | 78 | x    | 558C     |  | 00 00 00 00 42 24 18 18 24 42 00 00 |
| 121   | 79 | y    | 5598     |  | 00 00 00 00 44 44 44 44 3C 04 04 38 |
| 122   | 7A | z    | 55A4     |  | 00 00 00 00 7C 08 10 10 20 7C 00 00 |
| 123   | 7B | {    | 55B0     |  | 00 0C 10 10 10 20 10 10 10 0C 00 00 |
| 124   | 7C | \|   | 55BC     |  | 00 10 10 10 00 00 00 10 10 10 00 00 |
| 125   | 7D | }    | 55C8     |  | 00 30 08 08 08 04 08 08 08 30 00 00 |
| 126   | 7E | ~    | 55D4     |  | 00 60 92 0C 00 00 00 00 00 00 00 00 |
| 127   | 7F |      | 55E0     |  | 00 00 00 00 00 00 00 00 00 00 00 00 |

Pour le 127, il faudrait voir la ROM Japonnaise. Quitte à le recoder.

___
### Table ASCII étendue

Codage de 121 caractères suplémentaires. Les 6 premiers déjà pris (128 à 133).\
Inspiré de l'AMSTRAD et du ZX81. Plus création pixel art.\
Design fin comme ceux standard.

Les char affichés sont ceux de la normes UTF8. Mais ça donne une idée.



| ASCII | &H | Char | Adresse  | Comment                   | Hexa |
|-------|----|------|----------|---------------------------|------|
| 128   | 80 | ♠    | 55EC     | Pique                     | 00 10 38 7C FE FE FE 10 38 7C 00 00 |
| 129   | 81 | ♥    | 55F8     | Coeur                     | 00 00 6C FE FE FE FE 7C 38 10 00 00 |
| 130   | 82 | ♣    | 5604     | Trèfle                    | 00 38 38 FE FE FE D6 10 38 7C 00 00 |
| 131   | 83 | ♦    | 5610     | Carreau                   | 00 10 38 38 7C FE 7C 38 38 10 00 00 |
| 132   | 84 | ○    | 561C     | Rond vide                 | 00 00 38 44 82 82 82 44 38 00 00 00 |
| 133   | 85 | ●    | 5628     | Rond plein                | 00 00 38 7C FE FE FE 7C 38 00 00 00 |
| 134   | 86 |      | 5634     | carré                     | 00 00 7E 42 42 42 42 42 42 7E 00 00 |
| 135   | 87 |      | 5640     | carré plein               | 00 00 7E 7E 7E 7E 7E 7E 7E 7E 00 00 |
| 136   | 88 |      | 564C     | X                         | 00 00 82 44 28 10 28 44 82 00 00 00 |
| 137   | 89 |      | 5658     | Signe PI                  | 00 00 00 7C A8 28 28 28 48 8E 00 00 |
| 138   | 8A |      | 5664     | signe divisé              | 00 00 00 10 00 FE 00 10 00 00 00 00 |
| 139   | 8B |      | 5670     | ? à l'envers              | 00 00 10 00 10 10 08 04 44 44 38 00 |
| 140   | 8C |      | 567C     | ! à l'envers              | 00 00 10 00 00 10 10 10 10 10 10 00 |
| 141   | 8D |      | 5688     | circonflex ^              | 00 10 28 44 00 00 00 00 00 00 00 00 |
| 142   | 8E |      | 5694     | ' aigüe                   | 00 10 10 20 00 00 00 00 00 00 00 00 |
| 143   | 8F |      | 56A0     | ' grave                   | 00 10 10 08 00 00 00 00 00 00 00 00 |
| 144   | 90 |      | 56AC     | accent o                  | 00 00 38 44 38 00 00 00 00 00 00 00 |
| 145   | 91 |      | 56B8     | tréma                     | 00 28 00 00 00 00 00 00 00 00 00 00 | 
| 146   | 92 |      | 56C4     | 1/4                       | 00 00 40 C0 44 4C 54 1E 04 00 00 00 |
| 147   | 93 |      | 56D0     | 1/2                       | 00 00 40 C0 4C 52 44 08 1E 00 00 00 |
| 148   | 94 |      | 56DC     | 1/3                       | 00 00 E0 10 62 16 EA 0F 02 00 00 00 |
| 149   | 95 |      | 56E8     | - tableau .               | 00 00 00 00 00 18 18 00 00 00 00 00 |
| 150   | 96 |      | 56F4     | - tableau H               | 18 18 18 18 18 18 18 00 00 00 00 00 |
| 151   | 97 |      | 5700     | - tableau D               | 00 00 00 00 00 1F 1F 00 00 00 00 00 |
| 152   | 98 |      | 570C     | - tableau B               | 00 00 00 00 00 18 18 18 18 18 18 18 |
| 153   | 99 |      | 5718     | - tableau G               | 00 00 00 00 00 F8 F8 00 00 00 00 00 |
| 154   | 9A | └    | 5724     | - tableau HD              | 18 18 18 18 18 1F 0F 00 00 00 00 00 |
| 155   | 9B | ┌    | 5730     | - tableau DB              | 00 00 00 00 00 0F 1F 18 18 18 18 18 |
| 156   | 9C | ┘    | 573C     | - tableau HG              | 18 18 18 18 18 F8 F0 00 00 00 00 00 |
| 157   | 9D | ┐    | 5748     | - tableau GB              | 00 00 00 00 00 F0 F8 18 18 18 18 18 |
| 158   | 9E | │    | 5754     | - tableau HB              | 18 18 18 18 18 18 18 18 18 18 18 18 |
| 159   | 9F | ─    | 5760     | - tableau DG              | 00 00 00 00 00 FF FF 00 00 00 00 00 |
| 160   | A0 | ┴    | 576C     | - tableau HDG             | 18 18 18 18 18 FF FF 00 00 00 00 00 |
| 161   | A1 | ├    | 5778     | - tableau HDB             | 18 18 18 18 18 1F 1F 18 18 18 18 18 |
| 162   | A2 | ┬    | 5784     | - tableau GBD             | 00 00 00 00 00 FF FF 18 18 18 18 18 |
| 163   | A3 | ┤    | 5790     | - tableau HGB             | 18 18 18 18 18 F8 F8 18 18 18 18 18 |
| 164   | A4 | ┼    | 579C     | - tableau croix HBGD      | 18 18 18 18 18 FF FF 18 18 18 18 18 |
| 165   | A5 |      | 57A8     | barre H                   | FF FF 00 00 00 00 00 00 00 00 00 00 |
| 166   | A6 |      | 57B4     | barre G                   | 03 03 03 03 03 03 03 03 03 03 03 03 |
| 167   | A7 |      | 57C0     | barre B                   | 00 00 00 00 00 00 00 00 00 00 FF FF |
| 168   | A8 |      | 57CC     | barre D                   | C0 C0 C0 C0 C0 C0 C0 C0 C0 C0 C0 C0 |
| 169   | A9 |      | 57D8     | - bloc H                  | FF FF FF FF FF FF 00 00 00 00 00 00 |
| 170   | AA |      | 57E4     | - bloc D                  | 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F |
| 171   | AB |      | 57F0     | - bloc B                  | 00 00 00 00 00 00 FF FF FF FF FF FF |
| 172   | AC |      | 57FC     | - Bloc G                  | F0 F0 F0 F0 F0 F0 F0 F0 F0 F0 F0 F0 |
| 173   | AD |      | 5808     | - bloc HD                 | 0F 0F 0F 0F 0F 0F 00 00 00 00 00 00 |
| 174   | AE |      | 5814     | - bloc HG                 | F0 F0 F0 F0 F0 F0 00 00 00 00 00 00 |
| 175   | AF |      | 5820     | - bloc BD                 | 00 00 00 00 00 00 0F 0F 0F 0F 0F 0F |
| 176   | B0 |      | 582C     | - bloc BG                 | 00 00 00 00 00 00 F0 F0 F0 F0 F0 F0 |
| 177   | B1 |      | 5838     | - bloc bg hd              | 0F 0F 0F 0F 0F 0F F0 F0 F0 F0 F0 F0 |
| 178   | B2 |      | 5844     | - bloc                    | F0 F0 F0 F0 F0 F0 0F 0F 0F 0F 0F 0F |
| 179   | B3 |      | 5850     | - bloc bd hg              | FF FF FF FF FF FF F0 F0 F0 F0 F0 F0 |
| 180   | B4 |      | 585C     | - bloc                    | FF FF FF FF FF FF 0F 0F 0F 0F 0F 0F |
| 181   | B5 |      | 5868     | - bloc                    | F0 F0 F0 F0 F0 F0 FF FF FF FF FF FF |
| 182   | B6 |      | 5874     | - bloc                    | FF FF FF FF FF FF 0F 0F 0F 0F 0F 0F |
| 183   | B7 |      | 5880     | - Bloc plein              | FF FF FF FF FF FF FF FF FF FF FF FF |
| 184   | B8 |      | 588C     | 4x4                       | 00 00 00 00 00 00 00 00 0F 0F 0F 0F |
| 185   | B9 |      | 5898     | 4x4                       | 00 00 00 00 00 00 00 00 F0 F0 F0 F0 |
| 186   | BA |      | 58A4     | 4x4                       | 0F 0F 0F 0F 00 00 00 00 00 00 00 00 |
| 187   | BB |      | 58B0     | 4x4                       | F0 F0 F0 F0 00 00 00 00 00 00 00 00 |
| 188   | BC |      | 58BC     | 4x4                       | 00 00 00 00 0F 0F 0F 0F 00 00 00 00 |
| 189   | BD |      | 58C8     | 4x4                       | 00 00 00 00 F0 F0 F0 F0 00 00 00 00 |
| 190   | BE |      | 58D4     | barre /                   | 03 03 03 06 0E 1C 38 70 60 C0 C0 C0 |
| 191   | BF |      | 58E0     | barre \                   | C0 C0 C0 60 70 38 1C 0E 06 03 03 03 |
| 192   | C0 |      | 58EC     | damier 2x2                | CC CC 33 33 CC CC 33 33 CC CC 33 33 |
| 193   | C1 |      | 58F8     | damier 1x2                | CC 33 CC 33 CC 33 CC 33 CC 33 CC 33 |
| 194   | C2 |      | 5904     | damier 1x1                | AA 55 AA 55 AA 55 AA 55 AA 55 AA 55 |
| 195   | C3 |      | 5910     | damier 1x1 1              | A0 50 A0 50 A0 50 00 00 00 00 00 00 |
| 196   | C4 |      | 591C     | damier 1x1 2              | 0A 05 0A 05 0A 05 00 00 00 00 00 00 |
| 197   | C5 |      | 5928     | damier 1x1 3              | 00 00 00 00 00 00 0A 05 0A 05 0A 05 |
| 198   | C6 |      | 5934     | damier 1x1 4              | 00 00 00 00 00 00 A0 50 A0 50 A0 50 |
| 199   | C7 |      | 5940     | damier 1x1 H              | AA 55 AA 55 AA 55 00 00 00 00 00 00 |
| 200   | C8 |      | 594C     | damier 1x1 D              | 0A 05 0A 05 0A 05 0A 05 0A 05 0A 05 |
| 201   | C9 |      | 5958     | damier 1x1 B              | 00 00 00 00 00 00 AA 55 AA 55 AA 55 |
| 202   | CA |      | 5964     | damier 1x1 G              | A0 50 A0 50 A0 50 A0 50 A0 50 A0 50 |
| 203   | CB |      | 5970     | damier 1x1 HG             | AA 55 AA 55 AA 55 A0 50 A0 50 A0 50 |
| 204   | CC |      | 597C     | damier 1x1                | AA 55 AA 55 AA 55 0A 05 0A 05 0A 05 |
| 205   | CD |      | 5988     | damier 1x1                | 0A 05 0A 05 0A 05 AA 55 AA 55 AA 55 |
| 206   | CE |      | 5994     | damier 1x1                | A0 50 A0 50 A0 50 AA 55 AA 55 AA 55 |
| 207   | CF |      | 59A0     | bloc & damier             | FF FF FF FF FF FF AA 55 AA 55 AA 55 |
| 208   | D0 |      | 59AC     | bloc & damier             | AA 55 AA 55 AA 55 FF FF FF FF FF FF |
| 209   | D1 |      | 59B8     | bloc & damier             | FA F5 FA F5 FA F5 FA F5 FA F5 FA F5 |
| 210   | D2 |      | 59C4     | bloc & damier             | AF 5F AF 5F AF 5F AF 5F AF 5F AF 5F |
| 211   | D3 |      | 59D0     | (c)                       | 00 00 00 38 44 BA A2 BA 44 38 00 00 | 
| 212   | D4 |      | 59DC     | Flocon                    | 99 99 5A 24 24 C3 C3 24 24 5A 99 99 |
| 213   | D5 | ⚅    | 59E8     | dé 6                      | 00 7C 82 AA 82 AA 82 AA 82 7C 00 00 |
| 214   | D6 | ⚄    | 59F4     | dé 5                      | 00 00 7C 82 AA 82 92 82 AA 82 7C 00 |
| 215   | D7 | ⚃    | 5A00     | dé 4                      | 00 00 7C 82 AA 82 82 82 AA 82 7C 00 |
| 216   | D8 | ⚂    | 5A0C     | dé 3                      | 00 00 7C 82 8A 82 92 82 A2 82 7C 00 |
| 217   | D9 | ⚁    | 5A18     | dé 2                      | 00 00 7C 82 8A 82 82 82 A2 82 7C 00 |
| 218   | DA | ⚀    | 5A24     | dé 1                      | 00 00 7C 82 82 82 92 82 82 82 7C 00 |
| 219   | DB | 𓋹    | 5A30     | Ankh                      | 00 38 44 44 28 10 FE 10 10 10 10 00 |
| 220   | DC |      | 5A3C     | Coupe                     | 00 00 82 44 7C 7C 38 10 10 38 00 00 |
| 221   | DD |      | 5A48     | Tête de mort              | 00 00 7C FE 92 92 FE 6C 38 28 00 00 |
| 222   | DE |      | 5A54     | Porte                     | 18 24 42 99 99 81 81 A1 A1 81 81 FF |
| 223   | DF |      | 5A60     | Escalier up               | 18 24 42 81 81 8D 81 9D 81 BD 81 FF |
| 224   | E0 |      | 5A6C     | Coffre                    | 00 00 00 3C 42 81 FF 81 99 81 81 FF |
| 225   | E1 |      | 5A78     | Clef                      | 00 10 28 44 28 10 10 10 18 10 18 00 |
| 226   | E2 |      | 5A84     | Fiole                     | 00 00 3C 18 18 18 24 42 A1 B1 81 7E |
| 227   | E3 |      | 5A90     | bombe ronde               | 00 02 05 0A 18 3C 42 8D 81 81 42 3C |
| 228   | E4 |      | 5A9C     | flag                      | FE FE FE FE FE FE FE FE EE C6 82 00 |
| 229   | E5 |      | 5AA8     | immeuble                  | 18 7E 5A 7E 5A 7E 5A 7E 5A 7E 5A FF |
| 230   | E6 |      | 5AB4     | coin                      | 00 00 3C 42 99 91 91 99 42 3C 00 00 |
| 231   | E7 |      | 5AC0     | hachure                   | 88 11 22 44 88 11 22 44 88 11 22 44 |
| 232   | E8 |      | 5ACC     | fusée                     | 18 18 3C 3C 3C 3C 3C 3C 3C 3C 7E DB |
| 233   | E9 |      | 5AD8     | Bombe                     | 00 3C 18 18 3C 3C 3C 3C 3C 3C 18 00 |
| 234   | EA |      | 5AE4     | Tombe (croix)             | 00 00 00 00 18 18 7E 7E 18 18 18 7E |
| 235   | EB |      | 5AF0     | Orage                     | 00 00 7E FF FF 7E 18 0C 18 30 18 00 |
| 236   | EC |      | 5AFC     | note                      | 00 0C 0C 0C 0C 0C 0C 3C 7C 38 00 00 |
| 237   | ED |      | 5B08     | note croche               | 00 18 1C 1E 1B 18 18 78 F8 70 00 00 |
| 238   | EE |      | 5B14     | Mâle                      | 00 0F 07 0D 78 CC CC CC 78 00 00 00 |
| 239   | EF |      | 5B20     | homme                     | 3C 3C 3C 18 3C 5A 5A 18 24 24 24 24 |
| 240   | F0 |      | 5B2C     | homme IoI                 | 3C 3C BD 99 7E 18 18 18 24 24 24 24 |
| 241   | F1 |      | 5B38     | Femelle                   | 00 3C 66 66 66 3C 18 7E 18 00 00 00 |
| 242   | F2 |      | 5B44     | femme                     | 3C 3C 3C 18 3C 5A 5A 18 3C 7E 24 24 |
| 243   | F3 |      | 5B50     | femme IoI                 | 3C 3C BD 99 7E 18 18 18 3C 7E 24 24 |
| 244   | F4 |      | 5B5C     | smiley :)                 | 00 00 7E FF 99 FF BD C3 FF 7E 00 00 |
| 245   | F5 |      | 5B68     | smiley :(                 | 00 00 7E FF 99 FF C3 BD FF 7E 00 00 |
| 246   | F6 |      | 5B74     | Triangle D                | 00 00 C0 F0 FC FF FF FC F0 C0 00 00 |
| 247   | F7 |      | 5B80     | Triangle G                | 00 00 03 0F 3F FF FF 3F 0F 03 00 00 |
| 248   | F8 |      | 5B8C     | Triangle H                | 00 00 18 18 3C 3C 7E 7E FF FF 00 00 |
| 249   | F9 |      | 5B98     | Triangle B                | 00 00 FF FF 7E 7E 3C 3C 18 18 00 00 |
| 250   | FA | ↑    | 5BA4     | Flèche Haut               | 18 3C 7E FF 18 18 18 18 18 18 18 18 |
| 251   | FB | ↓    | 5BB0     | Flèche Bas                | 18 18 18 18 18 18 18 18 FF 7E 3C 18 |
| 252   | FC | ←    | 5BBC     | Flèche Gauche             | 00 00 00 20 60 FF FF 60 20 00 00 00 |
| 253   | FD | →    | 5BC8     | Flèche Droite             | 00 00 00 04 06 FF FF 06 04 00 00 00 |
| 254   | FE |      | 5BD4     | Flèche Haut bas           | 18 3C 7E FF 18 18 18 18 FF 7E 3C 18 |
| 255   | FF |      | 5BE0     | Flèche Gauche Droite      | 00 00 00 24 66 FF FF 66 24 00 00 00 |

___
#### Autres étude de caractères semi-graphique

Un Poke directe en mémoire est toujours possible.\
Cepandant attention quand on est en Screen 1 ou 2 qui sont des mode texte avec une plage mémoire d'attributs.

| Comment                   | Hexa |
|---------------------------|------|
| cat                       | 00 00 00 00 88 F8 A8 71 21 79 7D BE |
| Coin (Pièce); le (c) copyright pourait faire l'affaire. | 00 00 3C 42 99 91 91 99 42 3C 00 00 |
| pot                       | 00 18 7E 24 24 42 42 42 42 42 42 3C |
| Double barre verticale    | 00 00 66 66 66 66 66 66 66 66 00 00 |
| Motif                     | DD AA 77 AA DD AA 77 AA DD AA 77 AA |
| Motif cadrillage          | FF 88 88 88 88 88 FF 88 88 88 88 88 |
| Motif cadrillage          | 77 88 88 88 88 88 77 88 88 88 88 88 |
| Hachure                   | 88 11 22 44 88 11 22 44 88 11 22 44 |
| Fantôme                   | 3C 42 81 A9 A9 81 81 91 81 81 55 2A |
| Cadenas                   | 00 00 38 44 44 FE EE EE FE 7C 00 00 |
| fiole                     | 3C 3C 00 3C 42 8D A5 A1 A1 91 42 3C |
| Feu                       | 08 42 52 58 1C 7E 67 63 C1 C1 C3 66 |
| O                         | 18 18 24 24 24 C3 C3 24 24 24 18 18 |
| £                         | 00 3C 66 60 60 F8 60 60 66 FE 00 00 |
| P (inverse)               | 00 7E F4 F4 74 34 34 34 34 34 00 00 |
| paragraphe                | 00 00 1E 30 38 6C 6C 38 18 F0 00 00 |
| \`                        | 00 18 18 0C 00 00 00 00 00 00 00 00 |
| division épais            | 00 00 18 18 00 7E 7E 00 18 18 00 00 |
| char tab                  | 00 00 00 00 00 7E 7E 06 06 00 00 00 |
| alpha                     | 00 00 00 00 00 73 DE CC DE 73 00 00 |
| beta                      | 00 7C C6 C6 C6 FC C6 C6 C6 F8 C0 00 |
| .                         | 00 00 00 66 66 3C 66 66 66 3C 00 00 |
| .                         | 00 00 3C 60 60 3C 66 66 66 3C 00 00 |
| .                         | 00 00 00 00 1E 30 7C 7C 30 1E 00 00 |
| .                         | 00 38 6C C6 C6 FE C6 C6 6C 38 00 00 |
| .                         | 00 00 C0 60 60 30 38 6C 6C C6 00 00 |
| .                         | 00 00 00 66 66 66 66 7C 60 60 60 00 |
| .pi                       | 00 00 00 7C A8 28 28 28 48 8E 00 00 |
| .                         | 00 00 00 00 00 7E D8 D8 D8 70 00 00 |
| .                         | 00 00 03 06 0C 3C 66 3C 60 C0 00 00 |
| .                         | 00 00 03 06 0C 66 66 3C 60 C0 00 00 |
| .                         | 00 00 00 E6 3C 18 18 38 6C C7 00 00 |
| .                         | 00 00 00 00 66 C3 C3 DB DB 7E 00 00 |
| .                         | 00 00 FE C6 C0 60 30 60 C6 FE 00 00 |
| Omega                     | 00 00 00 7C C6 C6 C6 C6 6C EE 00 00 |



___
### work

Etude Assembleur pour compléter la ROM

#### Exemples

##### Afficher un caractère

Affiche « A »

```asm
    LD HL, 6000h   ; Adresse mémoire vidéo
    LD A, 'A'      ; Code ASCII de 'A' (0x41)
    LD (HL), A     ; Écrit le caractère à l’écran
    RET            ; Retourne au programme appelant
```
Code hexa:\
21 00 60 3E 41 77 C9

##### Randomize

Soit le programme BASIC de randomize du PHC-25.

```basic
10 I=RANDOMIZE(-TIME)
```

Converti en ASM.\
Trouver l'adresse du compteur de temps.

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

Pendant hexa:\
TO DO.

##### Refaire le choix de 1 ou 2 écrans

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

### Inspiration

[Jeu de caractères AMSTRAD](https://asmtradcpc.zilog.fr/docs/Table_des_caracteres_ASCII.php)

et ZX81.
___


### Dump mémoire

LPRINT des chars. Sur un fichier ouvert pour impression.\
Par bloc de 12 octets pour le code des caractères.

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


___