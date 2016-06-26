pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  pollutantData<-data.frame()
  for(file in rep(id)){
    pollutantData<-rbind(pollutantData,read.table(paste(directory,"/",sprintf("%03d", file),".csv",sep=""),sep=",",header=TRUE))
    #head(pollutantData)
    #mean(pollutantData[!is.na(pollutantData[pollutant])][pollutant])
    #index<-!is.na(pollutantData[pollutant])
    #class(pollutantData)
    #mean(as.matrix(pollutantData[complete.cases(pollutantData[pollutant]),][pollutant]))
  }
  mean(as.matrix(pollutantData[pollutant]),na.rm=TRUE)
}
