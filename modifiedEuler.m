function[omega_n1,theta_n1] = modifiedEuler(dt,g,l,omega_n,theta_n)
    % This function returns values of theta and omega using forward Euler 
    %  method.
    % _n1 represents value for next time step
    % _n  represents value for current time step

    omega_n1 = omega_n - dt*(g/l)*sin(theta_n);
    theta_n1 = theta_n + dt*omega_n1;

end