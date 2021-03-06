function [ residuals, bestM ] = calibrate( k, world, camera )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    residuals = [];
    bestM = zeros(4,3);
    for replicate = 1:10
        [world_train, camera_train, world_test, camera_test] = sample_points(world, camera, k);
        A = buildA(world_train, camera_train);
        [~, ~, V] = svd(A);
        M = reshape(V(:,end), 4, 3)';
        res = 0;
        for idx = 1:size(world_test, 1)
            point = world2camera(M, world_test(idx,:));
            [residual, ~] = sumsqr(point-camera_test(idx,:));
            res = res + sqrt(residual);
        end
        res = res/size(world_test,1); 
        residuals = [residuals, res];
        if res <= min(residuals)
            bestM = M;
        end
    end
end

