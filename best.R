best <- function(state, outcome){
  my.state =  state
  my.outcome = outcome
  ##Read outcome data
  my.measures = read.csv("outcome-of-care-measures.csv", na.strings="Not Available", stringsAsFactors=FALSE )
  my.states = unique(my.measures$State)
  my.outcomes = c("heart attack"=11, "heart failure"=17, "pneumonia"=23)

  ##Check that state and outcome are valid
  if (!(my.state %in% my.states)){
     stop("invalid state")
  }
  if (!(my.outcome %in% names(my.outcomes))){
    stop("invalid outcome")
  }
  
  ##Return hospital name in that state with lowest 30-day death rate
  my.dataset = na.omit(my.measures[,c(2,7,my.outcomes[my.outcome])])
  names(my.dataset) <- c("Hospital", "State", "Outcome")
  
  my.sample = my.dataset[with(my.dataset, order(my.dataset$State, my.dataset$Outcome, my.dataset$Hospital)), ]
  my.slice = my.sample[with(my.sample, my.sample$State == my.state), ]
  my.best = my.slice[1,1]
  my.best
  
}
