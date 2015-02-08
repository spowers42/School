function [centers, radii] = find_circles(BW, radius_range)
    % Find circles in given radius range using Hough transform.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius_range: Range of circle radii [min max] to look for, in pixels

    % TODO: Your code here
    s = size(BW);
    H = [];
    
    for r=radius_range(1):radius_range(2)
        h = hough_circles_acc(BW, r);
        H = cat(3, H, h);   
    end
    [centers, radii] = hough_peaks3d(H, radius_range, 'numpeaks', 20);
end



