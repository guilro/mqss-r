TEO$AideAdminFamille

reg1 <- glm(AideFamille ~ FreqRencontreFamille + AgeQuin + MoyenEmploi + ContactFamilleEtranger, data=TEO, family=binomial)
reg1

summary(reg1)
## les odds rations
exp(reg1$coefficients)

# Test significativité
reg1$converged
# Idee generale: on compare le modele etudie a un modele dit "trivial" 
# i.e. reduit a la constante (qui est estimee pour correspondre a une hypothese nulle : la constante est le parametre pour les modalites de reference)
chi2.reg1 <- reg1$null.deviance - reg1$deviance # Deviance du modele trivial (reduit a la constante) - deviance du modele etudie
chi2.reg1
ddl.reg1 <- reg1$df.null - reg1$df.residual # DDL : ecart entre les deux Degrés de liberté (ddl)
ddl.reg1
pvalue.reg1 <- pchisq(chi2.reg1, ddl.reg1, lower.tail=F)
pvalue.reg1 # pvalue minuscule
# => le modèle est significatif 