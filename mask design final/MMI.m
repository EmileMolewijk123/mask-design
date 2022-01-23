function [xyin, xyuitplus,xyuitmin] = MMI(begin,L,L1,W,W1,Wuit,Wguide, rot)
    x = begin(1);
    y = begin(2);

     if rot == pi
      %fiber naar MMI
        uitloop(begin,L1,Wguide,Wuit,0)
        %MMI body
        box(x-L1-L/2, y, L, W, 0)
        %MMI uotput locatie 
        beginuit1 = begin;
        beginuit2 = begin;
        % x cordinaat
        beginuit1(1) = x-2*L1-L;
        beginuit2(1) = x-2*L1-L;
        % y cordinaar
        beginuit1(2) = y + W1;
        beginuit2(2) = y - W1;
        %MMI uotput
        uitloop(beginuit1 ,L1,Wguide,Wuit,pi)
        uitloop(beginuit2  ,L1,Wguide,Wuit,pi)
        xyin = begin;
        xyuitplus = beginuit1;
        xyuitmin = beginuit2;
    else
        %fiber naar MMI
        uitloop(begin,L1,Wguide,Wuit,pi)
        %MMI body
        box(x+L1+L/2, y, L, W, 0)
        %MMI uotput locatie 
        beginuit1 = begin;
        beginuit2 = begin;
        % x cordinaat
        beginuit1(1) = x+2*L1+L;
        beginuit2(1) = x+2*L1+L;
        % y cordinaar
        beginuit1(2) = y + W1;
        beginuit2(2) = y - W1;
        %MMI uotput
        uitloop(beginuit1 ,L1,Wguide,Wuit,0)
        uitloop(beginuit2 ,L1,Wguide,Wuit,0)
        xyin = begin;
        xyuitplus = beginuit1;
        xyuitmin = beginuit2;
end