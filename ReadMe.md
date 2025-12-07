# Sanyo PHC-25

<p style="text-align: center;">
  <img src="assets/RPUFOS_Logo.png" alt="Logo RPUFOS" width="150">
</p>

## Introduction

OBSCURE System étudié par les RPUFOS (Retro Programers For Obscure Systems).\
Pour la Game JAM de mai 2025 à octobre 2025.

### Resources PHC-25

[z88dk](https://github.com/z88dk/z88dk/wiki/Platform---Sanyo-PHC-25#seiko-map-1010)

[Olipix - You Tube](https://www.youtube.com/@Olipix)\
[Aurelien34 - PHC25 Turbo](https://github.com/Aurelien34/PHC25Turbo)\
[Aurelien34 - Welcome](https://github.com/Aurelien34/PHC2Welcome)\

[Mokona](https://gitlab.com/mokona/phc25_tools)


### Travaux

Les travaux reste cependant toujours d'actualités pour être améliorés.

Le repository RPUFOS sert au adaptation de David H. Ahl. Mais pourrait migrer ici.\
Compte tenu de la médicrité du jeu de caractères les adaptations en brute force peuvent être ok, mais c'est mieux de faire quelque chose de plus sexy.\
D'où l'étude de la ROM PAL et de sa modification.

Travaux divers.
- Documentations
  - Retro doc et compléments pour programmer sur le PHC-25
- Hack de la ROM Basic PAL 1.3
- ...

La doc Basic devrait spliter.
- Basic How To
- Adaptation du bouquin 10 PRINT
- Pourquoi pas un 102 Programmes pour PHC-25
- ...

Le code source utilisé est celui du REPO de z88dk.\
Il est mis à jour ici quand j'ai le temps.

___
## Documentations

Report des documents, liens et autre sur le PHC-25.\
Anciennement sur RPUFOS. Le Report est en cours.

## Hack de la ROM Basic 1.3

Travail pour améliorer la ROM Basic du PHC 25.\
Elle est renomée en RPUFOS Basic v1.4.

Ajout de caractères semi-graphique sur la plage ASCII étendue effacée par SANYO pour importer l'ordinateur en Europe.\
Reprise en particulier des caractères semi-graphiques du ZX81, ordinateur le plus proche (résolution et processeur Z80).
Celà permet donc d'adapter une grande majorité de jeu du ZX81, et par là même d'étendre son parc logiciel.

### Les scroll écrans

Il y a un peu de place dans la ROM Basic pour y loger du code.\
Les scroll écran en Basic peuvent être très lent.\
Donc mise en place de scroll accessible directement par la commande Basic EXEC et via l'assembleur Z80 par CALL.

- Scroll texte haut
- Scroll texte bas
- Scroll texte gauche
- Scroll texte droite 

etc.

___
