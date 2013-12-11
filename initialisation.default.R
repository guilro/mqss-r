## packages
library(foreign)
library(cluster)
library(questionr)
library(survey)
library(R2HTML)
library(FactoMineR) #librairie pour les analyses factorielles
library(stats)
library(lmtest) #librairie pour les régressions 

setwd("/le/dossier/ou/se/trouve/la/base/")
getwd()
TEO <- read.csv2("indiv2.csv")
