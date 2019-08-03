function dt = time_increment(C,dx)
% This function calculates optimum time increment using CFL condition 
% alpha = C*(dt/dx) = 1

dt = dx/C;
end