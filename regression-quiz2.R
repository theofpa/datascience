# Quiz 1 & 2
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit<-lm(y~x)
summary(fit)

# Quiz 3
x<-mtcars$wt
y<-mtcars$mpg
predict(lm(y~x) , newdata = data.frame(x=mean(x)), interval="confidence") 

# Quiz 5
predict(fit,data.frame(x=3),interval=("prediction"))

# Quiz 6
x<-mtcars$wt*0.5
fit<-lm(y~x)
#predict(fit,data.frame(x=3),interval=("confidence"))
sumCoef<-summary(fit)$coefficients
sumCoef[2,1]+c(-1,1)*qt(.975,df=fit$df)*sumCoef[2,2]

# notes
e<-resid(fit)
yhat<-predict(fit)
max(abs(e-(y-yhat)))
b1<-coef(fit)[2]
# alternative
# b1<-cor(y,x)*sd(y)/sd(x)
b0<-coef(fit)[1]
# alternative
# b0<-mean(y)-b1*mean(x)
e<-y-b0-b1*x
sigma<-sqrt(sum(e^2)/(n-2))
# sum of squared Xs
ssx<-sum((x-mean(x))^2)
ssx<-sum((y-mean(y))^2)
