function [ u, v ] = lk( img1, img2 )
%LK Summary of this function goes here
%   Detailed explanation goes here
    img1 = double(img1);
    img2 = double(img2);
    %built useful matricies
    [Ix, Iy] = imgradientxy(img1);
    It = double(img2 - img1);
    H = fspecial('gaussian', [15, 15], 3);
    Ixx = imfilter(Ix.*Ix, H);
    Ixy = imfilter(Ix.*Iy, H);
    Iyy = imfilter(Iy.*Iy, H);
    Ixt = -1*imfilter(Ix.*It, H);
    Iyt = -1*imfilter(Iy.*It, H);
    [height, width] = size(img1);
    %calculate flow per pixel
    u = zeros(height, width);
    v = zeros(height, width);
    for x = 1:width
        for y = 1:height
            uv = [Ixx(y,x), Ixy(y,x); Ixy(y,x), Iyy(y,x)]\[Ixt(y,x);Iyt(y,x)];
            u(y,x) = uv(1);
            v(y,x) = uv(2);
        end
    end
end

