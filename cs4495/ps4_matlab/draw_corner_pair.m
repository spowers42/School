function [ output_args ] = draw_corner_pair( img_l, img_r, frame_l, frame_r, outfile )
%DRAW_CORNER_PAIR given two images and frames describing features make an
%image
    width = size(img_l, 2);
    cols = size(frame_r, 1);
    offset_l = repmat([0,0,6,0], size(frame_l,1),1);
    offset_r = repmat([width, 0, 6, 0], cols, 1);
    frame_l = frame_l + offset_l;
    frame_r = frame_r + offset_r;
    img = [img_l, img_r];
    frame = [frame_l; frame_r];
    imshow(img);
    f = figure(1);
    set(f, 'visible', 'off');
    hold on;
    p = vl_plotframe(frame');
    set(p,'linewidth',1);
    saveas(f, strcat('output/', outfile), 'png');
    hold off;
    close(f);
end

