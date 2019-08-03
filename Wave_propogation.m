% Wave propogation in a Bar (One-Dimensional Case)
% Shank Kulkarni
% Homework 3          Question 2
% Explicite finite difference method is used 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%clc; clear all; close all;
format long e;

length = 0.6; %length in meters
E = 200*10^9; % Young's modulus in Pa
rho = 7800; % density in kg/m3

% calculate bar speed C
C = sqrt(E/rho);

n = 500; % no. of points - 1  
dx = length./n; % grid spacing
dt = time_increment(C,dx); %time increment calculation using CFL condition in seconds
t_tr = length/C;
t0 = t_tr/10;
A = 0.001; %m
alpha = C*(dt/dx);
t_save = [0,0.005,0.015,0.5,0.75,0.95,1.1,1.5]; %solution is saved at these times

%%%%%%%%  END INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Generate the coordinates of the grid points. Since Matlab does not accept zero indices for
% arrays, we need to readjust node numbers. Thus, xloc(1) is zero and xloc(n+1) =
% L.
xloc = mesh(dx,n);

%Initializing arrays
% u^n+1 = u_future; u^n = u; u^n-1 = u_past;
u_future = zeros(n+1,1); u_past = zeros(n+1,1); u= zeros(n+1,1); u_1 =zeros(8,n+1);
x_2 = zeros(round(2*t_tr/dt),1);

figure
for tau = 1:(2*t_tr/dt)  % loop for time marching
    if (tau == 1)  % saving initial condition
        u_1(1,:) = u;
    end    

    % specifying boundary conditions
    u(1) =  0;
    u(n+1) = A*((heaviside(tau*dt))-(heaviside(tau*dt-t0)));
    
    if u(n+1) == A*0.5  % MATLAB heaviside function comes with 1/2 maximum convention
        u(n+1) = 0;     % to remove that this if loop is used.
    end
    
    % calculating displacements for next time step
    u_future = solver(n,u_past,u,alpha);
    
    % Updating the parameters for next time step
    [u_past, u] = update_parameters(u,u_future); 
    
    % giving values to plot
    xmin = 0; xmax = length; umin = -1.2*A; umax = 1.2*A;
    plotdisp(xloc,u,xmin,xmax,umin,umax)
    pause(0.0005) % pause is used for animation
    
    % saving values for specific times

    if (tau == round(0.005*t_tr/dt))
        u_1(2,:) = u_past;
    end
     if (tau == round(0.015*t_tr/dt))
        u_1(3,:) = u_past;
     end
    if (tau == round(0.5*t_tr/dt))
        u_1(4,:) = u_past;
    end
    if (tau == round(0.75*t_tr/dt))
        u_1(5,:) = u_past;
    end
    if (tau == round(0.95*t_tr/dt))
        u_1(6,:) = u_past;
    end
     if (tau == round(1.10*t_tr/dt))
        u_1(7,:) = u_past;
     end
    if (tau == round(1.5*t_tr/dt))
        u_1(8,:) = u_past;
    end  
    
    x_2(tau,1) = u_past(round(0.2/dx));
end

figure % snapshots of wave for 8 different times
for i = 1:8
    subplot(4,2,i) 
    plotdisp(xloc,u_1(i,:),xmin,xmax,umin,umax) 
    title(['t =' num2str(t_save(i)) '*t_{r}']);
    set(gca,'FontSize',10)
end

figure % displacement of point at x = 0.2m
xmin = 0; xmax = (2*t_tr/dt)*dt; umin = -1.2*A; umax = 1.2*A;
plotdisp(dt*(1:(2*t_tr/dt)),x_2,xmin,xmax,umin,umax)
xlabel('t (s)');title('Disp of point at x=0.2');


