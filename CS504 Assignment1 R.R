#Implementation of the equation
probability<- function(n){
  obs <- seq(365, 365-n+1,by = -1)
  a = 1
  for (i in 1:n){
    a = a*obs[i]/365}
  return(1-a)}
sbs = list()
for (i in 1:100){
  sbs[i] = probability(i)
}
#Running result
sbs
#Plot
plot(1:100,sbs)

