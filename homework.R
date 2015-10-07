# Problem 7 #
library(lambda.r)

# Verifying Problem 2 #
pDF(x, y) %when% {
  0 < x
  0 < y
  x + y < 1
} %as% {24*x*y}
pDF(x, y) %as% 0

integrate(function(y) {
  sapply(y, function(y) {
    integrate(Vectorize(function(x) Vectorize(pDF(x, y))), lower=0, upper = 0.5-y)$value
  })
}, lower=-0, upper=Inf)

# Verifying Problem 4 #

pDF(x, y) %when% {
  x >= 0
  y >= 0
} %as% {1 - exp(-x) - exp(-y) + exp(-x-y)}
pDF(x, y) %as% 0

integrate(function(y) {
  sapply(y, function(y) {
    integrate(Vectorize(function(x) Vectorize(pDF(x, y))), lower=0, upper = 3-y)$value
  })
}, lower=-3, upper=Inf)


# Problem 8 #

simulated.pDF <- function(y) log(1/((1-y)))

randomDraws <- runif(1E3, min = 0, max = 1)

results.simulated <- sapply(randomDraws, simulated.pDF)

results.simulated.sq = results.simulated

results.direct <- rexp(1E3)

hist(results.direct, freq=FALSE, col="red", main="Actual results")

hist(results.simulated.sq, freq = FALSE, col="green", main="Simulated Results")

mean(results.simulated.sq)
mean(results.direct)