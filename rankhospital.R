rankhospital <- function(state, outcome, num="best"){
  my.state =  state
  my.outcome = outcome
  my.rank = num
  ##Read outcome data
  my.measures = read.csv("outcome-of-care-measures.csv", na.strings="Not Available", stringsAsFactors=FALSE )
  my.states = unique(my.measures$State)
  my.outcomes = c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
  my.size = nrow(my.measures)
  my.ranks = c("best", "worst")

  ##Check that state outcome and num are valid
  if (!(my.state %in% my.states)){
     stop("invalid state")
  }
  if (!(my.outcome %in% names(my.outcomes))){
    stop("invalid outcome")
  }

  if (!(my.rank %in% names(my.ranks))){
    if(is.numeric(my.rank) && my.rank > my.size){return("NA")}
  }
  
  ##Return hospital name in that state with the given rank of 30 days death rate
  my.dataset = na.omit(my.measures[,c(2,7,my.outcomes[my.outcome])])
  names(my.dataset) <- c("Hospital", "State", "Outcome")
  
  my.sample = my.dataset[with(my.dataset, order(my.dataset$State, my.dataset$Outcome, my.dataset$Hospital)), ]
  my.slice = my.sample[with(my.sample, my.sample$State == my.state), ]
  my.best = my.slice[1,1]
  my.worst = my.slice[nrow(my.slice), 1]
  
  if(is.numeric(my.rank) && my.rank > nrow(my.slice)){return("NA")}
  
  if(is.numeric(my.rank)){
    my.slice = my.sample[with(my.sample, my.sample$State == my.state, my.sample$Outcome == my.rank), ]
    my.ranking = my.slice[my.rank, 1]
  }

  if(my.rank == "best"){my.ranking = my.best}
  else if(my.rank == "worst"){my.ranking = my.worst}
  my.ranking
  
}
