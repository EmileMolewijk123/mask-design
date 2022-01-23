function [nodes] = uitloop(begin,L,W1,W2,rot)
    x = begin(1);
    y = begin(2);
    nodes = [W1/2 0;W2/2 L;-W2/2 L;-W1/2 0];
    rotangle= 0.5*pi + rot;
    T=[cos(rotangle) -sin(rotangle); sin(rotangle) cos(rotangle)];
    %  Transform the nodes and generate the polygon
    nodes = (T*nodes')';
    nodes = nodes+[x y];
    polygon(nodes);
end
