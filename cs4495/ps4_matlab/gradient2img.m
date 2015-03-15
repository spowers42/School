function [ gx, gy, gimg ] = gradient2img( img, sigma )
%GRADIENT2IMG calculates the x and y gradients and also generates a 
 % concatenated image from those two 
    H = fspecial('gaussian', 20, sigma);
    filtered = double(imfilter(img, H))/255.;
    [gx, gy] = imgradientxy(filtered);
    gimg = mat2gray([gx, gy]);
end

