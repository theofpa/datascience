fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile = "tempdata.zip", method = "curl")
unzip("./tempdata.zip")
data <- readRDS("summarySCC_PM25.rds")
barplot(tapply(data$Emissions[data$fips==24510],data$year[data$fips==24510],sum),xlab="year",ylab="emissions in Baltimore City")
