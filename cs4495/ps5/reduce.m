function [ img_r ] = reduce( img )
%REDUCE Summary of this function goes here
%   Detailed explanation goes here
    f = [1,4,16,4,1]/16;
    tmp = conv2(f, f, img);
    img_r = tmp(1:2:end, 1:2:end);
end

