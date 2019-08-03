function [u] = SOR_method(A,b,u_0,tol)
% This function solves system of linear equations mentinoned below.
%                   [A]{u}={b}
% # INPUT: [A], {b}, initial guess {u_0} and tolerance tol.
% # OUTPUT: {u}
% 
% Stopping criterian:
%                    When 2 norm of residue vector is less than specified 
%                    Tolerence.  (||{b}-[A]{u}|| < Tolerance) 

N1 = length(b);
u = u_0;
u_1 = zeros(N1,1);
alpha=1.05;
for kth_iteration = 1:4000
    for i = 1:N1
        temp1 = 0;
        temp2 = 0;
        for j = 1:N1
            if (j < i)
                temp1 = temp1 + A(i,j)*u_1(j,1);
            else
                temp2 = temp2 + A(i,j)*u(j,1);
            end
        end
        u_1(i,1) = (u(i,1))+alpha*((1/A(i,i))*(b(i,1)-(temp1+temp2)));
    end
    residue = b - (A*u_1);
    u = u_1;
    if (norm(residue) < tol)
        break
    end
end
end