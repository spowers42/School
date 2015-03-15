function [ R , A] = harris( img, w_size )
%HARRIS Summary of this function goes here
%   Detailed explanation goes here
    alpha = 0.6;
    [Ix, Iy, ~] = gradient2img(img, 1.5);
    W = fspecial('gaussian', w_size, 2);%ones(w_size);  %replace with gaussian
    style = 'symmetric';
    M00 = imfilter(Ix.^2, W, style);
    M01 = imfilter(Ix.*Iy, W, style);
    M10 = M01;
    M11 = imfilter(Iy.^2, W, style);
    determinate = M00 .* M11 - M01 .* M10;
    trace = M00 .* M11;
    R = determinate - alpha * trace .* trace;
    A = atan2(Iy, Ix);
end

