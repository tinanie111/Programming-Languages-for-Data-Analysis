# Title     : TODO
# Objective : TODO
# Created by: tinan
# Created on: 2021-04-26
p <- 18/37
xGrid <- 1:7
N <- 10^6
mcC <- c()
rouletteSpins <- function (p){
  x <- 0
  while (TRUE){
    x <- x + 1
    if (runif(1) < p) {
      return (x)
    }
  }
}
for (i in 1:N){
  mcC<- append(mcC, rouletteSpins(p))
}
mcC <- table(mcC)
mcEstimate  <- mcC/N
mcEstimate

gDist <- dgeom(xGrid-1,p)
gDist

plot(xGrid,mcEstimate[xGrid],type = 'h',col = 'blue', lwd = 10,
     xlab = 'X',ylab = 'Probability',main = 'A geometric PMF')
axis(2,at=seq(0,1,0.1))
points(gDist,col = 'red',lwd = 5,pch = 4)

legend("topright",legend = c("mcEstimate","PMF"),lty = c(1,2),
       col = c("blue","red"))





