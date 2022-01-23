function [ins, outs] = inout3um(begin,H,W,uitsteek)    
    x = begin(1);
    y = begin(2);  

    begin(1) = begin(1) ;
    begin(2) = begin(1) + (H/2);

  
    %in
    t = y + H/2;
    ins = kopel([x t],333,133.2,69.66,uitsteek,3,pi);
    %out
    h =  x+W;
    outs = kopel([h t],333,133.2,69.66,uitsteek,3,0);
% 
%     ins = [0 y];
%     outs = [W y];
%     nodes = [ins;outs];
%     wire(1,1,nodes)

end