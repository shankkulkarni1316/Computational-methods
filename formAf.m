function [A,F] = formAf( I,dx,xloc,conductivity,Length,u0,uL)
% This functions calculates the coefficient matrix A and the rhs vector F.
% I = total no. of points - 1
% dx = mesh spacing
% xloc = a vector of size I+1 holding mesh point coordinates
% conductivity = thermal conductivity (scalar)
% Length = length of the bar
% u0 = prescribed temperature at x=0
% uL = prescribed temperature at x=L

%derivation attached in homework
A = zeros(I+1,I+1);
for i=3:I-1 %1st two and last two nodes removed
    A(i,i) = -30.0;
    A(i,i-1) = 16.0;
    A(i,i+1) = 16.0;
    A(i,i-2) = -1.0;
    A(i,i+2) = -1.0;    
end

%for 2nd node
A(2,1) = 10.0;
A(2,2) = -15.0;
A(2,3) = -4.0;
A(2,4) = 14.0;
A(2,5) = -6.0; 
A(2,6) = 1.0;
 
%for second last node
A(I,I-4) = 1.0;
A(I,I-3) = -6.0;
A(I,I-2) = 14.0;
A(I,I-1) = -4.0;
A(I,I) = -15.0;
A(I,I+1) = 10.0; 

A(1,1) = 1.0;
A(I+1,I+1)= 1.0;

% Form the vector F:
F = zeros(I+1,1);
for i=2:I % this can be done more "efficiently" without for loop. 
    F(i) = -(heatsource(Length,xloc(i)))*12*dx^2/conductivity;
end
F(1) =  u0;
F(I+1) = uL;
end

