complete <- function(directory, id=1:332){

  #Write a function 
  #that reads a directory full of files and reports the number of completely observed cases in each data file. 
  #The function should return a data frame 
  #where the first column is the name of the file and the second column is the number of complete cases. 
  #A prototype of this function follows
  
  #author:jdgouede@artcenta.com
  
  
  my.directory = directory
  my.slice = id
  my.length = length(my.slice)
  my.dataset = data.frame(id= numeric(), nobs= integer()) 
  my.count = 0
  for(i in my.slice){
    my.step = i
    my.count = my.count + 1
    my.data = specdata.extract(i, my.directory)
    my.complete = sum(complete.cases(my.data))
    my.dataset[my.step,] = na.omit(c(my.step,my.complete))
    
    }
  
  na.omit(my.dataset)
}