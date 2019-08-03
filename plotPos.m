function plotPos(x_m,y_m,x_c_n,y_c_n,x_d_n,y_d_n)
% This function plots current position of mouse, cat and dog.

   p=plot(x_m,y_m,'o',x_c_n,y_c_n,'*',x_d_n,y_d_n,'+');
   title('Mouse-Cat-Dog problem');
   xlabel('x (m)'), ylabel('y (m)');    
   xlim([-22,22]); ylim([-22,22]);
   
   set(p,{'markers'},{12;12;12})
   set(gca,'fontname','times new roman')
   p(1).LineWidth = 2;p(2).LineWidth = 2;p(3).LineWidth = 2;
   %grid on
   txt1 = '\leftarrow Mouse';
   text(x_m,y_m,txt1);
   txt2 = '\leftarrow Cat';
   text(x_c_n,y_c_n,txt2);
   txt3 = '\leftarrow Dog';
   text(x_d_n,y_d_n,txt3);   
   set(gca,'FontSize',30)
   set(gcf, 'Position', get(0, 'Screensize')); % to make window full screen
   pause(0.01)
end