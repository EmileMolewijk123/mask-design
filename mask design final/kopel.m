function [uitwire] = kopel(begin,L,D,W,uitsteek,Wguide,rot)
    x = begin(1);
    y = begin(2);

    if rot == pi
        box(x+D/2-uitsteek/2, y, D+uitsteek, W, 0)
        beginuit = begin;
        beginuit(1) = x + D;
        uitloop(beginuit,L,W,Wguide,pi)
        xuit = x + D + L;
        uitwire = [xuit y];
    else 
        box(x-D/2+uitsteek/2, y, D+uitsteek, W, 0)
        beginuit = begin;
        beginuit(1) = x - D;
        uitloop(beginuit,L,W,Wguide,0)
        xuit = x - D - L;
        uitwire = [xuit y];
end