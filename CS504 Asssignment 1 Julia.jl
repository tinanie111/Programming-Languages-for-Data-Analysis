# Implementation of the equation
function singlefunction(n)
    a = 1
    for i = 1:n
        a = a*((366-n)/365)
    end
    1-a
end

function repeatedfunction(i)
    A = [ ]
    for n = 1:i
        append!(A,singlefunction(n))
    end
    A
end

#Running Result
repeatedfunction(100)

#Plot
using Plots
plot(repeatedfunction(100),xticks = 0:5:100, yticks = 1:0.1:1)


