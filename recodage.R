## Recodage de variables

## Aides financières régulières des parents, de la famille ou des amis y compris une pension alimentaire, le paiement du loyer, direct ou indirect
TEO$AidesRecues <- factor(TEO$A_Aides)
summary(TEO$AidesRecues)

## Opinion sur le niveau de vie du ménage
TEO$OpinionNDVMenage <- factor(TEO$A_Avis)

## Besoin d'aide pour les démarches administratives au cours des 12 derniers mois
TEO$AideAdmin <- factor(TEO$A_Aadm, label = c("AideAdminOui", "AideAdminNon"))
summary(TEO$AideAdmin)

## Aucune aide demandée pour des démarches administratives A_AADMQ_A

## Aide demandée au conjoint pour des démarches administratives A_AADMQ_B
## Aide demandée aux enfants pour des démarches administratives A_AADMQ_C
## Aide demandée aux parents pour des démarches administratives A_AADMQ_D
## Aide demandée à un autre membre de la famille pour des démarches administratives A_AADMQ_E
table(TEO$A_Aadmq_b)
TEO$AideAdminFamille [TEO$A_Aadmq_b == 1 | TEO$A_Aadmq_c == 1 | TEO$A_Aadmq_d == 1 | TEO$A_Aadmq_e == 1] <- "AideAdminFamilleOui"
TEO$AideAdminFamille [TEO$A_Aadmq_b == 0 & TEO$A_Aadmq_c == 0 & TEO$A_Aadmq_d == 0 & TEO$A_Aadmq_e == 0] <- "AideAdminFamilleNon"
TEO$AideAdminFamille <- factor(TEO$AideAdminFamille)
freq(TEO$AideAdminFamille)
## Aide demandée à des amis pour des démarches administratives A_AADMQ_F
## Personne à qui l'enquêté a demandé de l'aide pour ses démarches, indicateur de non réponse A_AADMQ_FLAG
## Aide demandée aux voisins pour des démarches administratives A_AADMQ_G
## Aide demandée à un travailleur social, une association ou un professionnel pour des démarches administratives A_AADMQ_H
## Aide demandée à un collègue pour des démarches administratives A_AADMQ_I
## Aide demandée à une autre personne pour des démarches administratives A_AADMQ_J
## Personne à qui l'enquêté a demandé de l'aide pour ses démarches, nombre de réponses données A_AADMQ_NBREP

## Emprunt d'argent au cours des 12 derniers mois A_ARG
TEO$Emprunt <- factor(TEO$A_Arg, label = c("EmpruntOui", "EmpruntNon"))
summary(TEO$Emprunt)

## Emprunt d'argent à un des enfants A_ARGQ_A
## Emprunt d'argent au père ou à la mère A_ARGQ_B
## Emprunt d'argent aux beaux-parents A_ARGQ_C
## Emprunt d'argent à une autre personne de la famille A_ARGQ_D
TEO$EmpruntFamille [TEO$A_Argq_a == 1 | TEO$A_Argq_b == 1 | TEO$A_Argq_c == 1 | TEO$A_Argq_d == 1] <- "EmpruntFamilleOui"
TEO$EmpruntFamille [TEO$A_Argq_a == 0 & TEO$A_Argq_b == 0 & TEO$A_Argq_c == 0 & TEO$A_Argq_d == 0] <- "EmpruntFamilleNon"
TEO$EmpruntFamille <- factor(TEO$EmpruntFamille)
freq(TEO$EmpruntFamille)
## Emprunt d'argent à un(e) amie(s) A_ARGQ_E
## Emprunt d'argent à un(e) voisin(e) A_ARGQ_F
## Personne à qui l'enquêté a emprunté de l'argent, indicateur de non réponse A_ARGQ_FLAG
## Emprunt d'argent à un(e) collègue A_ARGQ_G
## Emprunt d'argent à une autre personne A_ARGQ_H
## Personne à qui l'enquêté a emprunté de l'argent, nombre de réponses données A_ARGQ_NBREP

## Recours à une aide occasionnel et gratuite pour garder les enfants au cours des 12 derniers mois
TEO$Garde <- factor(TEO$A_Genf, label = ("GardeOui", "GardeNon"))
summary(TEO$Garde)
## Garde des enfants par un des enfants A_GENFQ_A
## Garde des enfants par le père ou à la mère A_GENFQ_B
## Garde des enfants par les beaux-parents ou ex-beaux-parents A_GENFQ_C
## Garde des enfants par une autre personne de la famille A_GENFQ_D
TEO$GardeFamille [TEO$A_Genfq_a == 1 | TEO$A_Genfq_b == 1 | TEO$A_Genfq_c == 1 | TEO$A_Genfq_d == 1] <- "GardeFamilleOui"
TEO$GardeFamille [TEO$A_Genfq_a == 0 & TEO$A_Genfq_b == 0 & TEO$A_Genfq_c == 0 & TEO$A_Genfq_d == 0] <- "GardeFamilleNon"
TEO$GardeFamille <- factor(TEO$GardeFamille)
freq(TEO$GardeFamille)

