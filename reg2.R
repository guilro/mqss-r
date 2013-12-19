TEO$AideAdminFamille

reg2 <- glm(EmpruntFamille ~ FreqRencontreFamille + AgeQuin + MoyenEmploi + ContactFamilleEtranger, data=TEO, family=binomial)
reg2

summary(reg2)
## les odds rations
exp(reg2$coefficients)

# Test significativité
reg2$converged
# Idee generale: on compare le modele etudie a un modele dit "trivial" 
# i.e. reduit a la constante (qui est estimee pour correspondre a une hypothese nulle : la constante est le parametre pour les modalites de reference)
chi2.reg2 <- reg2$null.deviance - reg2$deviance # Deviance du modele trivial (reduit a la constante) - deviance du modele etudie
chi2.reg2
ddl.reg2 <- reg2$df.null - reg2$df.residual # DDL : ecart entre les deux Degrés de liberté (ddl)
ddl.reg2
pvalue.reg2 <- pchisq(chi2.reg2, ddl.reg2, lower.tail=F)
pvalue.reg2 # pvalue minuscule
# => le modèle est significatif 