library(AppliedPredictiveModeling)
library(caret)
data(AlzheimerDisease)

adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]



library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]
library(Hmisc); library(gridExtra)
names <- colnames(concrete)
names <- names[-length(names)]
featurePlot(x = training[, names], y = training$CompressiveStrength, plot = "pairs")
index <- seq_along(1:nrow(training))
ggplot(data = training, aes(x = index, y = CompressiveStrength)) + geom_point() 
cutCompressiveStrength <- cut2(training$CompressiveStrength,g=4)
ggplot(data = training, aes(y = index, x = cutCompressiveStrength)) + geom_boxplot() + geom_jitter(col="red")
featurePlot(x = training[, names], y = cutCompressiveStrength, plot = "box")



library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]
ggplot(data = training, aes(x = Superplasticizer)) + geom_histogram()


set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

summary(training)
names <- colnames(training)
names <- names[grep("^IL",names)]
preProcess(training[,names],method="pca", thresh=0.9)


set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

library(Hmisc)
names <- colnames(training)
names <- names[grep("^IL",names)]
train<-training[,names]
test<-testing[,names]
preProc<-preProcess(train,method="pca", thresh=0.8)

g1<-train(training$diagnosis ~ ., method="glm", data=train)
mean(testing$diagnosis == predict(g1, test))

g2<-train(training$diagnosis ~ ., method="glm", data=train)
mean(testing$diagnosis == predict(g2, test))


To train the first glm I just run 
g1 <- train(training$diagnosis~., data=subTrain, method="glm")

to train the second glm I run
g2 <- train(training$diagnosis~., data=psubTrain, method="glm")

finally to evaluate the accuracy
# for first model
mean(testing$diagnosis == predict(g1, subTest))
# for second model
mean(testing$diagnosis == predict(g2, psubTest))