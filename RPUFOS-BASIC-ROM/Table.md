# Jeu de caractère PHC-25

## Introduction

Lire la ROM est récupérer les codes Hexa.

Création de nouveaux caractères.

Test à faire sur une vraie machine.\
Je n'en ai pas.

___
## Tables adresse jeux de caractère

Non affichable.\
Valeur décimal.\
TO DO : mettre la valeur &H.

La colonne "Hexa" des tables correspond au 12 octets en hexadécimal.\
Suite à une boulette je les ai stupidement perdu... à refaire.

### Table ASCII basse

Les caractères de contrôles.\
Va savoir pourquoi SANYO y a collé des caractères graphique... :-/


| ASCII | Char | Adresse  | Comment | Hexa |
|-------|------|----------|---------|------|
| 0     | NUL  | 4F60     |
| 1     | SOH  | 4F6C     |
| 2     | STX  | 4F78     |
| 3     | ETX  | 4F84     |
| 4     | EOT  | 4F90     |
| 5     | ENQ  | 4F9C     |
| 6     | ACK  | 4FA8     |
| 7     | BEL  | 4FB4     |
| 8     | BS   | 4FC0     |
| 9     | TAB  | 4FCC     |
| 10    | LF   | 4FD8     |
| 11    | VT   | 4FE4     |
| 12    | FF   | 4FF0     |
| 13    | CR   | 4FFC     |
| 14    | SO   | 5008     |
| 15    | SI   | 5014     |
| 16    | DLE  | 5020     |
| 17    | DC1  | 502C     |
| 18    | DC2  | 5038     |
| 19    | DC3  | 5044     |
| 20    | DC4  | 5050     |
| 21    | NAK  | 505C     |
| 22    | SYN  | 5068     |
| 23    | ETB  | 5074     |
| 24    | CAN  | 5080     |
| 25    | EM   | 508C     |
| 26    | SUB  | 5098     |
| 27    | ESC  | 50A4     |
| 28    | FS   | 50B0     |
| 29    | GS   | 50BC     |
| 30    | RS   | 50C8     |
| 31    | US   | 50D4     |


### Table ASCII standard



