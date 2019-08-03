function xloc = mesh( dx, I )
% This function generates the mesh points for the one-d heat conduction
% problem. 
% dx = mesh spacing (assumed uniform) and a scalar
% I = total number of points - 1
% xloc = coordinates of the mesh points (vector of length I+1)

xloc = zeros(I+1,1);
for i=1:I+1
    xloc(i) = (i-1)*dx;
end;

end

