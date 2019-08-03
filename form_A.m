function [A] = form_A(r,z,k_tungsten,k_steel,beta_r2,beta_z2,C_r2,C_z1,C_z2,Interface_i)
% This function forms A matrix.
%                   
A = zeros(length(z)*length(r),length(r)*length(z));
for j = 1:length(z)-2
   for i = 1:length(r)-2
       PP = (length(r))*j+(i+1); 
       A(PP,PP) = 1 + (2*beta_r2) + (2*beta_z2);
       A(PP,PP-1) = -beta_r2 + (beta_r2/(2*i));
       A(PP,PP+1) = -beta_r2 - (beta_r2/(2*i));
       A(PP,PP-(length(r)-2)-2) = -beta_z2;
       A(PP,PP+(length(r)-2)+2) = -beta_z2;
   end
end

% Right boundary Convection
for j = 0:length(z)-1
    PP = (length(r))*j+(length(r)-1+1);
    A(PP,PP) = (1 + C_r2);
    A(PP,PP-1) = -1;
end
% Top boundary Convection
for i = 1:length(r)-2
    if (i == Interface_i)
        continue
    elseif (i < Interface_i)
        PP = (length(r))*(length(z)-1)+(i+1);
        A(PP,PP) = (1 + C_z1);
        A(PP,PP-(length(r)-2)-2) = -1;           
    else
        PP = (length(r))*(length(z)-1)+(i+1);
        A(PP,PP) = (1 + C_z2);
        A(PP,PP-(length(r)-2)-2) = -1;        
    end
end    
% Bottom boundary Insulation
for i = 1:length(r)-2
    if (i == Interface_i)
        continue
    else
        PP = (length(r))*0+(i+1);
        A(PP,PP) = 1;
        A(PP,PP+(length(r)-2)+2) = -1;
    end
end
% Left boundary Heat source
for j = 0:length(z)-1
    PP = (length(r))*j+(0+1);
    A(PP,PP) = 1;
end

% Interface Condition
for j = 0:length(z)-1
    PP = (length(r))*j+(Interface_i+1);
    A(PP,PP) = (k_tungsten + k_steel);
    A(PP,PP-1) = (-k_tungsten);
    A(PP,PP+1) = (-k_steel);  
end
end