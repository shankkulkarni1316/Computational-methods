function x = solver(n,u_past,u,alpha)

x = zeros(n+1,1);
    for i=2:n %1st and last nodes removed
        x(i) = -u_past(i) + (alpha^2)*u(i+1) - 2*(alpha^2)*u(i) + (alpha^2)*u(i-1) + 2*u(i);
    end
end

