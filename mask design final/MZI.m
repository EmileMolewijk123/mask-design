function [uit, in,xyspiraal,xyinvspiraal] = MZI(begin)
    x = begin(1);
    y = begin(2);
    dim = 268.8;
    ofset = dim/2 + 50;
    [in1,uit1] = spiraal([x,ofset+y],dim,1);
    [in2,uit2] = spiraalinv([-x,ofset-y],dim,1);
    xyspiraal = [x,ofset+y];
    xyinvspiraal = [x,y-ofset];

    [uit,xyuitplusrechts,xyuitminrechts ] = MMI([500+x y],31.8,20,6,1.51,1.5,1, pi);
    [in, xyuitpluslinks,xyuitminlinks] = MMI([-500+x y],31.8,20,6,1.51,1.5,1, 0);

     sinwire(in1,xyuitpluslinks)
     sinwire(uit1,xyuitplusrechts)
     sinwire(in2,xyuitminrechts)
     sinwire(uit2,xyuitminlinks)


end
