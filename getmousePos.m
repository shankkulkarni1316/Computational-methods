function[x_m,y_m] = getmousePos(t,c_m)
% This function returns position of mouse.

x_m = c_m*cos(pi*t);
y_m = c_m*sin(pi*t);
end