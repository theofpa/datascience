fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile = "tempdata.zip", method = "curl")
unzip("./tempdata.zip")
data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")
library(reshape)
library(ggplot2)
sources<-aggregate(data$Emissions[data$SCC %in% code$SCC[grep("Coal",code$Short.Name)]] ~ data$year[data$SCC %in% code$SCC[grep("Coal",code$Short.Name)]] , data, sum)
colnames(sources)<-c("year","emissions")
ggplot(sources, aes(x=factor(year),y=emissions)) + geom_bar(stat = "identity") +
  ggtitle("Emissions by Coal Combustion") + labs(x = "Years", y="Emissions")
