pollutantmean <- function(directory, polluant,id=1:332){

  #Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
  #across a specified list of monitors. 
  #The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
  #Given a vector monitor ID numbers, 'pollutantmean' reads 
  #that monitors' particulate matter data from the directory specified in the 'directory' argument 
  #and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. 
  #A prototype of the function is as follows  my.directory = directory
  
  #author:jdgouede@artcenta
  
  my.directory = directory
  my.column = polluant
  my.slice = id
  my.length = length(my.slice)
  my.dataset = c()
  my.count = 0
  for(i in my.slice){
    my.step = i
    my.data = specdata.extract(my.step, my.directory)
    my.sample = my.data[[my.column]]
    my.clean = na.omit(my.sample)
    if(length(my.clean) > 0){
      for(j in 1:length(my.clean)){
        
        my.index = j
        my.count = my.count + 1
        my.item = my.clean[my.index]
        my.dataset[my.count] = my.item
      }
      
    }
    }
  
    mean(my.dataset)
   }


