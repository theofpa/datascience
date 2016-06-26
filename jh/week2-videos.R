f<-function(a, b=1, c=2, d=NULL){
  # do something
}
sd(f)
args(f)
args(lm)

f<-function(a,b,...){
  print(a, b, ...)
}

f(2,3,4)

args(paste)
args(cat)

add2<-function(x,y){
  x+y
}

add2(3,5)

above<-function(x,n=10){
  use <- x > n
  x[use]
}
x<-1:20
above(x)

columnmean <- function(y, removeNA=TRUE){
  nc<-ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}
columnmean(airquality)
airquality


x <- Sys.time()
x

p <- as.POSIXlt(x)
p
names(unclass(p))
p$sec

# POSIX CT
unclass(x)
x$sec

x<-as.Data("2012-01-01")
y<-strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y
x<-as.POSIXlt(x)
x-y
