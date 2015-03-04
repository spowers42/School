function camera = world2camera( M, world )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    world = [world, 1];
    tmp = num2cell(M * world');
    [u_s, v_s, s] = tmp{:};
    camera = [u_s/s, v_s/s];
end

