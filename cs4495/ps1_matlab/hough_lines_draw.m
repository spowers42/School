function hough_lines_draw(img, outfile, peaks, rho, theta)
    % Draw lines found in an image using Hough transform.
    %
    % img: Image on top of which to draw lines
    % outfile: Output image filename to save plot as
    % peaks: Qx2 matrix containing row, column indices of the Q peaks found in accumulator
    % rho: Vector of rho values, in pixels
    % theta: Vector of theta values, in degrees

    % TODO: Your code here
    imshow(img);
    f = figure(1);
    set(f, 'visible', 'off');
    hold on;
    %plot stuff
    for peakidx = 1:size(peaks,1)
        idx = peaks(peakidx, :);
        r = abs(rho(idx(1)));
        t = abs(theta(idx(2)));
        if t~=0
            x = 1:size(img,2);
            y = (r - x*cosd(t))/sind(t);
        else
            x(1:size(img,2)) = r;
            y = 1:size(img,1);
        end
        plot(x, y, 'r-');
    end
    saveas(f, strcat('output/', outfile), 'png');
    hold off;
    close(f);
end
