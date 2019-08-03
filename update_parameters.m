function [u_past, u]=update_parameters(A,B)
% This function updates values of displacement for next time step as
% follows ----->   
% u^(n+1) becomes u^(n)
% u^(n) becomes u^(n-1)

    u_past = A;
    u = B;
end
