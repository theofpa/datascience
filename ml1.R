# Data splitting - using the createDataPartition() command from the caret package

library(caret); library(kernlab); data(spam)
inTrain <- createDataPartition(y=spam$type, p=0.75, list=FALSE)
# y - which outcome I want to split base on
# p - percentage of the training set 0.75 is 75%, 25% on the training set
training<-spam[inTrain,]
testing<-spam[-inTrain,]

# Data slicing - using the createFolds() command from caret
set.seed(32343)
folds<-createFolds(y=spam$type, k=10, list=TRUE, returnTrain=TRUE)
# k - how many folds
# list - return a list of indices when true
# returnTrain - TRUE=return the training set indices, FALSE=return the test set indices
sapply(folds,length) # check the size of each fold
# we observe that the sample has been sliced equally on 10 groups

# Resampling with replacement of the values
set.seed(32343)
folds<-createResample(y=spam$type, times=10, list=TRUE)
sapply(folds,length) # check the size of each fold

# Time slices (useful for forecasting)
set.seed(32343)
tme<-1:1000
folds<-createTimeSlices(y=tme, initialWindow=20, horizon=10)
names(folds)
folds$train[[1]]
folds$test[[1]]

# Fit a model (training) - using the train() command from the caret package

set.seed(32343)
modelFit<-train(type ~., data=training, method="glm")
# method Bootstraping or Cross-Validation
# metric Accuracy (default), Kappa, or RMSE, RSquared
# trControl=trainControl()
modelFit
modelFit$finalModel

# Predict on new samples - using the predict command

predictions <- predict(modelFit, newdata=testing)
predictions

# Confusion matrix (compare your predictions with the actual result)

confusionMatrix(predictions, testing$type)

# Plotting predictors using caret
library(ISLR); library(ggplot2); library(caret);
data(Wage)
summary(Wage)
inTrain <- createDataPartition(y=Wage$wage,p=0.7, list=FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]
dim(training); dim(testing)
featurePlot(x=training[,c("age","education","jobclass")],y=training$wage, plot="pairs")

# Plotting predictors using ggplot2
qplot(age, wage, data=training)
qplot(age, wage, colour=jobclass, data=training)
qplot(age, wage, colour=education, data=training) + geom_smooth(method='lm',formula=y~x)

# Break to different categories
library(Hmisc); library(gridExtra)
cutWage <- cut2(training$wage,g=3)
table(cutWage)
p1<-qplot(cutWage, age, data=training, fill=cutWage, geom=c("boxplot"))
p2<-qplot(cutWage, age, data=training, fill=cutWage, geom=c("boxplot", "jitter"))
grid.arrange(p1, p2, ncol=2)

# looking at tables of data
t1<-table(cutWage, training$jobclass)
t1
prop.table(t1,1)

# Density
qplot(wage, colour=education, data=training, geom="density")

# Standardizing (when data are skewed)
# subscract their mean from the values and divide by their standard deviation
library(caret); library(kernlab); data(spam)
inTrain <- createDataPartition(y=spam$type,
                               p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
hist(training$capitalAve,main="",xlab="ave. capital run length")

trainCapAve <- training$capitalAve
trainCapAveS <- (trainCapAve  - mean(trainCapAve))/sd(trainCapAve) 
mean(trainCapAveS)
sd(trainCapAveS)
testCapAve <- testing$capitalAve
testCapAveS <- (testCapAve  - mean(trainCapAve))/sd(trainCapAve) 
mean(testCapAveS)
sd(testCapAveS)

preObj <- preProcess(training[,-58],method=c("center","scale"))
trainCapAveS <- predict(preObj,training[,-58])$capitalAve
mean(trainCapAveS)
sd(trainCapAveS)
testCapAveS <- predict(preObj,testing[,-58])$capitalAve
mean(testCapAveS)
sd(testCapAveS)

# as an argument to the train() command
set.seed(32343)
modelFit <- train(type ~.,data=training,preProcess=c("center","scale"),method="glm")
modelFit

preObj <- preProcess(training[,-58],method=c("BoxCox"))
trainCapAveS <- predict(preObj,training[,-58])$capitalAve
par(mfrow=c(1,2)); hist(trainCapAveS); qqnorm(trainCapAveS)

# K-nearest neighbors imputation using preProcess()
preObj <- preProcess(training[,-58],method="knnImpute")
capAve <- predict(preObj,training[,-58])$capAve

# Covariance

nearZeroVar(training, saveMetrics=TRUE)

library(splines)
bs(training$age,df=3)

# Deep learning
# create features for image/voice that you cannot imagine