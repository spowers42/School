function [ f1, f2, bestSet, bestOffset ] = ransac_similarity( f1, f2, matches )
%RANSAC_TRANSLATION Summary of this function goes here
%   Detailed explanation goes here
    N = 40;
    bestSet = [];
    bestTransform = [];
    %for each iteration till N
    for ~=1:N
        % pick 2 matches
        pair_indices = randomsample(size(matches,2), 2);
        % build A and B matrix from matches
        
    % solve x using x=A\B;
    % test:
    %   for each match
    %     x*[u;v;1] to get points in right image
    %     find distance to match in the right
    %     add to current set if within threshold distance
    
    %%%%%other version for reference
    for idx = randsample(size(matches, 2), N)
        m = matches(:, idx);
        offset = [f1(m(1), 1) - f2(m(2), 1), f1(m(1), 2)-f2(m(2), 2)];
        currentSet = [];
        for i = 1:size(matches,2)
            pair = matches(:, i);
            currentoffset = [f1(pair(1), 1) - f2(pair(2), 1), f1(pair(1), 2)-f2(pair(2), 2)];
            distance = sqrt(sum((offset-currentoffset).^2));
            if distance <15
                currentSet = [currentSet, pair];
            end
        end
        if size(currentSet,2)>size(bestSet,2) 
            bestSet = currentSet;
            bestOffset = offset;
        end
    end
end
