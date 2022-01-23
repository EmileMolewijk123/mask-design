function [uit, in,xyspiraal,xyinvspiraal] = MZI3um(begin)
    x = begin(1);
    y = begin(2);
    dim = 268.8;
    ofset = dim/2 + 50;
    [in1,uit1] = spiraal([x,ofset+y],dim,3);
    [in2,uit2] = spiraalinv([-x,ofset-y],dim,3);
    xyspiraal = [x,ofset+y];
    xyinvspiraal = [x,y-ofset];

    [uit,xyuitplusrechts,xyuitminrechts ] = MMI([600+x y],71.4,20,9.1,2.325,4,3, pi);
    [in, xyuitpluslinks,xyuitminlinks] = MMI([-600+x y],71.4,20,9.1,2.325,4,3,0);
     sinwire3um(in1,xyuitpluslinks)
     sinwire3um(uit1,xyuitplusrechts)
     sinwire3um(in2,xyuitminrechts)
     sinwire3um(uit2,xyuitminlinks)


end