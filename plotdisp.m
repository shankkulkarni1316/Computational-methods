function plotdisp(xloc,u,xmin,xmax,umin,umax)
% This functions takes input arguments xloc and u and plots u vs x.
% xloc and u are column vectors of the same size.
% xmin, xmax are the min and max values for the x-scale
% umin, umax are the min and max values for the y-scale
p=plot(xloc,u);

xlim([xmin,xmax]); ylim([umin,umax]);
set(gca,'FontSize',30)
set(gca,'fontname','times new roman')
p(1).LineWidth = 2;
grid on
end

