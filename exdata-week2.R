library(lattice)
library(datasets)
airquality <- transform(airquality, Month=factor(Month))
xyplot(Ozone ~ Wind | Month, data=airquality, layout = c(5,1))


library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

head(BodyWeight)


library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
print(p)


library(datasets)
data(airquality)

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)
qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))
qplot(Wind, Ozone, data = airquality, geom = "smooth")
qplot(Wind, Ozone, data = airquality)


library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)
g + geom_point()

qplot(votes, rating, data = movies)
qplot(votes, rating, data = movies) + stats_smooth("loess")
qplot(votes, rating, data = movies, panel = panel.loess)
qplot(votes, rating, data = movies) + geom_smooth()
qplot(votes, rating, data = movies, smooth = "loess")
