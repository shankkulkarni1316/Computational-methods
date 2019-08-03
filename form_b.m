function [b] = form_b(b,r,z,T_amb,T_0,T_f,beta,C_r2,C_z1,C_z2,Interface_i,dt,n)
% This function forms b matrix.

%b = zeros(length(z)*length(r),1);
 
%b(1:(length(z)*length(r)),1) = T_0;
    % Right boundary Convection
    for j = 0:length(z)-1
        PP = (length(r))*j+(length(r)-1+1);
        b(PP,1) = C_r2*T_amb;
    end
    % Top boundary Convection
    for i = 1:length(r)-2
        if (i == Interface_i)
            continue
        elseif (i < Interface_i)
            PP = (length(r))*(length(z)-1)+(i+1);
            b(PP,1) = C_z1*T_amb;            
        else
            PP = (length(r))*(length(z)-1)+(i+1);
            b(PP,1) = C_z2*T_amb;
        end
    end

    % Bottom boundary Insulation
    for i = 1:length(r)-2
        if (i == Interface_i)
            continue
        else
            PP = (length(r))*0+(i+1);
            b(PP,1) = 0;
        end
    end
    % Interface Condition
    for j = 0:length(z)-1
        PP = (length(r))*j+(Interface_i+1);
        b(PP,1) = 0;
    end
    % Left boundary Heat source
    for j = 0:length(z)-1
        PP = (length(r))*j+(0+1);
        b(PP,1) = T_0 + ((T_f - T_0)*(1-(exp(-beta*n*dt))));
    end
end