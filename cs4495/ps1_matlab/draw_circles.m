function [ output_args ] = draw_circles( centers, radii, img, outfile)
%DRAW_CIRCLES Summary of this function goes here
%   Detailed explanation goes here
    imshow(img);
    f = figure(1);
    set(f, 'visible', 'off');
    hold on;
    %assuming centers are coming in straight from the accumulator
    %they need to be flipped for drawing circles
    viscircles(fliplr(centers), radii,'EdgeColor','b', 'DrawBackgroundCircle', false);
    saveas(f, strcat('output/', outfile), 'png');
    hold off;
    close(f);
end

