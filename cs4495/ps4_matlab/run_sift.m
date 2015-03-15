function [matches, scores] = run_sift( img_l, img_r, frame_l, frame_r, outfile )
%RUN_SIFT Summary of this function goes here
%   frames are row based, must be transposed for vl functions
    img_l = single(img_l);
    img_r = single(img_r);
    [F_l, D_out1] = vl_sift(img_l, 'frames', frame_l');
    [F_r, D_out2] = vl_sift(img_r, 'frames', frame_r');
    [matches, scores] = vl_ubcmatch(D_out1, D_out2);
    width = size(img_l, 2);
    imshow(mat2gray([img_l, img_r])); 
    fig = figure(1);
    set(fig, 'visible', 'off');
    hold on;
    for idx=1:size(matches, 2)
        idx_l = matches(1, idx);
        idx_r = matches(2, idx);
        f = [F_l(:, idx_l), F_r(:, idx_r)];
        plot([f(1,1), f(1,2)+width], [f(2,1), f(2,2)]); 
    end
    saveas(fig, strcat('output/', outfile), 'png');
    hold off;
    close(fig);
end

