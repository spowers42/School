function [ ] = draw_corners( img, R, outfile )
%DRAW_CORNERS Summary of this function goes here
%   Detailed explanation goes here
    imshow(img);
    f = figure(1);
    set(f, 'visible', 'off');
    hold on;

    [row, col] = find(R);
    centers = [col, row];
    viscircles(centers, ones(1,size(centers,1))*2,'EdgeColor','b', 'DrawBackgroundCircle', false);
    saveas(f, strcat('output/', outfile), 'png');
    hold off;
    close(f);

end

