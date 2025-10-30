# Scroll écran texte

Pour aider au develeppement de jeu en mode texte ce serait assez utile.

## Rappel des zones mémoire écran 1 et 2

### Mode screen 1 (text)

De &h6000 à &h61FF pour l'affichage.\
De &h6800 à &h69FF pour les attributs.

2 x 512 octets.\
Englobé dans la zone des 6ko.

Déplacer les affichage et les attributs.


### Mode screen 2 (text)

De &h6000 à &h61FF pour l'affichage.\
De &h6800 à &h69FF pour les attributs.

2 x 512 octets.\
Englobé dans la zone des 6ko.

Déplacer les affichage et les attributs.


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