function plotTheta(t,theta)
% This function plots Total Energy of pendulum.
   figure
   p=plot(t,theta);
   title('theta vs. time');
   xlabel('t (s)'), ylabel('\theta (rad)');    
   %xlim([-22,22]); ylim([-22,22]);

   set(gca,'fontname','times new roman')
   p(1).LineWidth = 2;
   grid on
   set(gca,'FontSize',30)
   set(gcf, 'Position', get(0, 'Screensize')); % to make window full screen
end