# Basic Programs for Sanyo PHC-25

___
## Introduction 

Travaux pour programes BASIC avec la ROM 1.4.\
Donc usage du jeu de caractères étendus de la ROM.

La machine la plus proche est le ZX81, qui partage aussi le Z80.\
Donc les adaptations doivent être facilitées.

___
## Conversion .P to .TXT

Un convertisseur experimental de fichier ZX81 .P vers .TXT.\
Avec possibilité de conversion dess caractères semi-graphiques du ZX81 qui existent en unicode.

- HTML
- CSS
- Javascript

Tout dans 1 seul fichier HTML. Donc compatible tout systèmes.\
Pourquoi s'emm... avec du C ou autre quand Javascript peut faire le taf. De plus c'est plus facile de debugger et coriger.\
Même chose pour améliorer.

La suite c'est le recodage pour PHC-25 une fois le code extrait.

___
## BIN Extractor

Même principe mais pour extraire le binaire d'un source .P.

Charge le .P et test si il y a du binaire au début.\
Si oui extraction possible.\
Sauve sous le même nom mais avec .bin.

Si je ne fait pas d'erreur, le start du binaire est 0x4005 soit décimal 16389.

étape suivante passer le bin au désassembleur en précisant Org 0x4005.

___
## Ressources

ZX81:
- https://www.retroisle.com/sinclair/zx81/general.php
- https://www.retroisle.com/sinclair/zx81/software.php
- https://www.gladir.com/CODER/ZXBASIC/reference.htm
- https://github.com/vegagak/ZXList
- https://github.com/mcleod-ideafix/zx81putil
- https://www.zx81.nl/files.html
- ...

___
## ZX81 char tables

Les tables du jeu de caractères ZX81.\
L'idée est de pouvoir les exploiter pour les conversion.



| Dec | Hex | Glyph | Description                  | Typical interpreted char |
|-----|-----|-------|------------------------------|--------------------------|
| 0   | 00  |       | Space                        | (space)                  |
| 1   | 01  | ▗     | Block graphic (BR quarter)   | control                  |
| 2   | 02  | ▖     | Block graphic (BL quarter)   | control                  |
| 3   | 03  | ▄     | Block graphic (bottom half)  | control                  |
| 4   | 04  | ▝     | Block graphic (TR quarter)   | control                  |
| 5   | 05  | ▐     | Block graphic (right half)   | control                  |
| 6   | 06  | ▞     | Block graphic (diag TR+BL)   | control                  |
| 7   | 07  | ▙     | Block graphic (3/4, no TR)   | control                  |
| 8   | 08  | ▘     | Block graphic (TL quarter)   | control                  |
| 9   | 09  | ▌     | Block graphic (left half)    | control                  |
| 10  | 0A  | ▚     | Block graphic (diag TL+BR)   | control                  |
| 11  | 0B  | ▛     | Block graphic (3/4, no BR)   | control                  |
| 12  | 0C  | ▀     | Block graphic (top half)     | control                  |
| 13  | 0D  | ▜     | Block graphic (3/4, no BL)   | control                  |
| 14  | 0E  | ▟     | Block graphic (3/4, no TL)   | control                  |
| 15  | 0F  | █     | Block graphic (full block)   | control                  |
| 16  | 10  | 0     | Digit 0                      | 0                        |
| 17  | 11  | 1     | Digit 1                      | 1                        |
| 18  | 12  | 2     | Digit 2                      | 2                        |
| 19  | 13  | 3     | Digit 3                      | 3                        |
| 20  | 14  | 4     | Digit 4                      | 4                        |
| 21  | 15  | 5     | Digit 5                      | 5                        |
| 22  | 16  | 6     | Digit 6                      | 6                        |
| 23  | 17  | 7     | Digit 7                      | 7                        |
| 24  | 18  | 8     | Digit 8                      | 8                        |
| 25  | 19  | 9     | Digit 9                      | 9                        |
| 26  | 1A  | A     | Letter A                     | A                        |
| 27  | 1B  | B     | Letter B                     | B                        |
| 28  | 1C  | C     | Letter C                     | C                        |
| 29  | 1D  | D     | Letter D                     | D                        |
| 30  | 1E  | E     | Letter E                     | E                        |
| 31  | 1F  | F     | Letter F                     | F                        |
| 32  | 20  | G     | Letter G                     | G                        |
| 33  | 21  | H     | Letter H                     | H                        |
| 34  | 22  | I     | Letter I                     | I                        |
| 35  | 23  | J     | Letter J                     | J                        |
| 36  | 24  | K     | Letter K                     | K                        |
| 37  | 25  | L     | Letter L                     | L                        |
| 38  | 26  | M     | Letter M                     | M                        |
| 39  | 27  | N     | Letter N                     | N                        |
| 40  | 28  | O     | Letter O                     | O                        |
| 41  | 29  | P     | Letter P                     | P                        |
| 42  | 2A  | Q     | Letter Q                     | Q                        |
| 43  | 2B  | R     | Letter R                     | R                        |
| 44  | 2C  | S     | Letter S                     | S                        |
| 45  | 2D  | T     | Letter T                     | T                        |
| 46  | 2E  | U     | Letter U                     | U                        |
| 47  | 2F  | V     | Letter V                     | V                        |
| 48  | 30  | W     | Letter W                     | W                        |
| 49  | 31  | X     | Letter X                     | X                        |
| 50  | 32  | Y     | Letter Y                     | Y                        |
| 51  | 33  | Z     | Letter Z                     | Z                        |
| 52  | 34  | +     | Plus sign                    | +                        |
| 53  | 35  | -     | Minus sign                   | -                        |
| 54  | 36  | *     | Asterisk                     | *                        |
| 55  | 37  | /     | Slash                        | /                        |
| 56  | 38  | =     | Equals sign                  | =                        |
| 57  | 39  | .     | Period                       | .                        |
| 58  | 3A  | ,     | Comma                        | ,                        |
| 59  | 3B  | ;     | Semicolon                    | ;                        |
| 60  | 3C  | :     | Colon                        | :                        |
| 61  | 3D  | "     | Quote                        | "                        |
| 62  | 3E  | £     | Pound sign                   | £                        |
| 63  | 3F  | ?     | Question mark                | ?                        |

