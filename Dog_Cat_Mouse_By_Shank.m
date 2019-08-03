% The DOG-CAT-MOUSE chase problem
% solution by Shank Kulkarni
% CME homework 4
% 09/23/2017

dt=0.01; % time step
t = 0:dt:5*pi;  % time

x_m0 = 0.277778*10/pi; y_m0 = 0; %m %Initial position of mouse
v_m = 0.277778*10; %m/s %Initial velocity of mouse
c_m = v_m/pi; %m

x_c0 = -10; y_c0 = 10; %m %Initial position of cat
v_c = 0.277778*12; %m/s %Initial velocity of cat

x_c_n = x_c0; x_c_n1 = 0;
y_c_n = y_c0; y_c_n1 = 0;

x_d0 = -20; y_d0 = 20; %m %Initial position of dog
v_d = 0.277778*20; %m/s %Initial velocity of dog

x_d_n = x_d0; x_d_n1 = 0;
y_d_n = y_d0; y_d_n1 = 0;

figure
T = size(t);
mousePos=zeros(T(2),2); catPos=zeros(T(2),2); dogPos=zeros(T(2),2);

for i = 1:T(2) % time increment loop
    %for mouse
    [x_m,y_m] = getmousePos(t(i),c_m);

    %for cat
    d_mc = calculateDistance(x_m,y_m,x_c_n,y_c_n);
    [x_c_n1,y_c_n1] = getcatPos(d_mc,v_c,dt,x_c_n,y_c_n,x_m,y_m);
    
    %for dog
    d_cd = calculateDistance(x_c_n,y_c_n,x_d_n,y_d_n);
    [x_d_n1,y_d_n1] = getdogPos(d_cd,v_d,dt,x_d_n,y_d_n,x_c_n,y_c_n);
 
    x_c_n = updateParameter(x_c_n1);
    y_c_n = updateParameter(y_c_n1);
    
    x_d_n = updateParameter(x_d_n1);
    y_d_n = updateParameter(y_d_n1);
    
    plotPos(x_m,y_m,x_c_n,y_c_n,x_d_n,y_d_n);
    
    % storing positions in 2D array
    mousePos(i,1) = x_m; mousePos(i,2) = y_m;
    catPos(i,1) = x_c_n; catPos(i,2) = y_c_n;
    dogPos(i,1) = x_d_n; dogPos(i,2) = y_d_n;
    
    % criteria for termination
    if(d_mc < 0.01) || (d_cd < 0.01)
        % ploting the path for dog, cat and mouse
        figure
        plotPath(mousePos((1:i),1),mousePos((1:i),2),catPos((1:i),1),catPos((1:i),2),dogPos((1:i),1),dogPos((1:i),2));
        return;
    end

end

