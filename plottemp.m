function plottemp( xloc, u, xmin,xmax,umin,umax ,j)
% This functions takes input arguments xloc and u and plots u vs x.
% xloc and u are column vectors of the same size.
% xmin, xmax are the min and max values for the x-scale
% umin, umax are the min and max values for the y-scale


%figure % j is used for legends
if (j==1)
    p=plot(xloc,u,'-o','DisplayName','n=4');
elseif (j==2)
    p=plot(xloc,u,'^-','DisplayName','n=10');
elseif (j==3)
    p=plot(xloc,u,'s:','DisplayName','n=50');
else
    p=plot(xloc,u);
end
title('Steady-State Temperature Distribution in the Bar 4th order');
xlabel('x (m)'), ylabel('Temperature (C)');
xlim([xmin,xmax]); ylim([umin,umax]);
set(gca,'FontSize',30)
set(gca,'fontname','times new roman')
legend('show','Location','southeast');
p(1).LineWidth = 2;
hold on; grid on
end

