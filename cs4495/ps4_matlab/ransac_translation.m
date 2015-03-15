function [ f1, f2, bestSet, bestOffset ] = ransac_translation( f1, f2, matches )
%RANSAC_TRANSLATION Summary of this function goes here
%   Detailed explanation goes here
    N = 30;
    bestSet = [];
    bestOffset = [];
    for idx = randsample(size(matches, 2), N)
        m = matches(:, idx);
        offset = [f1(m(1), 1) - f2(m(2), 1), f1(m(1), 2)-f2(m(2), 2)];
        currentSet = [];
        for i = 1:size(matches,2)
            pair = matches(:, i);
            currentoffset = [f1(pair(1), 1) - f2(pair(2), 1), f1(pair(1), 2)-f2(pair(2), 2)];
            distance = sqrt(sum((offset-currentoffset).^2));
            if distance < 15
                currentSet = [currentSet, pair];
            end
        end
        if size(currentSet,2)>size(bestSet,2) 
            bestSet = currentSet;
            bestOffset = offset;
        end
    end
end

