
data = load('./sliprate_along_strike.txt'); % in log10 V/Vpl_ref scale at 10 km depth
time = data(:,1);
y = data(:,2);
sliprate = data(:,3);

%%
yq = linspace(0,500,2500);
tq = linspace(time(1),time(end), 2500);
 
[Tq, Yq] = meshgrid(tq,yq);
vq = griddata(time(:), y(:), sliprate(:), Tq, Yq);
%%

levels = 0.5:0.5:2.5; % for V > 10^0.5 Vpl_ref ~3 Vpl_ref

figure;
set(gcf,'color','w');
contourf(Tq, Yq, vq, levels,'-', 'LineColor', 'none', 'ShowText', 'off')
colormap(hot);
cl = colorbar;
cl.Label.String = 'log_1_0 ( V / Vpl_{ref} )';
ylabel('Y (km)'); xlabel('Time (years)');
ax = gca; ax.FontSize = 14;