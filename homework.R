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
library(lambda.r)
pDF(y) %when% {
  y < 0
} %as% 0
pDF(y) %as% exp(-y)
