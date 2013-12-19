reg4 <- glm(GardeFamille ~ FreqRencontreFamille + AgeQuin + EtudesSuperieures + PbArgentFamilleAv18Ans, data=TEO, family=binomial)
reg4

summary(reg4)
## les odds rations
exp(reg4$coefficients)

# Test significativité
reg4$converged
# Idee generale: on compare le modele etudie a un modele dit "trivial" 
# i.e. reduit a la constante (qui est estimee pour correspondre a une hypothese nulle : la constante est le parametre pour les modalites de reference)
chi2.reg4 <- reg4$null.deviance - reg4$deviance # Deviance du modele trivial (reduit a la constante) - deviance du modele etudie
chi2.reg4
ddl.reg4 <- reg4$df.null - reg4$df.residual # DDL : ecart entre les deux Degrés de liberté (ddl)
ddl.reg4
pvalue.reg4 <- pchisq(chi2.reg4, ddl.reg4, lower.tail=F)
pvalue.reg4 # pvalue minuscule
# => le modèle est significatif 