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
