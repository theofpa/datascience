# str()
str(str)
str(lm)
str(ls)
x<-rnorm(100,2,4)
summary(x)
str(x)
f<-gl(40,10)
str(f)
summary(f)
library(datasets)
head(airquality)
str(airquality)
m<-matrix(rnorm(100),10,10)
str(m)
s<-split(airquality,airquality$Month)
str(s)

# Simulation
# rnorm, dnorm, pnorm, rpois
# d-density r-random p-cumulative q-quantile

dnorm(x,mean=0,sd=1,log=FALSE)
pnorm(x,mean=0,sd=1,lower.tail=TRUE,log.p=FALSE)
qnorm(x,mean=0,sd=1,lower.tail=TRUE,log.p=FALSE)
rnorm(x,mean=0,sd=1)

x<-rnorm(10)
x<-rnorm(10,20,2)
summary(x)

set.seed(1)
rnorm(5)
set.seed(1)
rnorm(5)

rpois(10,1)
rpois(10,2)
rpois(10,20)
ppois(2,2)
ppois(4,2)
ppois(6,2)

set.seed(20)
x<-rnorm(100)
e<-rnorm(100,0,2)
y<-0.5 + 2*x +e
summary(y)
plot(x,y)

set.seed(10)
x<-rbinom(100,1,0.5)
e<-rnorm(100,0,2)
y<-0.5 + 2*x +e
summary(y)
plot(x,y)

set.seed(1)
x<-rnorm(100)
log.mu<-0.5+0.3*x
y<-rpois(100,exp(log.mu))
summary(y)
plot(x,y)

set.seed(1)
sample(1:10,4)
sample(1:10,4)
sample(letters,5)
sample(1:10)
sample(1:10)
sample(1:10,replace=TRUE)

# Profiling
system.time(readLines("http://www.jhsph.edu"))
hilbert<-function(n){
  i<-1:n
  1/outer(i-1,i,"+")
}
x<-hilbert(1000)
system.time(svd(x))


