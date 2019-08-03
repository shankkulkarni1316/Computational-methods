function[x_d,y_d] = getdogPos(d_cd,v_d,dt,x_d_n,y_d_n,x_c_n,y_c_n)
% This function returns position of dog.

    
    x_d = x_d_n + dt*((v_d*(x_c_n-x_d_n))/(d_cd));
    y_d = y_d_n + dt*((v_d*(y_c_n-y_d_n))/(d_cd));

end