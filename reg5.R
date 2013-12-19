reg5 <- glm(EmpruntFamille ~ FreqRencontreFamille + AgeQuin + EtudesSuperieures + PbArgentFamilleAv18Ans + AppartenancAssociationSolidarite + AideDevoirAsso, data=TEO, family=binomial)
reg5

summary(reg5)
## les odds rations
exp(reg5$coefficients)

# Test significativité
reg5$converged
# Idee generale: on compare le modele etudie a un modele dit "trivial" 
# i.e. reduit a la constante (qui est estimee pour correspondre a une hypothese nulle : la constante est le parametre pour les modalites de reference)
chi2.reg5 <- reg5$null.deviance - reg5$deviance # Deviance du modele trivial (reduit a la constante) - deviance du modele etudie
chi2.reg5
ddl.reg5 <- reg5$df.null - reg5$df.residual # DDL : ecart entre les deux Degrés de liberté (ddl)
ddl.reg5
pvalue.reg5 <- pchisq(chi2.reg5, ddl.reg5, lower.tail=F)
pvalue.reg5 # pvalue minuscule
# => le modèle est significatif 