function [ maximum, minimum, themean, sdev ] = describe( M )
    %describe the basic statistics about a matrix by transforming it into
    % a vector.  This provides global statistics about the dataset.
    V = double(M(:)); 
    maximum = max(V);
    minimum = min(V);
    themean = mean(V);
    sdev = std(V);
end

