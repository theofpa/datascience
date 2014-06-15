# Data splitting - using the createDataPartition() command from the caret package

library(caret); library(kernlab); data(spam)
inTrain <- createDataPartition(y=spam$type, p=0.75, list=FALSE)
training<-spam[inTrain,]
testing<-spam[-inTrain,]

# Fit a model - using the train() command from the caret package

set.seed(32343)
modelFit<-train(type ~., data=training, method="glm")
modelFit
modelFit$finalModel

# Predict on new samples - using the predict command

predictions <- predict(modelFit, newdata=testing)
predictions

# Confusion matrix (compare your predictions with the actual result)

confusionMatrix(predictions, testing$type)
