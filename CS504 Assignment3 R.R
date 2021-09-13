r<-seq(51,55,0.02) 
n = 20
N = 10^4
mu0 = 53.0
sigma = 1.2
powerT <- c()
powerU <- c()
position  = 0

for (muActual in r){
  dist = rnorm(100,muActual,sigma)
  rejectT = 0
  rejectU = 0
  for (it in seq(N)){
    data = sample(dist,20)
    xPositive = 0
    for (i in data){
      if (i > mu0){
        xPositive = xPositive +1}}
    Ustat = max(xPositive,n-xPositive)
    pValSign = dbinom(Ustat,n,0.5)*2
    
    xBar = mean(data)
    stdDev = sd(data)
    tstatT = (xBar-mu0)/(stdDev/sqrt(n))
    pValT = (1-pt(abs(tstatT),n-1))*2
    
    if (pValSign< 0.05){rejectU = rejectU+1}
    if (pValT<0.05){rejectT = rejectT+1}
  }
    powerT[position] <- rejectT/N
    powerU[position] <- rejectU/N
    position = position+1
}

spT=spline(seq(51,55-0.02,0.02),powerT,n=15)
spU=spline(seq(51,55-0.02,0.02),powerU,n=15)

plot(spT,type='l',col='blue',
     xlab="Different values of muActual",
     ylab="Proportion of times H0 rejected",
     xlim = c(51,55),ylim = c(0,1))
lines(spU,col = 'red')
legend("bottomleft",legend = c("T Test","S Test"),lty = c(1,1),
       col = c("blue","red"))


