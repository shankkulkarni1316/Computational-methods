function[totalEnergy] = calculateEnergy(m,l,g,omega_n,theta_n)
   % This function returns total energy of pendulum.

   totalEnergy = (0.5*m*l*l*(omega_n)^2) +(m*g*l*(1-cos(theta_n)));
end