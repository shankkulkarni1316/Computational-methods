function [] = plot_temp(r,z,T)
% This function plots temperatue in contour plots.
%                   
% # INPUT: [T], {r}, and {z}.
% # OUTPUT: plot
% 
figure
contourf(r,z,T,'ShowText','on');
colormap(jet)
xlabel('Radius r (m)')
ylabel('Height z (m)')
axis([0 0.13 0 1.2])
set(gca,'FontSize',30)
set(gca,'fontname','times new roman')
xticks([0 0.03 0.06 0.09 0.13])
xticklabels({'0.07','0.1','0.13','0.16','0.2'})
yticks([0 0.3 0.6 0.9 1.2])
yticklabels({'0','0.3','0.6','0.9','1.2'})
end