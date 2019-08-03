% Mid term pendulum problem
% solution by Shank Kulkarni
% 10/20/2017

m = 1; % mass (kg)
l = 2; % lenght of rod (m)
g = 9.81; % (m/s^2)
T = 2*pi*sqrt(l/g);  % time period of pendulum
dt=0.0001; % time step
t = 0:dt:20*T;  % time (upto 20 times time period)

%Initial conditions
omega_0 = 0; %(rad/s)
theta_0 = 0.2; %(rad)

temp1 = size(t);
omega = zeros(temp1(2),1); % initializing all parameters
theta = zeros(temp1(2),1);
totalEnergy_forwardEuler = zeros(temp1(2),1);
totalEnergy_modifiedEuler = zeros(temp1(2),1);

omega(1,1) = omega_0; % calculation for 1st step is done outside loop separately
theta(1,1) = theta_0;
totalEnergy_forwardEuler(1,1) = calculateEnergy(m,l,g,omega(1,1),theta(1,1));
totalEnergy_modifiedEuler(1,1) = calculateEnergy(m,l,g,omega(1,1),theta(1,1));
for i = 2:temp1(2) % time increment loop
    %using Forward Euler Method
    [omega(i,1),theta(i,1)] = forwardEuler(dt,g,l,omega(i-1,1),theta(i-1,1));
    
    totalEnergy_forwardEuler(i,1) = calculateEnergy(m,l,g,omega(i-1,1),theta(i-1,1));

end
figure; plotEnergy(t,totalEnergy_forwardEuler);
title('total energy of pendulum vs. time (Forward Euler)');
plotTheta(t,theta);
title('theta vs. time (Forward Euler)');

for i = 2:temp1(2) % time increment loop
    %using Modified Euler Method
    [omega(i,1),theta(i,1)] = modifiedEuler(dt,g,l,omega(i-1,1),theta(i-1,1));
    totalEnergy_modifiedEuler(i,1) = calculateEnergy(m,l,g,omega(i-1,1),theta(i-1,1));
   
end
figure; plotEnergy(t,totalEnergy_modifiedEuler)
title('total energy of pendulum vs. time (Modified Euler)');
plotTheta(t,theta);
title('theta vs. time (Modified Euler)');

% ploting both energies together for comparison
figure
plotEnergy(t,totalEnergy_modifiedEuler);hold on;
plotEnergy(t,totalEnergy_forwardEuler);
legend('Modified Euler', 'Forward Euler');
legend('show','Location','northwest');

% REMOVE THE FOLLOWING COMMENT BOX FOR ANIMATION OF PENDULUM
%{
close(1);close(2);close(3);close(4);close(5); close;
figure
for i = 2:temp1(2) % time increment loop
    %using Modified Euler Method
    [omega(i,1),theta(i,1)] = modifiedEuler(dt,g,l,omega(i-1,1),theta(i-1,1));
    pendulum_animation = [0,(theta(i,1)+(3*pi/2))]; length_pendulum = [0,l];
    p1=polarplot(pendulum_animation,length_pendulum,'-o','MarkerSize', 12);
    p1(1).LineWidth = 3;
    pause(0.0005)
    
end
%}
