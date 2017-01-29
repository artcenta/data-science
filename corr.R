
corr <- function(directory, threshold=0){
  
  #Write a function that takes a directory of data files and a threshold 
  #for complete cases and calculates the correlation between sulfate and nitrate for monitor locations 
  #where the number of completely observed cases (on all variables) is greater than the threshold. 
  #The function should return a vector of correlations for the monitors that meet the threshold requirement. 
  #If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. 
  #A prototype of this function follows
  
  #author:jdgouede@artcenta.com
  
  my.directory = directory
  my.slice = length(dir(directory))
  my.complete = complete(directory, 1:my.slice)
  my.nobs = my.complete$nobs
  my.sample = my.complete$id[my.nobs > threshold]
 my.correlation = c() 
  my.count = 0
  for(i in my.sample){
    my.step = i
    my.count = my.count + 1
    my.data = specdata.extract(my.step, my.directory)
    my.correlation[my.count] = cor(my.data$sulfate,my.data$nitrate, use= "na.or.complete")
    
    }
  
  my.correlation
}