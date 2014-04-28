best<- function(state, outcome) {
  ## Read outcome data
  outcome_data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(!(state %in% outcome_data[,7]))
    stop("invalid state")
  if(!(outcome %in% c('heart attack','heart failure','peumonia')))
    stop("invalid outcome")
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  if(outcome=='heart attack'){
    outcome_data<-outcome_data[(outcome_data$Hospital.Name==state),]
    head(outcome_data[order(outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),"Hospital.Name"],n=1)
  }
  else if(outcome=='heart failure')
    head(outcome_data[order(outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),"Hospital.Name"],n=1)
  else if(outcome=='pneumonia')
    head(outcome_data[order(outcome_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Pneumonia),"Hospital.Name"],n=1)
}