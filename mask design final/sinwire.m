function [nodes] = sinwire(in, out)

    xin = in(1);
    yin = in(2);
    xout = out(1);
    yout = out(2);

    W = xout - xin;
    H = yout - yin;

    x = linspace((-1/2)*pi,0.5*pi,100);
    xend = x/pi + 0.5;
    xend = xend * W;
    yend = (sin(x) + 1) * (H/2);

    nodes = [xend; yend]';
    nodes = nodes + in ;
    wire(1,1,nodes)
end