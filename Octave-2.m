pkg load statistics
pkg load control

p = 18/37;
xGrid = 1:7;
N = 10^6;
mcC = size(1,N);

rand()

for i = 1: N
    x=0;
    while (true)
        x=x+1;
        if rand() < p
            mcC(1,i) = x;
            break;
        endif
    endwhile
endfor

mcEstimate = histc(mcC,unique(mcC))/N;
mcEstimate = mcEstimate(1,xGrid)

gPmf = geopdf (xGrid-1, p)

graphics_toolkit ("gnuplot");
x = xGrid;
y = [transpose(mcEstimate),transpose(gPmf)]
h = stem (x, y);
set (h(1), "color", "b","linewidth",30)
set (h(2), "color", "r","linewidth",20,"marker","x");
title('{\fontsize{50} A geometric PMF}')
axis([0 8 0 0.6])
xlabel('{\fontsize{40} X}');
ylabel('{\fontsize{40} Probability}');
legend("mcEstimate","gPmf");
hold off;


