using Distributions, Calculus, SpecialFunctions, Plots;pyplot()

# Define the normal Guass distribution range
xGrid = -5:0.01:5

PhiA(x) = 0.5*(1+erf(x/sqrt(2)))
PhiB(x) = cdf(Normal(),x)
println("Maximum difference between two CDF implementations: ", maximum(PhiA.(xGrid) - PhiB.(xGrid)))

normalDensity(z) = pdf(Normal(),z)
d0 = normalDensity.(xGrid)
d1 = derivative.(normalDensity,xGrid)
d2 = second_derivative.(normalDensity, xGrid)
plot(xGrid, [d0 d1 d2], c=[:blue :red :green],label=["Normal PDF" "First derivative" "second derivative"])
plot!([-5,5],[0,0], color=:black, lw=0.5, xlabel="Values", xlims=(-5,5), label="")
