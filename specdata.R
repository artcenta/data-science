concat<-function(...){
  paste(..., sep="")
}

specdata.extract<- function(i, my.directory){
  
  my.step = i
  my.pattern = concat(my.step,".csv")
  file.list = list.files(my.directory,pattern = my.pattern)
  my.file = file.list[1]
  my.path = concat(my.directory,"/", my.file)
  read.csv(my.path, header=TRUE)
}
