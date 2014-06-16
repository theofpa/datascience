library(datasets); data(swiss); require(stats); require(graphics)

pairs(swiss, panel=panel.smooth, main="Swiss data", col=3+(swiss$Catholic>50))

summary(lm(Fertility ~ ., data=swiss))

summary(lm(Fertility ~ Agriculture, data=swiss))$coefficients

z<- swiss$Agriculture + swiss$Education

lm(Fertility ~ . + z, data=swiss)
