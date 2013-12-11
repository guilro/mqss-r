# I) Les fréquences brutes

## Besoin d'aide pour les démarches administratives au cours des 12 derniers mois
freq(TEO$AideAdmin, total=T)
## Aide demandée à la famille pour des démarches administratives
freq(TEO$AideAdminFamille, total=T)

## Emprunt d'argent au cours des 12 derniers mois
freq(TEO$Emprunt, total=T)
## Emprunt d'argent à la famille
freq(TEO$EmpruntFamille, total=T)

## Recours à une aide occasionnel et gratuite pour garder les enfants au cours des 12 derniers mois
freq(TEO$Garde, total=T) #Les "NA" sont ceux qui sont "sans-objet".
## Garde des enfants par la famille
freq(TEO$GardeFamille, total=T)

## Personne s'étant portée garant ou caution pour un prêt ou location
freq(TEO$Caution)

## Moyen utilisé pour trouver l'emploi salarié actuel
freq(TEO$MoyenEmploi, total=T)

## Présence d'autres personnes durant l'entretien
### Conjoint-e présent-e-s durant l'entretien
freq(TEO$EntretienConjointPresent)
### Enfant-s présent-s durant l'entretien
freq(TEO$EntretienEnfantsPresents)
### Le père et/ou la mère présent-e-s durant l'entretien
freq(TEO$EntretienParentsPresents)
### Autre(s) personne(s) de la famille présente(s) durant l'entretien
freq(TEO$EntretienAutreFamillePresents)
### Autre(s) personne(s) ou ami-e-s présent-e-s durant l'entretien
freq(TEO$EntretienAutresPresents)

## Gros problèmes d'argent dans la famille vécus par l'enquêté
## durant sa jeunesse, avant ses 18 ans
freq(TEO$PbArgentFamilleAv18Ans)

## Contacts avec de la famille ou des amis qui vivent dans un autre pays que ## la France, un DOM ou un TOM
freq(TEO$ContactFamilleEtranger)

## Fréquence des recontres dans les 15 derniers jours avec des personnes de la
## famille proche ou éloignée
freq(TEO$FreqRencontreFamille)

# II) Les fréquences de l'aide familiale conditionnée au recours à l'aide tout cours
tapply(TEO$AideAdminFamille, TEO$AideAdmin, freq, total=T) # 61,7% de recours à la famille
tapply(TEO$EmpruntFamille, TEO$Emprunt, freq, total=T) # 68,9% de recours à la famille
tapply(TEO$GardeFamille, TEO$Garde, freq, total=T) # 80,2% de recours à la famille

# III) Y a-t-il une correlation entre les 3 types de solidarité ?
# (financière, démarches administratives, garde d'enfants)
# -> ça peut être la base d'une ACM...
tapply(TEO$AideAdmin, TEO$Emprunt, freq, total=T)
tapply(TEO$AideAdminFamille, TEO$EmpruntFamille, freq, total=T)

tapply(TEO$Garde, TEO$Emprunt, freq, total=T)
tapply(TEO$GardeFamille, TEO$EmpruntFamille, freq, total=T)

tapply(TEO$Garde, TEO$AideAdmin, freq, total=T)
tapply(TEO$GardeFamille, TEO$AideAdminFamille, freq, total=T)

tapply(TEO$Emprunt, TEO$AideAdmin, freq, total=T)
tapply(TEO$EmpruntFamille, TEO$AideAdminFamille, freq, total=T)

tapply(TEO$Emprunt, TEO$Garde, freq, total=T)
tapply(TEO$EmpruntFamille, TEO$GardeFamille, freq, total=T)

tapply(TEO$AideAdmin, TEO$Garde, freq, total=T)
tapply(TEO$AideAdminFamille, TEO$GardeFamille, freq, total=T)