## Garde des enfants par un(e) amie(s) A_GENFQ_E
## Garde des enfants par un(e) voisin(e) A_GENFQ_F
## Personne à qui l'enquêté a confié ses enfants, indicateur de non réponse A_GENFQ_FLAG
## Garde des enfants par un(e) collègue A_GENFQ_G
## Garde des enfants par une autre personne A_GENFQ_H
## Contacts avec de la famille ou des amis qui vivent dans un autre pays que la France, un DOM ou un TOM A_NEWS

## Aide versée dans un DOM, un TOM ou un autre pays que la France A_PIVER
## 1er, 2ème, et 3ème pays ou DOM dans lequel une aide est versée A_PIVERQ1 A_PIVERQ2 A_PIVERQ3

## Personne s'étant portée caution ou garant pour un prêt ou une location L_CAUTQ
TEO$Caution [TEO$L_Cautq %in% c(1, 2)] <- "CautionParentsouEnfants"
TEO$Caution [TEO$L_Cautq == 3] <- "CautionFamilleAutreOuAmis"
TEO$Caution [TEO$L_Cautq %in% c(4,5)] <- "CatuionNonFamilleOuAmis"
TEO$Caution <- factor(TEO$Caution)
freq(TEO$Caution)

## Moyen utilisé pour trouver l'emploi salarié actuel P_SACMTW
TEO$MoyenEmploi [TEO$P_Sacmtw == 2] <- "MoyenEmploiFamille"
TEO$MoyenEmploi [TEO$P_Sacmtw == 3] <- "MoyenEmploiRelationsPersos"
TEO$MoyenEmploi [TEO$P_Sacmtw == 1] <- "MoyenEmploiDemarchePersos"
TEO$MoyenEmploi [TEO$P_Sacmtw %in% c(4:12)] <- "MoyenEmploiAutre"
TEO$MoyenEmploi <- factor(TEO$MoyenEmploi)
freq(TEO$MoyenEmploi, total=T)

## Conjoint-e présent-e-s durant l'entretien
TEO$EntretienConjointPresent [TEO$Q_Qui_a == 0] <- "EntretienConjointAbsent"
TEO$EntretienConjointPresent [TEO$Q_Qui_a == 1] <- "EntretienConjointPresent"
TEO$EntretienConjointPresent <- factor(TEO$EntretienConjointPresent)
freq(TEO$EntretienConjointPresent)

## Enfant-s présent-s durant l'entretien
TEO$EntretienEnfantsPresents [TEO$Q_Qui_b == 0] <- "EntretienEnfantsAbsents"
TEO$EntretienEnfantsPresents [TEO$Q_Qui_b == 1] <- "EntretienEnfantsPresents"
TEO$EntretienEnfantsPresents <- factor(TEO$EntretienEnfantsPresents)
freq(TEO$EntretienEnfantsPresents)

## Le père et/ou la mère présent-e-s durant l'entretien
TEO$EntretienParentsPresents [TEO$Q_Qui_c == 0] <- "EntretienParentsAbsents"
TEO$EntretienParentsPresents [TEO$Q_Qui_c == 1] <- "EntretienParentsPresents"
TEO$EntretienParentsPresents <- factor(TEO$EntretienParentsPresents)
freq(TEO$EntretienParentsPresents)

## Autre(s) personne(s) de la famille présente(s) durant l'entretien
TEO$EntretienAutreFamillePresents [TEO$Q_Qui_d == 0] <- "EntretienAutreFamilleAbsents"
TEO$EntretienAutreFamillePresents [TEO$Q_Qui_d == 1] <- "EntretienAutreFamillePresents"
TEO$EntretienAutreFamillePresents <- factor(TEO$EntretienAutreFamillePresents)
freq(TEO$EntretienAutreFamillePresents)

## Autre(s) personne(s) ou ami-e-s présent-e-s durant l'entretien
TEO$EntretienAutresPresents [TEO$Q_Qui_e == 0] <- "EntretienAutresAbsents"
TEO$EntretienAutresPresents [TEO$Q_Qui_e == 1] <- "EntretienAutresPresents"
TEO$EntretienAutreFamillePresents <- factor(TEO$EntretienAutreFamillePresents)
freq(TEO$EntretienAutresPresents)

## Gros problèmes d'argent dans la famille vécus par l'enquêté durant sa jeunesse, avant ses 18 ans
TEO$PbArgentFamilleAv18Ans <- factor(TEO$T_Argent, label = c("Oui", "Non", "Nspp"))
freq(TEO$PbArgentFamilleAv18Ans)

## Contacts avec de la famille ou des amis qui vivent dans un autre pays que ## la France, un DOM ou un TOM
TEO$ContactFamilleEtranger <- factor(TEO$A_News, label = c("Souvent", "Parfois", "Jamais"))
freq(TEO$ContactFamilleEtranger)

## Fréquence des recontres dans les 15 derniers jours avec des personnes de la
## famille proche ou éloignée
TEO$FreqRencontreFamille <- factor(TEO$A_Rfami, label = c("+moitié", "-moitié", "moit-moit"))
freq(TEO$FreqRencontreFamille)

