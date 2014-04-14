if (!file.exists("data")) {
  dir.create("data")
}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "cameras.csv", method = "curl")
dateDownloaded <- date()
cameraData <- read.table("./cameras.csv",sep=",",header=TRUE)
head(cameraData)

library(XML)
fileurl<-"http://www.w3schools.com/xml/simple.xml"
doc<-xmlTreeParse(fileurl,useInternal=TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
rootNode[[1]][[1]]
xmlSApply(rootNode,xmlValue)
xpathSApply(rootNode,"//name",xmlValue)


library(jsonlite)
jsondata<-fromJSON("https://api.github.com/users/theofpa/repos")
names(jsondata$owner)
jsondata$owner$login
myjson<-toJSON(iris,pretty=TRUE)
cat(myjson)
iris2<-fromJSON(myjson)
head(iris2)
head(jsondata)

install.packages("data.table")
library(data.table)
DF=data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)
DT=data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)
tables()
DT[2,]
DT[DT$y=="a",]
DT[c(2,3)]
DT[,c(2,3)]
DT[,list(mean(x),sum(z))]
DT[,table(y)]
DT[,w:=z^2] # Add new column
DT[,m:={tmp<-(x+z); log2(tmp+5)}]
head(DT)
DT[,a:=x>0] # Plyr like operation
DT[,b:=mean(x+w),by=a]
set.seed(123)
DT<-data.table(x=sample(letters[1:3],1E5,TRUE))
DT[,.N,by=x]
DT=data.table(x=rep(c("a","b","c"),each=100),y=rnorm(300))
setkey(DT,x)
DT['a']
DT1<-data.table(x=c('a','a','b','dt1'),y=1:4)
DT2<-data.table(x=c('a','b','dt2'),y=5:7)
setkey(DT1,x); setkey(DT2,x)
merge(DT1,DT2)






fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "hid.csv", method = "curl")
dateDownloaded <- date()
hidData <- read.table("./hid.csv",sep=",",header=TRUE)
DT=data.table(hidData)
# TYPE=1, VAL=24
nrow(DT[DT$VAL==24 & DT$TYPE==1])


library(xlsx)
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileurl,destfile="./lala.xlsx",method="curl")
dateDownloaded <- date()
lala<-read.xlsx("./lala.xlsx",sheetIndex=1,header=TRUE)
head(lala)
rowIndex<-18:23
colIndex<-7:15
dat<-read.xlsx("./lala.xlsx",sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)
head(dat)
sum(dat$Zip*dat$Ext,na.rm=T) 

library(XML)
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileurl,destfile="./balt.xml",method="curl")
dateDownloaded <- date()
doc<-xmlTreeParse("./balt.xml",useInternal=TRUE)
rootNode<-xmlRoot(doc)
#zipcode=21231
nrow(data.frame(xpathSApply(rootNode,"/response/row/row[zipcode='21231']/name",xmlValue)))

library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "pid.csv", method = "curl")
dateDownloaded <- date()
hidData <- read.table("./pid.csv",sep=",",header=TRUE)
DT=data.table(hidData)

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT[DT$SEX==1,]$pwgtp15)); system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
