reg3 <- glm(EmpruntFamille ~ FreqRencontreFamille + AgeQuin + EtudesSuperieures + PbArgentFamilleAv18Ans, data=TEO, family=binomial)
reg3

summary(reg3)
## les odds rations
exp(reg3$coefficients)

# Test significativité
reg3$converged
# Idee generale: on compare le modele etudie a un modele dit "trivial" 
# i.e. reduit a la constante (qui est estimee pour correspondre a une hypothese nulle : la constante est le parametre pour les modalites de reference)
chi2.reg3 <- reg3$null.deviance - reg3$deviance # Deviance du modele trivial (reduit a la constante) - deviance du modele etudie
chi2.reg3
ddl.reg3 <- reg3$df.null - reg3$df.residual # DDL : ecart entre les deux Degrés de liberté (ddl)
ddl.reg3
pvalue.reg3 <- pchisq(chi2.reg3, ddl.reg3, lower.tail=F)
pvalue.reg3 # pvalue minuscule
# => le modèle est significatif 