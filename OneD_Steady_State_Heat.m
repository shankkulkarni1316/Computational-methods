% Steady-State Heat Conduction in a Bar (One-Dimensional Case)
% The following script is used to determine the temperature in a
% bar subjected to prescribed temperatures at the ends. The heat 
% source in the bar is denoted by q(x).
%
% The finite difference method is used for finding the temperature
% in the bar.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%clc; clear all; close all;
format long e;

length = 0.08; %length in meters
conductivity = 50.0; % conductivity in W/(m-C)

alpha = 100.0; %temp at x=0
beta = 30.0; %temp at x=L

n = [5,10,50]; % no. of points - 1  % we can not use 4 points, min points have to be 5
dx = length./n; % grid spacing

%heat source W/m^3. 
%q = @(x) x^4 


%%%%%%%%  END INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Generate the coordinates of the grid points. Since Matlab does not accept zero indices for
% arrays, we need to readjust node numbers. Thus, xloc(1) is zero and xloc(n+1) =
% L.
figure
n_lenghth = size(n); % to go over loop of different no of points
for j = 1:n_lenghth(2)
    xloc = mesh(dx(j),n(j));


    % Form the matrix A and the vector F:
    [A,F] = formAf( n(j),dx(j),xloc,conductivity,length,alpha,beta );

    % Solve the system of equations A*d = F
    u = solver(A,F);


    %Visualize the temperature distribution in the bar
    %first specify the min and max values for the x and u axes:
    xmin = 0.0;
    xmax = length;
    umin = 0.8*min(u);
    umax = 1.2*max(u);
    %call the function plottemp for plotting temperature.
    plottemp(xloc,u,xmin,xmax,umin,umax,j)
end

%analytical solution
x=0:0.0016:0.08;
u_ana = (-1.50*10000*(x).^2) + (325*x) +(100);
xmin = 0.0;
xmax = length;
umin = 0.8*min(u_ana);
umax = 1.2*max(u_ana); j=0; figure;
plottemp(xloc,u_ana,xmin,xmax,umin,umax,j)
title('Analytical plot');

err = error_cal (u_ana,u); % calculate absolute error
xmin = 0.0;
xmax = length;
umin = 0.8*min(err);
umax = 1.2*max(err); j=0; figure;
plottemp(xloc,err,xmin,xmax,umin,umax,j)
title('Error plot for 4th order'); ylabel('Approximation Error');

