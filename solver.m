function x = solver( A,b )
%This function solves the system of equations Ax = b for x.
%A is a square matrix
%b is a column vector
%x is the solution

%Use the backslash operator of Matlab to find the solution:
x = A\b;

end

