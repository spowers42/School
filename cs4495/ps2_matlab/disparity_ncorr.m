function D = disparity_ncorr(L, R)
    % Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))
    %
    % L: Grayscale left image
    % R: Grayscale right image, same size as L
    % D: Output disparity map, same size as L, R

    window = 21;  %21 works well with less complex images
    half_window = floor(window/2);
    D = zeros(size(L));
    L = padarray(L, [window, window]);
    R = padarray(R, [window, window]);
    
    for row=window+1:size(L,1)-window
       strip = R(row-half_window:row+half_window, :);
       for x=window+1:size(L,2)-window
           patch = L(row-half_window:row+half_window, x-half_window:x+half_window);
           c = normxcorr2(patch, strip);
           [~, x_idx] = find(c == max(c(:)));
           row_idx = row-window;
           col_idx = x-window;
           D(row_idx, col_idx) = abs(x-(x_idx-half_window)); %the location is based on the right edge
       end
    end
end
