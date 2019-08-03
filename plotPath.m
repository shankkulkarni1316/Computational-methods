function plotPath(x_m,y_m,x_c_n,y_c_n,x_d_n,y_d_n)
% This function plots final path of mouse, cat and dog.

   p=plot(x_m,y_m,'-.','DisplayName','Mouse'); hold on;
   p1=plot(x_c_n,y_c_n,'b','DisplayName','Cat'); hold on;
   p2=plot(x_d_n,y_d_n,'--','DisplayName','Dog');   
   title('Mouse-Cat-Dog final path');
   xlabel('x (m)'), ylabel('y (m)');    
   xlim([-22,22]); ylim([-22,22]);
   set(gca,'FontSize',30)
   %set(p,{'markers'},{12;12;12})
   set(gca,'fontname','times new roman')
   p(1).LineWidth = 1;p1(1).LineWidth = 2;p2(1).LineWidth = 3;
   grid on
   legend('show','Location','southeast');
   %hold on
   %pause(0.000005)
   set(gcf, 'Position', get(0, 'Screensize')); % to make window full screen
end