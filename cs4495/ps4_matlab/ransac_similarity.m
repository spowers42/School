function [ f1, f2, bestSet, bestTransform ] = ransac_similarity( f1, f2, matches )
%RANSAC_TRANSLATION Summary of this function goes here
%   Detailed explanation goes here
    N = 50;
    bestSet = [];
    bestTransform = [];
    threshold = 20;
    %for each iteration till N
    for itr=1:N
        % pick 2 matches
        pair_indices = randsample(size(matches,2), 2);
        % build A and B matrix from matches
        p1_idx = matches(:, pair_indices(1));
        p2_idx = matches(:, pair_indices(2)); 
        u = f1(p1_idx(1), 1);
        v = f1(p1_idx(1), 2);
        x = f1(p2_idx(1), 1);
        y = f1(p2_idx(1), 2);
        up = f2(p1_idx(2), 1);
        vp = f2(p1_idx(2), 2);
        xp = f2(p2_idx(2), 1);
        yp = f2(p2_idx(2), 2);
        
        A = [u -v 1 0; v u 0 1; x -y 1 0; y x 0 1];
        B = [up; vp; xp; yp];
        % solve x using x=A\B;
        x = A\B;
        M = [x(1) -x(2) x(3); x(2) x(1) x(4)];
        % test:
        %   for each match
        %     x*[u;v;1] to get points in right image
        %     find distance to match in the right
        %     add to current set if within threshold distance
        currentSet = [];
        for idx = 1:size(matches,2)
            p1 = [f1(matches(1, idx), 1:2)'; 1];
            p2 = f2(matches(2, idx), 1:2)';
            p = M*p1;
            distance = sqrt(sum((p-p2).^2));
            if distance < threshold
                currentSet = [currentSet, matches(:, idx)];
            end
        end
        if size(currentSet,2)>size(bestSet,2) 
            bestSet = currentSet;
            bestTransform = M;
        end
    end
end

