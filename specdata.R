concat<-function(...){
  paste(..., sep="")
}

specdata.extract<- function(i, my.directory){
  
  my.step = i
  my.pattern = concat(my.step,".csv")
  file.list = list.files(my.directory,pattern = my.pattern)
  my.file = file.list[1]
  my.path = concat(my.directory,"/", my.file)
  do.call(rbind, lapply(my.file, function(x) read.csv(my.path, header=TRUE)))
}
