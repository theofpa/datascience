fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile = "tempdata.zip", method = "curl")
unzip("./tempdata.zip")
data <- readRDS("summarySCC_PM25.rds")
library(reshape)
library(ggplot2)
sources<-aggregate(data$Emissions[data$fips==24510] ~ data$type[data$fips==24510]+data$year[data$fips==24510] , data, sum)
colnames(sources)<-c("type","year","emissions")
ggplot(sources, aes(x=factor(year),y=emissions,group=type)) + geom_line(aes(colour=type)) +
  ggtitle("Emissions in Baltimore City") + labs(x = "Years", y="Emissions")
