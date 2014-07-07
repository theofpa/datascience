#Quiz1
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
sum(w*x)/sum(w)

#Quiz2
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
lm(x~y)
yc <- y - mean(y)
xc <- x - mean(x)
beta1 <- sum(yc * xc) / sum(xc ^ 2)
c(beta1, coef(lm(y ~ x))[2])


#Quiz3
library(datasets)
data(mtcars)
mtcars$mpg
yc <- mtcars$mpg - mean(mtcars$mpg)
xc <- mtcars$wt - mean(mtcars$wt)
beta1 <- sum(yc * xc) / sum(xc ^ 2)
c(beta1, coef(lm(mtcars$mpg ~ mtcars$wt))[2])

#Quiz4

#Quiz6
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
xn <- (x - mean(x))/sd(x)
xn[1]


#Quiz7
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
lm(y ~ x)

#Quiz9
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)

lm(x~1)






#sandbox
x<-c(25,36,57)
y<-c(22,33,54)
cor(x,y)
