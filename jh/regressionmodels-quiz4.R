#Q1
library(MASS)
shuttle1<-shuttle
levels(shuttle1$use)[1]<-"1"
levels(shuttle1$use)[2]<-"0"
shuttle1$use<-as.numeric(as.character(shuttle1$use))
glm(formula = use ~ factor(wind), family = binomial(logit), data = shuttle1)
1/exp(0.03181)

#Q2
summary(logRegshuttle <- glm(use ~ wind,family="binomial", data=shuttle1)) 

glm(formula = use ~ factor(wind)+magn, family = binomial(logit), data = shuttle1)
1/exp(0.03201)

#Q3
LogiRegUseMinus<-glm((1-shuttle$use)~shuttle$wind,family="binomial")
glm(formula = 1-use ~ factor(wind), family = binomial(logit), data = shuttle1)
1-0.03181

#Q4
exp(coef(glm(count ~ as.factor(spray) - 1, family="poisson", InsectSprays)))
14.5/15.333
data(InsectSprays)
InsectSprays
pspray <- glm(InsectSprays$count ~ factor(InsectSprays$spray),family="Poisson")
pspray <- glm(InsectSprays$count ~ factor(InsectSprays$spray),family="poisson")
summary(pspray)
exp(2.659)



#Q5
y=c(1:10)
x=y-1+rnorm(10)/10
z=c(1:10)
z=z*2
summary(lm(y~x+offset(z)))
z=z*4
summary(lm(y~x+offset(z)))
z=z+5
summary(lm(y~x+offset(z)))
z=z+100
summary(lm(y~x+offset(z)))
z=z/10
summary(lm(y~x+offset(z)))
z=z+log(10)
summary(lm(y~x+offset(z)))

#Q6
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
plot(y ~ x)
d1 <- c(0, 0 ,0, 0, 0,  0,  1 , 1,  1 , 1 , 1)
d2 <- c(1, 1 ,1, 1, 1,  1,  0 , 0,  0, 0 , 0) 
summary(lm(y ~ d1*x))

