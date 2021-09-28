
# regression
fit <- lm(mpg ~ wt, data = mtcars)
summary(fit)

# plot regression in base R
par(mar = c(4, 4, 1, .1))
plot(mtcars$wt, mtcars$mpg)
abline(fit, col = "red")




