
set.seed(1)
rpois(5, 2)


set.seed(10)
x <- rbinom(10, 10, 0.5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
str(y)

x1 <- rbinom(10, 10, 0.5)
x2 <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x1 + x2
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
x<-mean(c(1:100))
Rprof(NULL)
summaryRprof()
lm(y~x)
