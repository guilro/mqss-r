TEO$AideAdminFamille

reg1 <- glm(AideFamille ~ FreqRencontreFamille + AgeQuin + MoyenEmploi + ContactFamilleEtranger, data=TEO, family=binomial)
reg1
summary(reg1)

reg1$converged