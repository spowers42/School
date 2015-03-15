function [ output_args ] = draw_matches( img_l, img_r, frame_l, frame_r, matches, outfile )
%DRAW_MATCHES Summary of this function goes here
%   Detailed explanation goes here
    img_l = single(img_l);
    img_r = single(img_r);
    width = size(img_l, 2);
    imshow(mat2gray([img_l, img_r])); 
    fig = figure(1);
    set(fig, 'visible', 'off');
    hold on;
    for idx=1:size(matches, 2)
        idx_l = matches(1, idx);
        idx_r = matches(2, idx);
        f = [frame_l(:, idx_l), frame_r(:, idx_r)];
        plot([f(1,1), f(1,2)+width], [f(2,1), f(2,2)]); 
    end
    saveas(fig, strcat('output/', outfile), 'png');
    hold off;
    close(fig);

end

