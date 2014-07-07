#Q5

library(ElemStatLearn)
library(Hmisc)
data(vowel.train)
data(vowel.test) 
vowel.train <- transform(vowel.train, y=factor(y))
vowel.test <- transform(vowel.test, y=factor(y))
set.seed(33833)
modFit <- train(y ~., data=vowel.train, method="rf", prox=TRUE)
print(modFit)
vi<-varImp(modFit$finalModel)
vi = data.frame(var = 1:nrow(vi), imp = vi$Overall)
vi[order(vi$imp),]

