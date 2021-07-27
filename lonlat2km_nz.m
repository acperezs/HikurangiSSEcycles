%%convert depth contours of McCrory 2006.
function [xr,yr] = lonlat2km_nz(lon,lat,theta)
% lon0 lat0 reference center
lon0 = 175.45;
lat0 = -40.825;

R = 6371/180*pi;
[arc,azi]=distance(lat0,lon0,lat,lon);
xaa=R*arc.*sin(azi/180*pi);
yaa=R*arc.*cos(azi/180*pi);
x=xaa;
y=yaa;

% rotation angle center
if nargin<3
    theta = 0;
end
x0 = 0;
y0 = 0;

x = x - x0;
y = y - y0;
xr = x*cosd(theta)+y*sind(theta);
yr = y*cosd(theta)-x*sind(theta);
clear x y x0 y0;
end