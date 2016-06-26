library(sqldf)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "acs.csv", method = "curl")
dateDownloaded <- date()
acs <- read.table("./acs.csv",sep=",",header=TRUE)
head(acs)
# households on greater than 10 acres who sold more than $10,000 worth of agriculture products
# ACR=3 AND AGS=6
agricultureLogical<-(acs$ACR==3 & acs$AGS==6)
which(agricultureLogical)
class(agricultureLogical)

install.packages("jpeg")
library(jpeg)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl, destfile = "jeff.jpg", method = "curl")
img.n<-readJPEG("jeff.jpg",TRUE)
quantile(img.n,probs=c(0.3,0.8))

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "gdp.csv", method = "curl")
gdp <- read.csv("./gdp.csv")
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1, destfile = "edu.csv", method = "curl")
edu <- read.csv("./edu.csv")
X=CountryCode
names(gdp)
names(edu)
head(gdp)
head(edu)
gdpclean<-gdp[5:194,]
mergedData=as.data.frame(merge(gdpclean,edu,by.x="X",by.y="CountryCode"))
mergedData$Gross.domestic.product.2012 = as.numeric(as.character(mergedData$Gross.domestic.product.2012))
summary(mergedData[mergedData$Income.Group=="High income: OECD",])


quantile(mergedData$Gross.domestic.product.2012,probs=c(0.2,0.4,0.6,0.8,1))
library(Hmisc)
mergedData$gdp=cut2(mergedData$Gross.domestic.product.2012,g=5)
table(mergedData$Income.Group,mergedData$gdp)
