rankall <- function(outcome, num="best"){
  my.outcome = outcome
  my.rank = num
  ##Read outcome data
  my.measures = read.csv("outcome-of-care-measures.csv", na.strings="Not Available", stringsAsFactors=FALSE )
  my.states = unique(my.measures$State)
  my.outcomes = c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
  my.ranks = c("best", "worst")

  ##Check that state outcome and num are valid
  if (!(my.outcome %in% names(my.outcomes))){
    stop("invalid outcome")
  }

  if (!(my.rank %in% names(my.ranks))){
    if(is.numeric(my.rank) && my.rank > nrow(my.measures)){return("NA")}
  }
  
  ##For each state, find the hospital of the given rank
  my.dataset = na.omit(my.measures[,c(2,7,my.outcomes[my.outcome])])
  names(my.dataset) = c("Hospital", "State", "Outcome")
  my.allrank = c(Hospital=character(0), State=character(0))

  for(i in 1:length(my.states)){

    my.state = my.states[i]
    my.sample = my.dataset[with(my.dataset, order(my.dataset$State, my.dataset$Outcome, my.dataset$Hospital)), ]

    my.slice = my.sample[with(my.sample, my.sample$State == my.state), ]

    my.best = my.slice[1,]
    my.worst = my.slice[nrow(my.slice), ]
    
    
    if(is.numeric(my.rank)){
      my.slice = my.sample[with(my.sample, my.sample$State == my.state, my.sample$Outcome == my.rank), ]
      my.ranking = my.slice[my.rank,]
    }
    
    if(my.rank == "best"){my.ranking = my.best}
    else if(my.rank == "worst"){my.ranking = my.worst}
    
    my.allrank = rbind(my.allrank, c(Hospital=my.ranking$Hospital, State=my.states[i]))

  }
  
  ##Return a data frame with the hospital name and the state
  my.slice = data.frame(my.allrank)
  my.slice = my.slice[with(my.slice, order(my.slice$State)), ]
  rownames(my.slice) = my.slice$State
  my.slice
  

}
