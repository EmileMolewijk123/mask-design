function [in,uit] = spiraal(begin,L,W)
    rot = 0.5;
    len = 0;
    cros = 0;
    x = begin(1);
    y = begin(2);
    % lengte minder dan 4500 um
    while len < 4500
        a = 1;
        rot =  rot + 1;
        %% calculate nodes
        angle = linspace(0,rot*pi,1000);
        anglemin = linspace(0,rot*pi,1000);
         
        r = a*sqrt(angle);
        rmin = -a*sqrt(anglemin) ;
        nodes = [r.*cos(angle); r.*sin(angle)]';
        nodesmin = [rmin.*cos(angle); rmin.*sin(angle)]';

        %% fit to  manbrane
        % get cros 
        y2min=nodesmin(length(r),:);
        y2=nodes(length(r),:);
        cros = abs(y2min(2)) + abs(y2(2));
        a =  L/cros;

        % recalculate nodes to fit L
        r = a*sqrt(angle);
        rmin = -a*sqrt(anglemin) ;
        nodes = [r.*cos(angle); r.*sin(angle)]';
        nodesmin = [rmin.*cos(angle); rmin.*sin(angle)]';

        y2min=nodesmin(length(r),:);
        y2=nodes(length(r),:);
        cros = abs(y2min(2)) + abs(y2(2));

        %% calculate lengte 
        len = 0;
        for p = 1:(length(r)-1)
            x1=nodes(p,:);
            x2=nodes((p+1),:);
            y1=nodes(p,:);
            y2=nodes((p+1),:);
            D = sqrt(((x1(1)-x2(1))^2)+((y1(2)-y2(2))^2));
    
            x1min=nodesmin(p,:);
            x2min=nodesmin((p+1),:);
            y1min=nodesmin(p,:);
            y2min=nodesmin((p+1),:);

            Dmin = sqrt(((x1min(1)-x2min(1))^2)+((y1min(2)-y2min(2))^2));
            len = len + D + Dmin; 
        end
    end

nodes3 = [flip(nodesmin); nodes];
nodes3 = nodes3 + begin;
wire(1, W ,nodes3)

%%uitkopeling
radius = 50;
beginpunt = nodes3((length(r)*2),:);
eindpunt = nodes3((1),:);
beginpunt2 = beginpunt;
beginpunt2(1) = beginpunt2(1) - L/2 -10;
nodesuit = [beginpunt;beginpunt2];
wire(1,W,nodesuit)

beginpunt2(2) = beginpunt2(2) - radius;
%wire van boven naar links en naar beneden
% en wire van beneden naar de zijkant 
%quart circle
angle = linspace(0.5*pi,pi,1000);
nodeshalf = [radius.*cos(angle); radius.*sin(angle)]';
nodeshalf = nodeshalf + beginpunt2;
wire(1,W,nodeshalf)

%wire down
beginpunt2(1) = beginpunt2(1)-radius;

beginpunt3 = beginpunt2;
beginpunt3(2) =beginpunt3(2) - (L-2*radius);
nodesuit2 = [beginpunt2;beginpunt3];
wire(1,W,nodesuit2)

angle = linspace(-0.5*pi,0,1000);
nodeshalf = [radius.*cos(angle); radius.*sin(angle)]';
beginpunt3(1) = beginpunt3(1) -radius;
nodeshalf = nodeshalf + beginpunt3;
wire(1,W,nodeshalf)
% eind punt weg 


eindpunt2 =eindpunt;
eindpunt2(1) = eindpunt2(1) + L/2 +10;
nodesuit2 = [eindpunt;eindpunt2];
wire(1,W,nodesuit2)
beginpunt4 = eindpunt2 ;
beginpunt4(1) = beginpunt4(1)- L - 120;
inuit = [beginpunt4 eindpunt2];
in = beginpunt4;
uit = eindpunt2;
end


