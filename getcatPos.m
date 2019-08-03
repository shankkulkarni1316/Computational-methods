function[x_c,y_c] = getcatPos(d_mc,v_c,dt,x_c_n,y_c_n,x_m,y_m)
% This function returns position of cat.

    
    x_c = x_c_n + dt*((v_c*(x_m-x_c_n))/(d_mc));
    y_c = y_c_n + dt*((v_c*(y_m-y_c_n))/(d_mc));

end