fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile = "tempdata.zip", method = "curl")
unzip("./tempdata.zip")
data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")
library(reshape)
library(ggplot2)
sources<-aggregate(data$Emissions[data$SCC %in% code$SCC[grep("Veh",code$Short.Name)] & (data$fips==24510 | data$fips=="06037")] ~ data$year[data$SCC %in% code$SCC[grep("Veh",code$Short.Name)] & (data$fips==24510 | data$fips=="06037")] + data$fips[data$SCC %in% code$SCC[grep("Veh",code$Short.Name)] & (data$fips==24510 | data$fips=="06037")], data, sum)
colnames(sources)<-c("year","fips","emissions")
ggplot(sources, aes(x=factor(year),y=emissions,group=fips)) + geom_line(aes(colour=fips)) +
  ggtitle("Emissions by vehicle sources") + labs(x = "Years", y="Emissions") +
  scale_colour_manual (values=c("orange","black"), labels=c("Los Angeles County","Baltimore City"))