## Rémunération mensuelle nette de l'activité du (de la) conjoint(e)
TEO$SalaireConjoint <- cut(TEO$C_Salc, breaks = c(0, 1200, 2500, Inf), labels = c(1:3))

## Nombre d'enfants 2-17 dans le logement :
TEO$Enfants <- cut(TEO$Nbenfmin, breaks = c(0, 1, 2, 3, Inf), labels = c (1:4))

## Nombre d'unions au cours de la vie
TEO$NombreUnion <- cut(TEO$Nbunions, breaks = c(0, 1, 2, 3, Inf), labels = c(1:4))

## Appartenance à une association regroupant des membres originaires du même pays, DOM ou TOM que l'enquêté ou ses parents
TEO$AppartenanceAsociationPaysOrigine <- factor(TEO$I_Assor, labels = c ("Membre", "PasMembre", "NSP"))

## Appartenance de l'enquêté à une association de solidarité ou d'entraide (y compris tontine)
TEO$AppartenancAssociationSolidarite <- factor(TEO$I_Asssol, labels = c ("Membre", "PasMembre", "Refus", "NSP"))                                                                     

# Demande d'un prêt dans une banque depuis 5 ans
TEO$Pretbancaire <- factor(TEO$D_Banqfq, labels = c ("Emprunteur", "NonEmprunteur", "Refus", "NSP"))
                                                                         
## Aide versée dans un DOM, un TOM ou un autre pays que la France
TEO$AideVersEtranger <- factor(TEO$A_Piver, labels = c("Oui", "Non"))
                                                                         
## Proportion parmi les amis de personnes de la même origine que l'enquêté
TEO$AmisMemeOrigine <- factor (TEO$A_Rorig, labels = c("+moitie", "-moitie", "moitie-moitie", "Refus", "NSP"))
                                                                         
## Apport d'une aide financière régulière à des personnes extérieures au ménage
TEO$AideaPersonneExterieure <- factor (TEO$A_Verse, labels = c("Oui", "Non"))
                                                                         

####################################
# autres variable rrcodée par le passé qui peuvent toujours servi
TEO$SEXE_PI <- factor(TEO$SEXE_PI, label=c("Homme", "Femme"))
## Par defaut, R presente les modalites par ordre alphabetique, mais on peut modifier cet ordre avec l'option "level" 
## On veut que les Femmes apparaissent avant les hommes
TEO$SEXE_PI <- factor(TEO$SEXE_PI, levels=c("Femme", "Homme"))

## diplome
TEO$DIPLO_PI <- factor(TEO$F_Dip, label=c("Aucun_dip", "CEP", "BEPC", "CAP_BEP", "Bac_techno_pro", "Bac_gen", "Bac+2", "Sup_Bac+2"))
table(TEO$DIPLO_PI)
TEO$DIPLO_PI_REG [TEO$DIPLO_PI == "Aucun_dip"] <- "No_sup"
TEO$DIPLO_PI_REG [TEO$DIPLO_PI == "CEP"] <- "No_sup"
TEO$DIPLO_PI_REG [TEO$DIPLO_PI == "BEPC"] <- "No_sup"
TEO$DIPLO_PI_REG [TEO$DIPLO_PI == "CAP_BEP"] <- "No_sup"
TEO$DIPLO_PI_REG [TEO$DIPLO_PI == "Bac_techno_pro"] <- "No_sup"
TEO$DIPLO_PI_REG [TEO$DIPLO_PI == "Bac_gen"] <- "No_sup"
TEO$DIPLO_PI_REG [TEO$DIPLO_PI == "Bac+2"] <- "Sup"
TEO$DIPLO_PI_REG [TEO$DIPLO_PI == "Sup_Bac+2"] <- "Sup"
table(TEO$DIPLO_PI_REG, useNA="ifany")

# age
TEO$AGE_PI_QUIN <- cut(TEO$Agenq, c(17, 25, 30, 35, 40, 45, 50, 55, 60), include.lowest=TRUE)
TEO$AGE_PI_1 <- cut(TEO$Agenq, c(17, 18, 21, 25, 60), include.lowest=TRUE)
TEO$AGE_PI_UNIT <- cut(TEO$Agenq, (17:60), include.lowest=TRUE)
table(TEO$AGE_PI_QUIN)

# On recode en n'integrant pas les non-reponses : on elimine les etrangers hors UE : modalite "NA" est une "fausse" modalit? d'inscription puisqu'elle est 
# construite exclusivement sur le crit?re de nationalite
TEO$LISTE [TEO$I_Eleue == 1] <- "Inscrit"
TEO$LISTE [TEO$I_Eleue == 2] <- "Non_inscrit"
TEO$LISTE [TEO$I_Eleue %in% c(8, 9)] <- "Liste_nsp"     # Attention : on regroupe refus et nsp
TEO$LISTE <- factor(TEO$LISTE, levels=c("Inscrit", "Non_inscrit", "Liste_nsp"))
table (TEO$LISTE, useNA="ifany")