Quoi est quoi ?
===============
- Le fichier `initialisation.default.R` contient le chargement des librairies et de la base. Vous devez le modifier localement.
- Le fichier `recodage.R` contient le recodage des variables. ***WORK NEEDED !***
- Le fichier `bivarie.R` contient quelques tableaux croisés.
- Le fichier `ACM.R` contient un squelette de code d'ACM.


Règles d'écriture du code
=========================
- tous les recodages sont dans un fichier recodage.R séparé des autres fichiers
- au dessus de chaque recodage, j'ai mis le nom et la description de la variable du codebook en commentaire (même si la signification de la variable est évidente), de telle sorte à ce que l'on ai jamais besoin de retourner au codebook pour vérifier la signification d'une variable, et que tout soit accessible rien qu'en lisant le script.
- le plus possible essayer de segmenter les tâches dans des fichiers différents (un fichier pour l'analyse bivarié, un pour chaque ACM etc) ce qui offre une plus grande fléxibilité pour le travaille collectif (si on travaille en même temps sur deux ACM différentes, pas de casse-tête pour fusionner les fichiers après). Cela permet aussi quand on reprend le travail à la fois de pas avoir à trop réfléchir et relire tout le fichier (on relance tout le code du fichier et basta) sans avoir non plus à faire tourner plus de code que nécessaire.
- j'ai donné à toutes les variables des noms explicites (au détriment de leur concision je le reconnais) en *SyntaxeCamelCase* (mots collés et majuscules au début des mots, le nom provient du langage de programmation, "Camel", qui l'a initié). Je trouve ça plus lisible et moins moche que *je_mets_des_petits_tirets_bas_partout*

L'ACM
=====
Le fichier ACM.R contient un squelette de code ACM. Je propose de créer un fichier pour chaque combinaison de variables que nous testons dans une ACM, afin de garder des traces de nos essais. Pour les recodages de variable probablement nécessaires, ils doivent être ajoutés à recodage.R.
