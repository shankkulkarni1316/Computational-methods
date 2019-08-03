function [flux_r,flux_z] = calculate_flux(T,r,z,k_tungsten,k_steel,dr,dz,lambda,T_amb,Interface_i)
% This function saves results.
%                   
% # INPUT: [T].
% 
        for j = 1:length(z)
            for i = 1:length(r)-1
                if (i < Interface_i)
                    flux_r(j,i) = k_tungsten*(-(T(j,i+1)-T(j,i))/(dr));
                else
                    flux_r(j,i) = k_steel*(-(T(j,i+1)-T(j,i))/(dr));
                end
            end
            flux_r(j,length(r)) = lambda*(T(j,length(r))-T_amb);
        end
        
        for j = 1:length(z)-1
            for i = 1:length(r)
                if (i < Interface_i)
                    flux_z(j,i) = k_tungsten*(-(T(j+1,i)-T(j,i))/(dz));
                else
                    flux_z(j,i) = k_steel*(-(T(j+1,i)-T(j,i))/(dz));
                end
            end
        end  
        for i = 1:length(r)
            flux_z(length(z),i) = lambda*(T(length(z),i)-T_amb);
        end

end