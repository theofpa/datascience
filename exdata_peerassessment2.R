fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile = "tempdata.zip", method = "curl")
unzip("./tempdata.zip")
code <- readRDS("Source_Classification_Code.rds")
data <- readRDS("summarySCC_PM25.rds")
small<-rbind(small,tail(data,1000))
hist(x=small$year, y=small$Emissions,t="bar")
hist()