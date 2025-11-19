# Code source de la ROM

## Introduction

Il y a ici le code source de la ROM en cours de documentation.

Toute participation est bienvenue pour améliorer la connaissance de cette ROM.

La fin de la ROM a été netoyée (mise à 00h des octets). La place restabte servira à ajouter des fonctions utiles.

## ROM v.1.4.

La ROM 1.4. est une mise à jour de la ROM 1.3.\
Ajout de caractères sur la plage mise à 00h par Sanyo.\
Le choix est fait de façon arbitraire mais contient des caractères semi graphique compatible ZX81 par exemple.\
L'idée étant de rendre le portage très facile puisque on est sur des systèmes équivalent.

au-dela des caractères, il reste 1044 octets disponible pour ajouter du code à la ROM.\
Cette option est en cours de développement.

La ROM finale 1.4 devra être testée sur un Sanyo PHC-25.

### PSG01_Add

Pour le PSG01 reborn, en cours de developpement.

### ScreenChoice_Add

Pour faciliter les bascules entre 1 et 2 écran.\
Reste la partie CLEAR à décoder.

### Scroll_Add

En cours de développement.\
Faire les scrolls écran dans les 4 directions pour les Screen 1 et 2.\
Et pour les 4 modes.\

- Screen mode 1 & 2 ; 4 directions
- Screen mode 3 ; 4 directions
- Screen mode 4 ; 4 directions

1 & 2 semblent factorisable. Mais à tester pour le RAZ des lignes.

3 & 4 semble factorisable.

Il y a un VSYNC à faire pour les écriture en RAM Vidéo.

___



