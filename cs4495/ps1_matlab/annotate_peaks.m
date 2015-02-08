function [ ] = annotate_peaks( M, peaks, outfile )
%annotate_peaks draws rectangles overlayed on the peaks of M.  This is
%displayed on the screen.  
%   Detailed explanation goes here
    imshow(im2uint8(mat2gray(M)));
    g = figure(1);
    set(g, 'visible', 'off');
    hold on;
    for idx = 1:size(peaks,1)
        rectangle('Position', [fliplr(peaks(idx,:))-[2 2],4, 4], 'EdgeColor', 'w');
    end
    i = getframe(gca);
    [X, map] = frame2im(i);
    f=figure(2);
    set(f, 'visible', 'off');
    imshow(X);
    saveas(f, strcat('output/', outfile), 'png');
    hold off;
    close(g);
    close(f);
end

