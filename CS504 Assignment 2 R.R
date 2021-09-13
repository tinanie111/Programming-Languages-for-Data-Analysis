#CS 504 Programming Language for Data Analysis
#Assignment 2
#Lin, Junjia 002268506
#Nie, Luyun 002268087
# Method 3: R

# Define the normal Guass distribution range
x<- seq(-5,5,0.1)
y<- dnorm(x, mean = 0, sd = 1)

#Question 1: Finding the differences between 2 CDF methods
difference <- c()

#To appy the drf function, we introduce the 'pracma' library
library(pracma)
cdf1 <- 0.5*(1+erf(x/sqrt(2)))
cdf2 <- pnorm(x)
for (i in seq(1,length(x))) {
  difference[i] <- cdf1[i]-cdf2[i]
}
maxdifference = max(difference)
#Answer: We are able to find the difference between the 2 methods is nearly 0. 
#Generally, these 2 methods can be treated equal.

#Question 2: Plot the normal PDF with the first derivative and second derivative
f = expression(dnorm(x, mean = 0, sd = 1))
dx1 <- eval(D(f,'x'))
dx2 <- eval(D(D(f,'x'),'x'))
data <- data.frame(y,dx1,dx2)
matplot(x, data, type = "l", lty = 1, lwd = 2,col = 2:5,axes = TRUE,
        xlab="Values",ylab = "Probabilities",xaxt="n")
legend(2, 0.38, c("Normal PDF", "First derivative", "Second derivative"), 
       col = 2:5,lwd = 2, merge = FALSE, bg='gray90', cex= 0.7,)
title("Plot of Normal PDF")
axis(side=1,at=seq(-5,5,0.5),labels=seq(-5,5,0.5))
grid(nx = 22, ny = 22)
#Answer: when x = 0, the first derivative of the normal PDF is 0 and 
#the second derivative os the normal PDF is 0 by x = -1 or x = +1

