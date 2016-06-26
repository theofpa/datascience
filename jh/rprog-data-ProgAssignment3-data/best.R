best<- function(state, outcome) {
  ## Read outcome data
  outcome_data <- read.csv2("outcome-of-care-measures.csv",sep=",",colClasses="character")

  ## Check that state and outcome are valid
  if(!(state %in% outcome_data[,7]))
    stop("invalid state")
  if(!(outcome %in% c('heart attack','heart failure','pneumonia')))
    stop("invalid outcome")
  outcome_data<-outcome_data[outcome_data$State==state,]
  suppressWarnings(outcome_data[,c('Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack','Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure','Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia')]<-sapply(outcome_data[,c('Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack','Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure','Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia')],as.numeric))

  ## Return hospital name in that state with lowest 30-day death
  ## rate
  if(outcome=='heart attack'){
    as.character(head(outcome_data[order(outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),"Hospital.Name"],n=1))
  }
  else if(outcome=='heart failure')
    as.character(head(outcome_data[order(outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),"Hospital.Name"],n=1))
  else if(outcome=='pneumonia')
    as.character(head(outcome_data[order(outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),"Hospital.Name"],n=1))
}