| ASCII | Char | Adresse  | Comment | Hexa |
|-------|------|----------|---------|------|
| 32    | SPC  | 50E0     |
| 33    | !    | 50EC     |
| 34    | "    | 50F8     |
| 35    | \#    | 5104     |
| 36    | $    | 5110     |
| 37    | %    | 511C     |
| 38    | &    | 5128     |
| 39    | '    | 5134     |
| 40    | (    | 5140     |
| 41    | )    | 514C     |
| 42    | \*    | 5158     |
| 43    | +    | 5164     |
| 44    | ,    | 5170     |
| 45    | -    | 517C     |
| 46    | .    | 5188     |
| 47    | /    | 5194     |
| 48    | 0    | 51A0     |
| 49    | 1    | 51AC     |
| 50    | 2    | 51B8     |
| 51    | 3    | 51C4     |
| 52    | 4    | 51D0     |
| 53    | 5    | 51DC     |
| 54    | 6    | 51E8     |
| 55    | 7    | 51F4     |
| 56    | 8    | 5200     |
| 57    | 9    | 520C     |
| 58    | :    | 5218     |
| 59    | ;    | 5224     |
| 60    | <    | 5230     |
| 61    | =    | 523C     |
| 62    | >    | 5248     |
| 63    | ?    | 5254     |
| 64    | @    | 5260     |
| 65    | A    | 52F8     |
| 66    | B    | 5304     |
| 67    | C    | 5310     |
| 68    | D    | 531C     |
| 69    | E    | 5328     |
| 70    | F    | 5334     |
| 71    | G    | 5340     |
| 72    | H    | 534C     |
| 73    | I    | 5358     |
| 74    | J    | 5364     |
| 75    | K    | 5370     |
| 76    | L    | 537C     |
| 77    | M    | 5388     |
| 78    | N    | 5394     |
| 79    | O    | 53A0     |
| 80    | P    | 53AC     |
| 81    | Q    | 53B8     |
| 82    | R    | 53C4     |
| 83    | S    | 53D0     |
| 84    | T    | 53DC     |
| 85    | U    | 53E8     |
| 86    | V    | 53F4     |
| 87    | W    | 5400     |
| 88    | X    | 540C     |
| 89    | Y    | 5418     |
| 90    | Z    | 5424     |
| 91    | \[   | 5430     |
| 92    | \    | 543C     |
| 93    | ]    | 5448     |
| 94    | ^    | 5454     |
| 95    | _    | 5460     |
| 96    | \`    | 546C     |
| 97    | a    | 5478     |
| 98    | b    | 5484     |
| 99    | c    | 5490     |
| 100   | d    | 549C     |
| 101   | e    | 54A8     |
| 102   | f    | 54B4     |
| 103   | g    | 54C0     |
| 104   | h    | 54CC     |
| 105   | i    | 54D8     |
| 106   | j    | 54E4     |
| 107   | k    | 54F0     |
| 108   | l    | 54FC     |
| 109   | m    | 5508     |
| 110   | n    | 5514     |
| 111   | o    | 5520     |
| 112   | p    | 552C     |
| 113   | q    | 5538     |
| 114   | r    | 5544     |
| 115   | s    | 5550     |
| 116   | t    | 555C     |
| 117   | u    | 5568     |
| 118   | v    | 5574     |
| 119   | w    | 5580     |
| 120   | x    | 558C     |
| 121   | y    | 5598     |
| 122   | z    | 55A4     |
| 123   | {    | 55B0     |
| 124   | |    | 55BC     |
| 125   | }    | 55C8     |
| 126   | ~    | 55D4     |
| 127   |      | 55E0     | 


### Table ASCII étendue

Codage de 121 caractères suplémentaire. Les 6 premiers déjà pris (128 à 133).\
Inspiré de l'AMSTRAD et du ZX81.


| ASCII | Char | Adresse  | Comment | Hexa |
|-------|------|----------|---------|------|
| 128   |      | 55EC     | pique (229)
| 129   |      | 55F8     | coeur (228) - bloc HG
| 130   |      | 5604     | trèfle (226) - bloc HD
| 131   |      | 5610     | carreau (227) - bloc H
| 132   |      | 561C     | rond vide (230) - bloc BG
| 133   |      | 5628     | rond plein (231) - Bloc G
| 134   |      | 5634     | - bloc bg hd
| 135   |      | 5640     | - bloc
| 136   |      | 564C     | -bloc BD
| 137   |      | 5658     | - bloc
| 138   |      | 5664     | -bloc D
| 139   |      | 5670     | - bloc
| 140   |      | 567C     | -bloc B
| 141   |      | 5688     | -bloc
| 142   |      | 5694     | -bloc
| 143   |      | 56A0     | Bloc plein
| 144   |      | 56AC     | - tableau .
| 145   |      | 56B8     | - tableau H
| 146   |      | 56C4     | - tableau D
| 147   |      | 56D0     | - tableau HD
| 148   |      | 56DC     | - tableau B
| 149   |      | 56E8     | - tableau HB
| 150   |      | 56F4     | - tableau DB
| 151   |      | 5700     | - tableau HDB
| 152   |      | 570C     | - tableau G
| 153   |      | 5718     | - tableau HG
| 154   |      | 5724     | - tableau DG
| 155   |      | 5730     | - tableau HDG
| 156   |      | 573C     | - tableau GB
| 157   |      | 5748     | - tableau HGB
| 158   |      | 5754     | - tableau GBD
| 159   |      | 5760     | - tableau croix HBGD
| 160   |      | 576C     | chapeau ^
| 161   |      | 5778     | '
| 162   |      | 5784     | auréole
| 163   |      | 5790     | £
| 164   |      | 579C     | (c)
| 165   |      | 57A8     | P (inverse)
| 166   |      | 57B4     | paragraphe
| 167   |      | 57C0     | `
| 168   |      | 57CC     | 1/4
| 169   |      | 57D8     | 1/2
| 170   |      | 57E4     | 1/3
| 171   |      | 57F0     | Tombe (croix)
| 172   |      | 57FC     | division
| 173   |      | 5808     | char tab
| 174   |      | 5814     | ? à l'envers
| 175   |      | 5820     | ! à l'envers
| 176   |      | 582C     | alpha
| 177   |      | 5838     | beta
| 178   |      | 5844     | .
| 179   |      | 5850     | .
| 180   |      | 585C     | .
| 181   |      | 5868     | .
| 182   |      | 5874     | .
| 183   |      | 5880     | .
| 184   |      | 588C     | .pi
| 185   |      | 5898     | .
| 186   |      | 58A4     | .
| 187   |      | 58B0     | .
| 188   |      | 58BC     | .
| 189   |      | 58C8     | .
| 190   |      | 58D4     | .
| 191   |      | 58E0     | Omega
| 192   |      | 58EC     | 4x4 
| 193   |      | 58F8     | 4x4 
| 194   |      | 5904     | 4x4 
| 195   |      | 5910     | 4x4 
| 196   |      | 591C     | 4x4 
| 197   |      | 5928     | 4x4 
| 198   |      | 5934     | escalier
| 199   |      | 5940     | porte
| 200   |      | 594C     | fiole
| 201   |      | 5958     | bombe ronde | 02 05 0A 18 3C 42 8D 8D 81 81 42 3C |
| 202   |      | 5964     | O
| 203   |      | 5970     | X
| 204   |      | 597C     | /
| 205   |      | 5988     | \
| 206   |      | 5994     | damier 2x2
| 207   |      | 59A0     | damier 1x1
| 208   |      | 59AC     | barre H
| 209   |      | 59B8     | barre G
| 210   |      | 59C4     | barre B
| 211   |      | 59D0     | barre D
| 212   |      | 59DC     | damier 1x1 1
| 213   |      | 59E8     | damier 1x1 2
| 214   |      | 59F4     | damier 1x1 3
| 215   |      | 5A00     | damier 1x1 4
| 216   |      | 5A0C     | damier 1x1 H
| 217   |      | 5A18     | damier 1x1 D
| 218   |      | 5A24     | damier 1x1 B
| 219   |      | 5A30     | damier 1x1 G
| 220   |      | 5A3C     | damier 1x1 HG
| 221   |      | 5A48     | damier 1x1
| 222   |      | 5A54     | damier 1x1
| 223   |      | 5A60     | damier 1x1
| 224   |      | 5A6C     | smiley :)
| 225   |      | 5A78     | smiley :(
| 226   |      | 5A84     | - bloc HD
| 227   |      | 5A90     | - bloc H
| 228   |      | 5A9C     | - bloc HG
| 229   |      | 5AA8     | damier 1x2
| 230   |      | 5AB4     | - bloc BG
| 231   |      | 5AC0     | - Bloc G
| 232   |      | 5ACC     | carré
| 233   |      | 5AD8     | carré plein
| 234   |      | 5AE4     | Mâle
| 235   |      | 5AF0     | Femelle
| 236   |      | 5AFC     | note
| 237   |      | 5B08     | note croche
| 238   |      | 5B14     | etoile?
| 239   |      | 5B20     | fusée
| 240   |      | 5B2C     | Flèche Haut
| 241   |      | 5B38     | Flèche Bas
| 242   |      | 5B44     | Flèche Gauche
| 243   |      | 5B50     | Flèche Droite
| 244   |      | 5B5C     | Triangle H
| 245   |      | 5B68     | Triangle B
| 246   |      | 5B74     | Triangle D
| 247   |      | 5B80     | Triangle G
| 248   |      | 5B8C     | homme
| 249   |      | 5B98     | femme
| 250   |      | 5BA4     | homme IoI 
| 251   |      | 5BB0     | femme IoI
| 252   |      | 5BBC     | Bombe
| 253   |      | 5BC8     | Orage
| 254   |      | 5BD4     | Flèche Haut bas
| 255   |      | 5BE0     | Flèche Gauche Droite



### work


Plage:\
formules à revoir.

Adresse=0x52F8+(n−65)⋅12\text{Adresse} = 0x52F8 + (n - 65) \cdot 12

Adresse(n)=0x52F8+(n−65)⋅12\text{Adresse}(n) = 0x52F8 + (n - 65) \cdot 12

### Inspiration

https://asmtradcpc.zilog.fr/docs/Table_des_caracteres_ASCII.php

___