64-127:\
Mot clés BASIC.

| Decimal | Hex | Token/Glyph | Description                        | Typical interpreted char |
|---------|-----|-------------|------------------------------------|--------------------------|
| 64      | 40  | NEW         | BASIC keyword NEW                  | @                        |
| 65      | 41  | REM         | BASIC keyword REM                  | A                        |
| 66      | 42  | RAND        | BASIC keyword RAND                 | B                        |
| 67      | 43  | IF          | BASIC keyword IF                   | C                        |
| 68      | 44  | FOR         | BASIC keyword FOR                  | D                        |
| 69      | 45  | PRINT       | BASIC keyword PRINT                | E                        |
| 70      | 46  | GOTO        | BASIC keyword GOTO                 | F                        |
| 71      | 47  | INPUT       | BASIC keyword INPUT                | G                        |
| 72      | 48  | DIM         | BASIC keyword DIM                  | H                        |
| 73      | 49  | LET         | BASIC keyword LET                  | I                        |
| 74      | 4A  | STOP        | BASIC keyword STOP                 | J                        |
| 75      | 4B  | RETURN      | BASIC keyword RETURN               | K                        |
| 76      | 4C  | CLS         | BASIC keyword CLS                  | L                        |
| 77      | 4D  | CLEAR       | BASIC keyword CLEAR                | M                        |
| 78      | 4E  | CONT        | BASIC keyword CONT                 | N                        |
| 79      | 4F  | LIST        | BASIC keyword LIST                 | O                        |
| 80      | 50  | RUN         | BASIC keyword RUN                  | P                        |
| 81      | 51  | SAVE        | BASIC keyword SAVE                 | Q                        |
| 82      | 52  | LOAD        | BASIC keyword LOAD                 | R                        |
| 83      | 53  | RANDOMIZE   | BASIC keyword RANDOMIZE            | S                        |
| 84      | 54  | NEXT        | BASIC keyword NEXT                 | T                        |
| 85      | 55  | PAUSE       | BASIC keyword PAUSE                | U                        |
| 86      | 56  | POKE        | BASIC keyword POKE                 | V                        |
| 87      | 57  | PRINT AT    | BASIC keyword PRINT AT             | W                        |
| 88      | 58  | LPRINT      | BASIC keyword LPRINT               | X                        |
| 89      | 59  | LLIST       | BASIC keyword LLIST                | Y                        |
| 90      | 5A  | SLOW        | BASIC keyword SLOW                 | Z                        |
| 91      | 5B  | FAST        | BASIC keyword FAST                 | [                        |
| 92      | 5C  | VERIFY      | BASIC keyword VERIFY               | \                        |
| 93      | 5D  | MERGE       | BASIC keyword MERGE                | ]                        |
| 94      | 5E  | EDIT        | BASIC keyword EDIT                 | ^                        |
| 95      | 5F  | COPY        | BASIC keyword COPY                 | _                        |
| 96      | 60  | DEF FN      | BASIC keyword DEF FN               | `                        |
| 97      | 61  | FN          | BASIC keyword FN                   | a                        |
| 98      | 62  | LINE        | BASIC keyword LINE                 | b                        |
| 99      | 63  | THEN        | BASIC keyword THEN                 | c                        |
| 100     | 64  | TO          | BASIC keyword TO                   | d                        |
| 101     | 65  | STEP        | BASIC keyword STEP                 | e                        |
| 102     | 66  | USR         | BASIC keyword USR                  | f                        |
| 103     | 67  | VAL         | BASIC keyword VAL                  | g                        |
| 104     | 68  | LEN         | BASIC keyword LEN                  | h                        |
| 105     | 69  | SIN         | BASIC keyword SIN                  | i                        |
| 106     | 6A  | COS         | BASIC keyword COS                  | j                        |
| 107     | 6B  | TAN         | BASIC keyword TAN                  | k                        |
| 108     | 6C  | ATN         | BASIC keyword ATN                  | l                        |
| 109     | 6D  | EXP         | BASIC keyword EXP                  | m                        |
| 110     | 6E  | INT         | BASIC keyword INT                  | n                        |
| 111     | 6F  | SQR         | BASIC keyword SQR                  | o                        |
| 112     | 70  | SGN         | BASIC keyword SGN                  | p                        |
| 113     | 71  | ABS         | BASIC keyword ABS                  | q                        |
| 114     | 72  | PEEK        | BASIC keyword PEEK                 | r                        |
| 115     | 73  | CODE        | BASIC keyword CODE                 | s                        |
| 116     | 74  | VAL$        | BASIC keyword VAL$                 | t                        |
| 117     | 75  | STR$        | BASIC keyword STR$                 | u                        |
| 118     | 76  | CHR$        | BASIC keyword CHR$                 | v                        |
| 119     | 77  | ASC         | BASIC keyword ASC                  | w                        |
| 120     | 78  | LEN$        | BASIC keyword LEN$                 | x                        |
| 121     | 79  | INKEY$      | BASIC keyword INKEY$               | y                        |
| 122     | 7A  | PI          | BASIC keyword PI                   | z                        |
| 123     | 7B  | RND         | BASIC keyword RND                  | {                        |
| 124     | 7C  | NOT         | BASIC keyword NOT                  | |                        |
| 125     | 7D  | AND         | BASIC keyword AND                  | }                        |
| 126     | 7E  | OR          | BASIC keyword OR                   | ~                        |
| 127     | 7F  | >=          | BASIC keyword >=                   | DEL                      |



| Decimal | Hex  | Glyph (inv) | Description                          | Typical interpreted char |
|---------|------|-------------|--------------------------------------|--------------------------|
| 128     | 80   | ▗ (inv)     | Inverse bottom‑right quarter         |  (control/extended)     |
| 129     | 81   | ▖ (inv)     | Inverse bottom‑left quarter          | ‘                        |
| 130     | 82   | ▄ (inv)     | Inverse bottom half                  | ’                        |
| 131     | 83   | ▝ (inv)     | Inverse top‑right quarter            | “                        |
| 132     | 84   | ▐ (inv)     | Inverse right half                   | ”                        |
| 133     | 85   | ▞ (inv)     | Inverse diagonal (TR+BL)             | •                        |
| 134     | 86   | ▙ (inv)     | Inverse three quarters (no TR)       | –                        |
| 135     | 87   | ▘ (inv)     | Inverse top‑left quarter             | —                        |
| 136     | 88   | ▌ (inv)     | Inverse left half                    | ˜                        |
| 137     | 89   | ▚ (inv)     | Inverse diagonal (TL+BR)             | ™                        |
| 138     | 8A   | ▛ (inv)     | Inverse three quarters (no BR)       | š                        |
| 139     | 8B   | ▀ (inv)     | Inverse top half                     | ›                        |
| 140     | 8C   | ▜ (inv)     | Inverse three quarters (no BL)       | œ                        |
| 141     | 8D   | ▟ (inv)     | Inverse three quarters (no TL)       |                         |
| 142     | 8E   | █ (inv)     | Inverse full block                   | ž                        |
| 143     | 8F   | (blank inv) | Inverse empty block                  | Ÿ                        |



| Decimal | Hex  | Glyph (inv) | Description                          | Typical interpreted char |
|---------|------|-------------|--------------------------------------|--------------------------|
| 144     | 90   | 0 (inv)     | Inverse digit 0                      |  (control/extended)     |
| 145     | 91   | 1 (inv)     | Inverse digit 1                      | ‘                        |
| 146     | 92   | 2 (inv)     | Inverse digit 2                      | ’                        |
| 147     | 93   | 3 (inv)     | Inverse digit 3                      | “                        |
| 148     | 94   | 4 (inv)     | Inverse digit 4                      | ”                        |
| 149     | 95   | 5 (inv)     | Inverse digit 5                      | •                        |
| 150     | 96   | 6 (inv)     | Inverse digit 6                      | –                        |
| 151     | 97   | 7 (inv)     | Inverse digit 7                      | —                        |
| 152     | 98   | 8 (inv)     | Inverse digit 8                      | ˜                        |
| 153     | 99   | 9 (inv)     | Inverse digit 9                      | ™                        |
| 154     | 9A   | A (inv)     | Inverse letter A                     | š                        |
| 155     | 9B   | B (inv)     | Inverse letter B                     | ›                        |
| 156     | 9C   | C (inv)     | Inverse letter C                     | œ                        |
| 157     | 9D   | D (inv)     | Inverse letter D                     | **Ý**                    |
| 158     | 9E   | E (inv)     | Inverse letter E                     | ž                        |
| 159     | 9F   | F (inv)     | Inverse letter F                     | Ÿ                        |
| 160     | A0   | G (inv)     | Inverse letter G         |   (non‑breaking space)   |
| 161     | A1   | H (inv)     | Inverse letter H         | ¡                        |
| 162     | A2   | I (inv)     | Inverse letter I         | ¢                        |
| 163     | A3   | J (inv)     | Inverse letter J         | £                        |
| 164     | A4   | K (inv)     | Inverse letter K         | ¤                        |
| 165     | A5   | L (inv)     | Inverse letter L         | ¥                        |
| 166     | A6   | M (inv)     | Inverse letter M         | ¦                        |
| 167     | A7   | N (inv)     | Inverse letter N         | §                        |
| 168     | A8   | O (inv)     | Inverse letter O         | ¨                        |
| 169     | A9   | P (inv)     | Inverse letter P         | ©                        |
| 170     | AA   | Q (inv)     | Inverse letter Q         | ª                        |
| 171     | AB   | R (inv)     | Inverse letter R         | «                        |
| 172     | AC   | S (inv)     | Inverse letter S         | ¬                        |
| 173     | AD   | T (inv)     | Inverse letter T         | ­ (soft hyphen)          |
| 174     | AE   | U (inv)     | Inverse letter U         | ®                        |
| 175     | AF   | V (inv)     | Inverse letter V         | ¯                        |
| 176     | B0   | W (inv)     | Inverse letter W         | °                        |
| 177     | B1   | X (inv)     | Inverse letter X         | ±                        |
| 178     | B2   | Y (inv)     | Inverse letter Y         | ²                        |
| 179     | B3   | Z (inv)     | Inverse letter Z         | ³                        |
| 180     | B4   | + (inv)     | Inverse plus sign        | ´                        |
| 181     | B5   | - (inv)     | Inverse minus sign       | µ                        |
| 182     | B6   | * (inv)     | Inverse asterisk         | ¶                        |
| 183     | B7   | / (inv)     | Inverse slash            | ·                        |
| 184     | B8   | = (inv)     | Inverse equals sign      | ¸                        |
| 185     | B9   | . (inv)     | Inverse period           | ¹                        |
| 186     | BA   | , (inv)     | Inverse comma            | º                        |
| 187     | BB   | ; (inv)     | Inverse semicolon        | »                        |
| 188     | BC   | : (inv)     | Inverse colon            | ¼                        |
| 189     | BD   | " (inv)     | Inverse quote            | ½                        |
| 190     | BE   | £ (inv)     | Inverse pound sign       | ¾                        |
| 191     | BF   | ? (inv)     | Inverse question mark    | ¿                        |





___
