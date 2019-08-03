function [] = plot_flux(r,z,flux_r,flux_z)
% This function plots flux.
%                   
% # INPUT: {r}, {z}, [flux_r], and [flux_z].
% # OUTPUT: plot
% 
figure
quiver(r,z,flux_r,flux_z)
%colormap(jet)
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