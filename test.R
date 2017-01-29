specdata.test <- function(){

  source("specdata.R")
  source("pollutantmean.R")
  source("complete.R")
  source("corr.R")
  
  print("pollutantmean (specdata, sulfate, 1:10)")
  print(pollutantmean("specdata", "sulfate", 1:10))
  
  print("pollutantmean (specdata, nitrate, 70:72)")
  print(pollutantmean("specdata", "nitrate", 70:72))
  
  print("pollutantmean (specdata, nitrate, 23)")
  print(pollutantmean("specdata", "nitrate", 23))

    print("complete (specdata, 1)")
  print(complete("specdata", 1))
  
  print("complete(specdata, c(2, 4, 8, 10, 12))")
  print(complete("specdata", c(2, 4, 8, 10, 12)))
  
  print("complete(specdata, 30:25)")
  print(complete("specdata", 30:25))
  
  print("complete(specdata, 3)")
  print(complete("specdata", 3))
  
  print("head(corr (specdata, 150))")
  cr <- corr("specdata", 150)
  print(head(cr))
  print("summary(corr (specdata, 150))")
  print(summary(cr))
  
  print("head(corr (specdata, 400))")
  cr <- corr("specdata", 400)
  print(head(cr))
  print("summary(corr (specdata, 400))")
  print(summary(cr))
  
  print("head(corr (specdata, 5000))")
  cr <- corr("specdata", 5000)
  print(head(cr))
  print("summary(corr (specdata, 5000))")
  print(summary(cr))
  
}
