#Q1
lm(mpg ~ factor(cyl)+wt, data = mtcars)
#Q2
lm(mpg ~ factor(cyl), data = mtcars)
#Q3
l1<-lm(mpg ~ factor(cyl)+wt, data = mtcars)
l2<-lm(mpg ~ factor(cyl)*wt, data = mtcars)
library(lmtest)
lrtest(l2,l1)
#Q4
lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
#Q5
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit<-lm(y~x)
tail(round(sort(hatvalues(fit)),4),1)
#Q6
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit<-lm(y~x)
sort(round(dfbeta(fit)[,2],3))
