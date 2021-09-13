pkg load statistics
pkg load symbolic

%Define the sequence
x = [-5:0.01:5];

x1=0.5*(1+erf(x/sqrt(2)));
x2=normcdf(x,0,1);
x3=max(x1-x2);
disp(x3);
%maximum difference between two cdf implementations

%define PDF, derivative and second derivative
f=normpdf(x,0,1);
df= diff (f)/0.01;
dff= diff(df)/0.01;

% check the length of f df and dff
n=2*length(f);
a1=n
n=2*length(df);
a2=n
n=2*length(dff);
a3=n

graphics_toolkit ("gnuplot");
x1=[-4.99:0.01:5];
x2=[-4.99:0.01:4.99];
plot(x,f,'LineWidth',4,x1,df,'LineWidth',4,x2,dff,'LineWidth',4);
h = legend({'PDF','derivative','second derivative'});      
set (h, "fontsize", 14);
title('{\fontsize{30} PDF and derivative and second derivative}')
axis([-5 5 -0.5 0.5])
xlabel('{\fontsize{25} values}');
ylabel('{\fontsize{25} probability}');
hold off;
%plot the curves
