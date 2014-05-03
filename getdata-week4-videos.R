fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "cameras.csv", method = "curl")
dateDownloaded <- date()
cameraData <- read.table("./cameras.csv",sep=",",header=TRUE)
head(cameraData)

names(cameraData)
tolower(names(cameraData))

splitNames=strsplit(names(cameraData),"\\.")
splitNames[[5]]
splitNames[[6]]

mylist<-list(letters=c("A","b","c"),numbers=1:3,matrix(1:25,ncol=5))
head(mylist)
mylist[1]
mylist$letters
mylist[[1]]


splitNames[[6]][1]
firstElement<-function(x){x[1]}
sapply(splitNames,firstElement)

fileUrl1<-"https://dl.dropboxcontent.com/u/7710864/reviews-apr29.csv"
fileUrl2<-"https://dl.dropboxcontent.com/u/7710864/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv",method="curl")
download.file(fileUrl2,destfile="./data/solutions.csv",method="curl")
reviews<-read.csv("./data/reviews.csv")
solutions<-read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)
names(reviews)
sub("_","",names(reviews),)

testName<-"this_is_a_test"
sub("_","",testName)
gsub("_","",testName)

grep("Alameda",cameraData$intersection)
table(grepl("Alameda",cameraData$intersection))
cameraData2<-cameraData[!grepl("Alameda",cameraData$intersection),]

grep("Alameda",cameraData$intersection,value=TRUE)
grep("JeffStreet",cameraData$intersection)
length(grep("JeffStreet",cameraData$intersection))

library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek",1,7)
paste("Jeffrey","Leek")
paste0("Jeffrey","Leek")
str_trim("Jeff     ")

# Date
d1=date()
d1
class(d1)
d2=Sys.Date()
d2
class(d2)
format(d2,"%a %b %d")
x=c("1jan1960","2jan1960")
z=as.Date(x,"%d%b%Y")
z
z[1]-z[2]
as.numeric(z[1]-z[2])

weekdays(d2)
months(d2)
julian(d2)

install.packages("lubridate")
library(lubridate)
ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")

ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03",tz="Pacific/Auckland")
?Sys.timezone

x=dmy(c("1jan1960","2jan1960"))
wday(x[1])
wday(x[1],label=TRUE)
