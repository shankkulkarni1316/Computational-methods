%#########################################################################
%#########################################################################
%              COMPUTATIONAL METHODS
%                PROJECT                            @Shank, Raja, Pavitra 
%                                                   Date-18 nov 2017
%#########################################################################
%#########################################################################

clear all
format long e
%Material parameters for steel
k_steel = 45; %W/mK
rho_steel = 7800; %kg/m3
cp_steel = 450; %J/kg-K
D_steel = k_steel/(rho_steel*cp_steel);

%Material parameters for tungsten
k_tungsten = 110; %W/mK
rho_tungsten = 15800; %kg/m3
cp_tungsten = 250; %J/kg-K
D_tungsten = k_tungsten/(rho_tungsten*cp_tungsten);

T_amb = 30+273; %K %ambiant temp
lambda = 200; % W/m2-K

T_0 = 20+273; %Initial temp of body
T_f = 300+273;
beta = 10; %/s

R = 0.13; Z = 1.2;
dr = 0.005/2; dz = 0.05/2; %Mesh size
r = 0:dr:R; z = 0:dz:Z;

Interface_i = (0.01/dr)+1; % Finding value of i for interface

T = zeros(int16(Z/dz)+1,int16(R/dr)+1);

dt=0.1;  % Time step

% All parameters in discritized equation
beta_r1 = (D_tungsten*dt)/(dr*dr); beta_z1 = (D_tungsten*dt)/(dz*dz); 
C_r1 = (dr*lambda)/(k_tungsten); C_z1 = (dz*lambda)/(k_tungsten);

beta_r2 = (D_steel*dt)/(dr*dr); beta_z2 = (D_steel*dt)/(dz*dz); 
C_r2 = (dr*lambda)/(k_steel); C_z2 = (dz*lambda)/(k_steel);

b = zeros(length(z)*length(r),1); % Initialize b vector 
b(1:(length(z)*length(r)),1) = T_0;
   
tol = 0.01; % Tolerence value for SOR

tic; % for time measurement
% Call for function forming A matrix
[A] = form_A(r,z,k_tungsten,k_steel,beta_r2,beta_z2,C_r2,C_z1,C_z2,Interface_i);
for n = 1:(10/dt)
    % Call for function forming b vector
    [b] = form_b(b,r,z,T_amb,T_0,T_f,beta,C_r2,C_z1,C_z2,Interface_i,dt,n);
    u_0 = b;

    % Call for SOR solver 
    u = SOR_method(A,b,u_0,tol);

    %Reverse mapping 
    P = 1;
    for j = 1:length(z)
        for i = 1:length(r)
            T(j,i) = u(P,1);
            P = P + 1;
        end
    end    
    %contour(r,z,T,'ShowText','on');
    %pause(0.005);
    %display(n);
    b = u;
    u_0 = u;
    
    % Saving the results for specific times
    if (n == (0.01/dt))
        Temp_1 = T;
        plot_temp(r,z,Temp_1)
        % Calculation of flux
        [flux_r1,flux_z1] = calculate_flux(Temp_1,r,z,k_tungsten,k_steel,dr,dz,lambda,T_amb,Interface_i);
        plot_flux(r,z,flux_r1,flux_z1)
    end
    
    if (n == (1/dt))
        Temp_2 = T;
        plot_temp(r,z,Temp_2)
        % Calculation of flux
        [flux_r2,flux_z2] = calculate_flux(Temp_2,r,z,k_tungsten,k_steel,dr,dz,lambda,T_amb,Interface_i);
        plot_flux(r,z,flux_r2,flux_z2)      
    end
    if (n == (2/dt))
        Temp_3 = T;
        plot_temp(r,z,Temp_3)
        % Calculation of flux
        [flux_r3,flux_z3] = calculate_flux(Temp_3,r,z,k_tungsten,k_steel,dr,dz,lambda,T_amb,Interface_i);
        plot_flux(r,z,flux_r3,flux_z3)       
        
    end 
    if (n == (10/dt))
        Temp_4 = T;
        plot_temp(r,z,Temp_4)
        % Calculation of flux
        [flux_r4,flux_z4] = calculate_flux(Temp_4,r,z,k_tungsten,k_steel,dr,dz,lambda,T_amb,Interface_i);
        plot_flux(r,z,flux_r4,flux_z4)       
        
    end 
   
end
run_time = toc; % end time

% Same problem was solved using explicite method for check
%{
for l = 1:10
    % left BC
    T(:,1) = T_0 + (T_f-T_0)*(1-(exp(-beta*l*dt)));
    T_n1(:,1) = T(:,1);
    
    % right boundary
    T(:,length(r)) = ((T(:,length(r)-1))+(((dr*lambda)/(k))*(T_amb)))/(1+((dr*lambda)/(k)));
    
    % top boundary
    T(length(z),:) = ((T(length(z)-1,:))+(((dz*lambda)/(k))*(T_amb)))/(1+((dz*lambda)/(k)));
    
    % bottom boundary
    T(1,:) = T(2,:);
    
for i = 2: length(z)-1
    for j = 2: length(r)-1
        T_n1(i,j) =  (D*dt*((((T(i,j+1))-(2*(T(i,j)))+(T(i,j-1)))/(dr*dr))+(((T(i,j+1))-(T(i,j-1)))/(2*dr*dr*j))+(((T(i+1,j))-(2*(T(i,j)))+(T(i-1,j)))/(dz*dz)))) + T(i,j);
    end
end
T = T_n1;
contour(r,z,T,'ShowText','on');
pause(0.005)
end
%} 

