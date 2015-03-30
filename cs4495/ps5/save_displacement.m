function [ ] = save_displacement( u, v, filename )
%SAVE_DISPLACEMENT Summary of this function goes here
%   Detailed explanation goes here
    colormap jet;
    colorbar;
    f = figure(1);
    set(f, 'visible', 'off');
    hold on;
    imagesc([u, v]);
    saveas(f, fullfile('output', filename));
    hold off;
    close(f);
end

