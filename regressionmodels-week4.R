download.file("https://dl.dropboxusercontent.com/u/7710864/data/ravensData.rda"
              , destfile="./data/ravensData.rda",method="curl")
load("./data/ravensData.rda")
head(ravensData)

lmRavens<-lm(ravensData$ravenWinNum ~ ravensData$ravenScore)
summary(lmRavens)$coef

