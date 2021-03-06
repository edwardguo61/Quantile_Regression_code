# Calculate MSE
mse <- function(x){
  return(mean((x-1)^2))
}

# Return result of rqs 
resultList <- function(i, n, Tau, mus=mu, sigmas=sigma, betas=beta, ks=k){
  # Return result of oneshot & pilot & onestep estimation
  
  # Args:
  # i - number of replication
  # n - number of observations
  # Tau - quantile
  # mus - mean of simulated X data
  # sigmas - convariance matrix of simulated X data
  # betas - true beta values of simulated data
  # ks - number of machines
  
  # generate sample
  Data <- generateXY(n, mus, sigmas, betas)
  
  # generate ordered data
  OrderData <- generateOrderXY(Data)
  
  # return oneshot & pilot & onestep estimation of 
  # random sampled data and ordered data
  return(c(globalEstimate(Data[[1]], Data[[2]], Tau),
           oneshotEstimate(Data[[1]], Data[[2]], ks, Tau),
           onestepEstimate(Data[[1]], Data[[2]], ks, Tau),
           globalEstimate(OrderData[[1]], OrderData[[2]], Tau),
           oneshotEstimate(OrderData[[1]], OrderData[[2]], ks, Tau),
           onestepEstimate(OrderData[[1]], OrderData[[2]], ks, Tau)))
}