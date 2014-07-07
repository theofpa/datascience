#Q1
library(ElemStatLearn)
library(caret)
data(vowel.train)
data(vowel.test) 

set.seed(33833)

vowel.train$y <-  factor(vowel.train$y)
vowel.test$y <-  factor(vowel.test$y)

rfFit <- train( vowel.train$y ~ ., method="rf", data=vowel.train)
gbmFit <- train( vowel.train$y ~ ., method="gbm", data=vowel.train)

gdmPred <- predict(gbmFit,vowel.test)
rfPred <- predict(rfFit,vowel.test)

confusionMatrix(vowel.test$y,rfPred)
#  Accuracy : 0.5974
confusionMatrix(vowel.test$y,gdmPred)
# Accuracy : 0.5325


predDF <- data.frame(gdmPred,rfPred,y=vowel.test$y)
combModFit <- train(y ~.,method="gam", data=predDF)
combPred <- predict(combModFit,predDF)
confusionMatrix(vowel.test$y,combPred)


#Q2
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

set.seed(62433)
rfFit <- train( training$diagnosis ~ ., method="rf", data=training)
btFit <- train( training$diagnosis ~ ., method="gbm", data=training)
ldaFit <- train( training$diagnosis ~ ., method="lda", data=training)

rfPred <- predict(rfFit,testing)
btPred <- predict(btFit,testing)
ldaPred <- predict(ldaFit,testing)
library(ggplot2)
qplot(rfPred,btPred,coulour=diagnosis, data=testing)

predDF <- data.frame(rfPred,btPred,ldaPred,diagnosis=testing$diagnosis)
combModFit <- train(diagnosis ~., method="rf",data=predDF)
comPred <- predict(combModFit,predDF)

sqrt(sum( (as.numeric(rfPred)-as.numeric(testing$diagnosis))^2))
sqrt(sum( (as.numeric(btPred)-as.numeric(testing$diagnosis))^2))
sqrt(sum( (as.numeric(ldaPred)-as.numeric(testing$diagnosis))^2))
sqrt(sum( (as.numeric(comPred)-as.numeric(testing$diagnosis))^2))

confusionMatrix(testing$diagnosis,rfPred)
confusionMatrix(testing$diagnosis,btPred)
confusionMatrix(testing$diagnosis,ldaPred)
confusionMatrix(testing$diagnosis,comPred)

#Q3
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]
set.seed(233)

lassoFit <- train( training$CompressiveStrength ~ ., method="lasso", data=training)
lassoPred <- predict(lassoFit,testing)
plot.enet(lassoFit$finalModel, xvar="penalty", use.color=T)

#Q4
library(lubridate)
library(forecast)
dat = read.csv("./gaData.csv")
training = dat[year(dat$date)==2011,]
tstrain = ts(training$visitsTumblr)
testing = dat[year(dat$date)>2011,]
test = dat[year(dat$date) > 2011,]

pred <- forecast(fit, h=length(test$visitsTumblr),level=c(80,95))
fcast <- forecast(fit)
plot(fcast)
accuracy(fcast,test$visitsTumblr)

modBats <- bats(tstrain)
pred <- forecast(modBats, h=length(testing$visitsTumblr),level=c(80,95))
accuracy <- 1-sum(testing$visitsTumblr>pred$upper[,2])/length(testing$visitsTumblr)
accuracy <- 1-sum(test$visitsTumblr>pred$upper[,2])/length(test$visitsTumblr)


#Q5

library(e1071)

set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(325)
svmFit <- svm(CompressiveStrength ~ ., data = training)
svmPred <- predict(svmFit,testing)
accuracy(svmPred, testing$CompressiveStrength)
