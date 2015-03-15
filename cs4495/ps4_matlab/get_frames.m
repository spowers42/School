function [ frames ] = get_frames(R, A)
%GET_FRAMES create a frame matrix as needed by vl_plotframe
%   for all non zero points in R get a frame assuming scale of 1
    frames = [];
    [Y, X] = find(R);
    
    for idx = 1:size(Y,1)
        x = X(idx);
        y = Y(idx);
        frames = [frames; [x,y,1, A(y,x)]]; 
    end
end

