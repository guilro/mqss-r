
# Les variables étant TEO$Variable1, nécessairement de type facteur
ACM <- subset (TEO, select = c(Variable1, Variable2, Variable3, Variable4, Variable5, ..., Variablen))

res.ACM <- MCA (ACM, level.ventil=0.005, graph=F)

# Etude des valeurs propres : inertie des axes
valprop.ACM1 <- res.ACM1$eig[1:10,]
write.infile(valprop.ACM1, file="/le/dossier/que/vous/voulez/ACM.valprop.csv", sep=";")
valprop.ACM1
copie(valprop.ACM1)
barplot(res.ACM1$eig[1:10,2], main="Histogramme des valeurs propres", names.arg=1:10, xlab="Axes", ylab="Pourcentage d'inertie") 

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

#Par exemple, on sélectionne donc manuellement les modalités que l'on souhaite représenter sur le premier axe
plot.MCA(res.acm1, invisible=c("ind"), title="Nuage des modalites actives Plan 1-2", axes=c(1,2), autoLab="auto", selectMod=c(1,2,4,10,42,46,50)) #premier axe

#On ajoute le deuxième axe, par exemple
plot.MCA(res.acm1, invisible=c("ind"), title="Nuage des modalites actives Plan 1-2", axes=c(1,2), autoLab="auto",  selectMod=c(1,2,4,10,42,46,50, # pour les modalités significatives sur le premier axe#
5,8,21,25,41,45,49)) # pour les modalités significatives sur le deuxième axe

# On peut vouloir zoomer sur la partie du graphique la plus intéressante, en rognant sur les marges
plot.MCA(res.acm1, invisible=c("ind"), title="Nuage des modalites actives Plan 1-2", axes=c(1,2), autoLab="auto",
         selectMod=c(1,2,4,10,42,46,50, #premier axe
                     5,8,21,25,41,45,49)) #deuxième axe
xlim=c(-1,2.5), ylim=c(-1.2,2.1)) #attention à être cohérents avec les coordonnées des points

## à reproduire pour toutes les combinaisons de plans