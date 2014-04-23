library(datasets)
data(iris)

s<-split(iris,iris$Species)
lapply(s,function(x) colMeans(x[,c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")]))

apply(iris[, 1:4], 2, mean)


library(datasets)
data(mtcars)

with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$mpg, mtcars$cyl, mean)

with(mtcars, tapply(hp, cyl, mean))
tapply(mtcars$hp, mtcars$cyl, mean)


