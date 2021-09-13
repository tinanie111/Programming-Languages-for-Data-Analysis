pkg load control
pkg load plot
pkg load gnuplot
graphics_toolkit ("gnuplot");

#Implementation of the equation
a = 1;
A = zeros(1,80);
for i = 1:80
    a = a*(366-i)/365;
#Append rates of the number of people into a matrix
    A(1,i) = 1-a;
endfor
A = transpose(A);
A

setenv("GNUTERM","X11")

plot (A)




