function center = camera_center( M )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    center = -(inv(M(:,1:3)))*M(:,4);
end

