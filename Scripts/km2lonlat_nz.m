function [xr ,yr] = km2lonlat_nz(xx1,yy1,theta)

    if nargin < 3
        theta = 0 ;
    end

    x0 = 0;
    y0 = 0;

    x1 = cosd(theta)*xx1 + sind(theta)*yy1+x0;
    y1 = -sind(theta)*xx1 + cosd(theta)*yy1+y0;

    % origin for nz mesh file
    lon0 = 175.45;
    lat0 = -40.825;

    R=6371;
    dlat = km2deg(y1,R);
    lat = lat0+dlat;
    for i=1:length(lat)
    dlon1(i) = km2deg(x1(i),cos((lat(i)/180)*pi)*R );
    end
     xr = lon0+dlon1(:);
     yr = lat;
end
