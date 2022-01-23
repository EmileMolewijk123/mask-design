function [rot,a,nodes] = getrot(L,W)
    rot = 0.5;
    len = 0;
    cros = 0;

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
wire(1, W ,nodes3)
end