# Code to genereate examples in R Users DC talk
# "Strategies for Managing Missing Data"
# Delivered 8/30/2012

# Data set for imputing continuous variable with linear regression
n <- 50
X <- data.frame(x1=rnorm(n), x2=rexp(n))
X <- data.frame(y=2*X$x1 - .5*X$x2 +6, X)
# make third entry of x1 missing
deleted.entry <- X$x1[3]
X$x1[3] <- NA

round(head(X), 2)

i <- 3
j <- 2
prediction.rows <- c(1:2, 4:50)
obs.cols <- c(1,3)
res <- lm(X$x1 ~ X$y + X$x2)
summary(res)
predict(res, X[i,obs.cols], se.fit=TRUE)
