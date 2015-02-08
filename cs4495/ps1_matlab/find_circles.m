function [centers, radii] = find_circles(BW, radius_range)
    % Find circles in given radius range using Hough transform.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius_range: Range of circle radii [min max] to look for, in pixels

    % TODO: Your code here
    s = size(BW);
    z = radius_range(2)-radius_range(1)+1;
    H = zeros(s(1), s(2), z);
    %H = [];
    
    for r=radius_range(1):radius_range(2)
        %h = hough_circles_acc(BW, r);
        %H = cat(3, H, h);  
        H(:,:,r-radius_range(1)+1) = hough_circles_acc(BW,r);
    end
    [centers, radii] = hough_peaks3d(H, radius_range, 'numpeaks', 20, 'Threshold', 0.5 * max(H(:)));
end



