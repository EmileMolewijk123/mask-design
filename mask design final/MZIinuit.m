function [nodes] = MZIinuit(begin,L,W)
    
    W =W-L;
    begin(1) = begin(1) + (L/2);
    begin(2) = begin(1) + (W/2);
    x = begin(1);
    y = begin(2);

    [in1,uit1] = spiraal([x,120.50+y],121,0.45);
    [in2,uit2] = spiraalinv([-x,120.50-y],121,0.45);
    
    MMI([300+x y],31.8,20,6,1.51,1.50,0.45, pi)
    MMI([-300+x y],31.8,20,6,1.51,1.50,0.45, 0)
    %in 1 to MMI 
    radius = (in1(2) - (y+1.51))/2;
    angle = linspace(pi,0.5*pi,1000);
    nodeshalf = [radius.*cos(angle); radius.*sin(angle)]';
    in1(2) = in1(2) -radius;
    nodeshalf = nodeshalf + in1;
    wire(1,0.45,nodeshalf)

    angle = linspace(0,-0.5*pi,1000);
    nodeshalf = [radius.*cos(angle); radius.*sin(angle)]';
    in1(2) = in1(2) ;
    in1(1) = in1(1) - 2*radius;
    nodeshalf = nodeshalf + in1;
    wire(1,0.45,nodeshalf)
    
    in1(2) = in1(2) - radius;

   
    beginMMI = begin;
    beginMMI(2) = beginMMI(2) +1.51;
    beginMMI(1) = beginMMI(1) -300 + 40 + 31.8;
    beginMMImin = begin;
    beginMMImin(2) = beginMMImin(2) - 1.51;
    beginMMImin(1) = beginMMImin(1) - 300 + 40 + 31.8;
    
    beginMMI2 = begin;
    beginMMI2(2) = beginMMI2(2) +1.51;
    beginMMI2(1) = beginMMI2(1) +300 - 40 - 31.8;
    beginMMI2min = begin;
    beginMMI2min(2) = beginMMI2min(2) - 1.51;
    beginMMI2min(1) = beginMMI2min(1) + 300 - 40 - 31.8;

    nodesuit2 = [beginMMI;in1];
    wire(1,0.45,nodesuit2)
    
    %in 2 to MMI2 

    angle = linspace(-0.5*pi,0,1000);
    nodeshalf = [radius.*cos(angle); radius.*sin(angle)]';
    in2(2) = in2(2) + radius;
    nodeshalf = nodeshalf + in2;
    wire(1,0.45,nodeshalf)

    angle = linspace(pi,0.5*pi,1000);
    nodeshalf = [radius.*cos(angle); radius.*sin(angle)]';
    in2(2) = in2(2) ;
    in2(1) = in2(1) + 2*radius;
    nodeshalf = nodeshalf + in2;
    wire(1,0.45,nodeshalf)
    
    in2(2) = in2(2) + radius;
    nodesuit2 = [beginMMI2min;in2];
    wire(1,0.45,nodesuit2)

    % uit2 MMI2
    angle = linspace(0.5*pi,0,1000);
    nodeshalf = [radius.*cos(angle); radius.*sin(angle)]';
    uit1(2) = uit1(2) - radius;
    nodeshalf = nodeshalf + uit1;
    wire(1,0.45,nodeshalf)

    angle = linspace(-1*pi,-0.5*pi,1000);
    nodeshalf = [radius.*cos(angle); radius.*sin(angle)]';
    uit1(2) = uit1(2) ;
    uit1(1) = uit1(1) + 2*radius;
    nodeshalf = nodeshalf + uit1;
    wire(1,0.45,nodeshalf)
    
    uit1(2) = uit1(2) - radius;
    nodesuit2 = [beginMMI2;uit1];
    wire(1,0.45,nodesuit2)

    % UIt2 to MMI min

    angle = linspace(-1*pi,-0.5*pi,1000);
    nodeshalf = [radius.*cos(angle); radius.*sin(angle)]';
    uit2(2) = uit2(2) + radius;
    nodeshalf = nodeshalf + uit2;
    wire(1,0.45,nodeshalf)

    angle = linspace(0.5*pi,0,1000);
    nodeshalf = [radius.*cos(angle); radius.*sin(angle)]';
    uit2(2) = uit2(2) ;
    uit2(1) = uit2(1) -  2*radius;
    nodeshalf = nodeshalf + uit2;
    wire(1,0.45,nodeshalf)
    
    uit2(2) = uit2(2) + radius;
    nodesuit2 = [beginMMImin;uit2];
    wire(1,0.45,nodesuit2)


    kopel([0 y],50,20,10.45,0.45,pi)
    kopel([L y],50,20,10.45,0.45,0)




end
