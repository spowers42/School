function A = buildA(world, scene)
    A = [];
    for idx = 1:size(world, 1)
        tmp = num2cell(scene(idx, :));
        [u v] = tmp{:};
        z = zeros(1,size(world,2)+1);
        A = [A; [world(idx, :), 1, z, world(idx, :).*-u, -u]];
        A = [A; [z, world(idx, :), 1, world(idx, :).*-v, -v]];
    end
end
