fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "acs.csv", method = "curl")
dateDownloaded <- date()
acs <- read.table("./acs.csv",sep=",",header=TRUE)
head(acs)
names(acs)
splitNames=strsplit(names(acs),"wgtp")
splitNames[[123]]


fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "gdp.csv", method = "curl")
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1, destfile = "edu.csv", method = "curl")
edu <- read.csv("./edu.csv")
gdp <- read.csv("./gdp.csv")
head(gdp)
names(gdp)
gdpclean<-gdp[5:194,]
gdpclean[["X.3"]]
mean(as.numeric(str_trim(gsub(",","",gdpclean[["X.3"]]))))
mergedData=as.data.frame(merge(gdpclean,edu,by.x="X",by.y="CountryCode"))
f=mergedData[grep("[Ff]iscal",mergedData[["Special.Notes"]]),]
length(grep("[Jj]une",f[["Special.Notes"]]))

install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
length(grep("Mon",wday(sampleTimes[(grep("^2012",sampleTimes))],label=TRUE)))
wday("2014-05-03",label=TRUE)
