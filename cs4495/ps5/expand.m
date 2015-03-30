function [ img_e ] = expand( img, original_size )
%EXPAND Summary of this function goes here
%   Detailed explanation goes here
    odd_filter = [1/8, 0, 3/4, 0, 1/8];
    even_filter = [0, 1/2, 0, 1/2, 0];
    img_e = imresize(img, 2);
    odd = conv2(odd_filter, odd_filter, img_e);
    even = conv2(even_filter, even_filter, img_e);
    img_e = odd;
    for row = 2:2:size(img_e, 1)
         img_e(row, :) = even(row, :);
    end
    for col = 2:2:size(img_e, 2)
         img_e(:, col) = even(:, col);
    end
    img_e = img_e(1:original_size(1), 1:original_size(2));
end

