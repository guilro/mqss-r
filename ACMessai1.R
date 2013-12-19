
# Les variables étant TEO$Variable1, nécessairement de type facteur
ACM <- subset (TEO, select = c(AidesRecues, AideAdminFamille, EmpruntFamille, GardeFamille, PbArgentFamilleAv18Ans, ContactFamilleEtranger, FreqRencontreFamille, AppartenanceAsociationPaysOrigine, Pretbancaire, AppartenancAssociationSolidarite, AideVersEtranger, AmisMemeOrigine, AideaPersonneExterieure, Emprunt,DIPLO_PI, EmpruntAmi))

res.ACM <- MCA (ACM, level.ventil=0.005, graph=F)

## Test immédiat : nuage des 15 modalités les plus contributives
plot.MCA(res.ACM, invisible=c("ind"), title="Nuage des modalites actives Plan 1-2", axes=c(1,2), cex=0.8, selectMod="contrib 15") # On sélectionne les modalités les pluts contributives

# Etude des valeurs propres : inertie des axes
valprop.ACM <- res.ACM$eig[1:10,]
write.infile(valprop.ACM, file="../ACM.valprop.csv", sep=";")
valprop.ACM
copie(valprop.ACM)
barplot(res.ACM$eig[1:10,2], main="Histogramme des valeurs propres", names.arg=1:10, xlab="Axes", ylab="Pourcentage d'inertie") 

# RESULTATS D'ACM1 SUR LES VARIABLES 
# On exporte les informations sur les axes et sur les variables : contributions, cos2 et coordonnees ... 
axes.ACM <- dimdesc(res.ACM, axes=c(1,2,3,4))
axes.ACM
write.infile(axes.ACM, file="../ACM.var.csv", sep="\t")

varact.ACM <- res.ACM$var
varact.ACM
write.infile(varact.ACM, file="../ACM.varact.csv", sep="\t")

# Representation des variables
plot.MCA(res.ACM, choix="var", axes=c(1,2))
plot.MCA(res.ACM, choix="var", axes=c(1,3))
plot.MCA(res.ACM, choix="var", axes=c(4,3))

# Nuage des modalites
plot.MCA(res.ACM, invisible=c("ind"), title="Nuage des modalites", axes=c(1,2))
plot.MCA(res.ACM, invisible=c("ind"), title="Nuage des modalitEs", axes=c(1,3))

# Nuage des individus
plot.MCA(res.ACM, invisible=c("var", "quali.sup"), title="Nuage des individus - Premier plan factoriel", axes=c(1,2))
plot.MCA(res.ACM, invisible=c("var", "quali.sup"), title="Nuage des individus - Deuxi?me plan factoriel", axes=c(1,3))
plot.MCA(res.ACM, invisible=c("var", "quali.sup"), title="Nuage des individus - Troisi?me plan factoriel", axes=c(2,3), label=NULL)

# Code à trafiquer lorsqu'on essaie d'avoir une meilleure représentation graphique 
# Plusieurs arguments utiles : cex, autoLab="auto" ; selectMod
plot.MCA(res.ACM, invisible=c("ind"), title="Nuage des modalites actives Plan 1-2", axes=c(1,2), cex=0.8) # On réduit la taille des étiquettes
plot.MCA(res.ACM, invisible=c("ind"), title="Nuage des modalites actives Plan 1-2", axes=c(1,2), cex=0.8, selectMod=c(1:2)) # On sélectionne certaines modalités
plot.MCA(res.ACM, invisible=c("ind"), title="Nuage des modalites actives Plan 1-2", axes=c(1,2), cex=0.8, selectMod="contrib 15") # On sélectionne les modalités les pluts contributives

#Par exemple, on sélectionne donc manuellement les modalités que l'on souhaite représenter sur le premier axe
plot.MCA(res.ACM, invisible=c("ind"), title="Nuage des modalites actives Plan 1-2", axes=c(1,2), autoLab="auto", selectMod=c(1,2,4,10,42,46,50)) #premier axe

#On ajoute le deuxième axe, par exemple
plot.MCA(res.ACM, invisible=c("ind"), title="Nuage des modalites actives Plan 1-2", axes=c(1,2), autoLab="auto",  selectMod=c(1,2,4,10,42,46,50, # pour les modalités significatives sur le premier axe#
5,8,21,25,41,45,49)) # pour les modalités significatives sur le deuxième axe

# On peut vouloir zoomer sur la partie du graphique la plus intéressante, en rognant sur les marges
plot.MCA(res.ACM, invisible=c("ind"), title="Nuage des modalites actives Plan 1-2", axes=c(1,2), autoLab="auto",
         selectMod=c(1,2,4,10,42,46,50, #premier axe
                     5,8,21,25,41,45,49)) #deuxième axe
xlim=c(-1,2.5), ylim=c(-1.2,2.1)) #attention à être cohérents avec les coordonnées des points

## à reproduire pour toutes les combinaisons de plans