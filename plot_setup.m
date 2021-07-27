% Plot a-b, effective normal stress distribution and slip distribution on the fault

mesh = load('./meshHikurangi.gts');

nvex = mesh(1,1); ncell = mesh(1,3);
vertex = mesh(2:nvex+1,:);
cell =  mesh(2+nvex:1+nvex+ncell,:);

xc = (vertex(cell(:,1),1) + vertex(cell(:,2),1)+ vertex(cell(:,3),1))/(3*1000); % in km
yc = (vertex(cell(:,1),2) + vertex(cell(:,2),2)+ vertex(cell(:,3),2))/(3*1000);
zc = (vertex(cell(:,1),3) + vertex(cell(:,2),3)+ vertex(cell(:,3),3))/(3*1000);

[x,y] = km2lonlat_nz(xc,yc,30); % rotate geometry 30 degrees

setup = load('setup.dat');
xcoast = struct2array(load('xcoast.mat'));
ycoast = struct2array(load('ycoast.mat'));
[xCoast,yCoast] = lonlat2km_nz(xcoast,ycoast,-30);


% Model setup
ab = setup(:,4)*1e3; % (a - b) 
dc = setup(:,3); % critical slip distance of rate and state (in mm)
stress = setup(:,2)/10; % effective normal stress (in MPa)
depth = setup(:,1); % in km

% Slip distribution
slip = load('./cumulativeSlip.txt'); % from 55 to 75 yrs (Figure 7a)
slip = slip*100; % in centimeters

%% Plot

figure;
set( gcf, 'Color', 'white' );
set(gcf, 'Position', [0 0 450 550])
set(gca,'TickDir','out');
hold on;
box on;
set(gca,'xlim',[-25 200],'ylim',[0 500],'fontsize',12);
scatter(xc(:,1),yc(:,1),10,ab(:),'filled'); 
colormap('parula');
plot(xCoast,yCoast, 'k', 'LineWidth', 1.5);
xlabel('longitude ( ˚ )');
ylabel('latitude ( ˚ )');

ax = gca; ax.FontSize = 15;
cl = colorbar ;
cl.Label.String = '(a-b) x 10^{-3}' ;


figure;
set( gcf, 'Color', 'white' );
set(gcf, 'Position', [0 0 550 550])
set(gca,'TickDir','out');
hold on;
box on;
set(gca,'xlim',[175 180],'ylim',[-42 -37],'fontsize',12);
scatter(x(:,1),y(:,1),10,slip(:),'filled'); 
colormap('parula');
plot(xcoast,ycoast, 'k', 'LineWidth', 1.5);
xlabel('longitude ( ˚ )');
ylabel('latitude ( ˚ )');

ax = gca; ax.FontSize = 15;
cl = colorbar ;
cl.Label.String = 'Slip (cm)' ;


