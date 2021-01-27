# Population parameters
population_mean = 100
population_sd = 15

IQ <- c()
for(i in seq(1,100,10)){
  # Generate random data
  IQ <- c(IQ, rnorm(n = i, mean = population_mean, sd = population_sd))
  
  # Round to remove decimals
  IQ <- round(IQ, 0)
  
  p <- histogram(data = NULL, x = IQ, bins = 20) +
    ggplot2::scale_y_continuous(limits = c(0, 1000)) +
    ggplot2::scale_x_continuous(limits = c(0, 200)) 
  print(p)
  profvis::pause(1)
}
