# library(lambda.r)
# pDF(x, y) %when% {
#   0 < x
#   0 < y
#   x + y < 1
# } %as% 24*x*y
# pDF(x, y) %as% 0
# 
# integrate(function(y) {
#   sapply(y, function(y) {
#     integrate(Vectorize(function(x) Vectorize(pDF(x, y))), lower=0, upper = 1)$value
#   })
# }, lower=-0, upper=1)


# Problem 8 #

simulated.pDF <- function(y) log(1/((1-y)))

randomDraws <- runif(1E3, min = 0, max = 1)

results.simulated <- sapply(randomDraws, simulated.pDF)

results.simulated.sq = results.simulated^2

results.direct <- rexp(1E3)


hist(results.simulated.sq, freq = FALSE, col="green")
hist(results.direct, freq=FALSE, col="red", add=TRUE)