library(sqldf)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "acs.csv", method = "curl")
dateDownloaded <- date()
acs <- read.table("./acs.csv",sep=",",header=TRUE)
sqldf("select * from acs where AGEP < 50 and pwgtp1")

unique(acs$AGEP)
sqldf("select distinct AGEP from acs")


con=url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode=readLines(con)
for (ind in c(10,20,30,100)){
  print(nchar(htmlCode[ind]))
}

library(foreign)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl, destfile = "wks.xpt", method = "curl")
dateDownloaded <- date()
wksData<-read.fwf("./wks.xpt",skip=4,widths=c(12, 7,4, 9,4, 9,4, 9,4))
sum(wksData[4])
