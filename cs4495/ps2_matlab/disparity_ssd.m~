function D = disparity_ssd(L, R, w, l2r)
    % Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))
    %
    % L: Grayscale left image
    % R: Grayscale right image, same size as L
    % D: Output disparity map, same size as L, R

    %D = simple_ssd(L, R);
    D = vector_ssd(L, R, w, l2r)-1;
end

function D = simple_ssd(L, R)
    % works but very slow
    window = 11;
    D = zeros('like', L);
    for row=1:size(L,1)-window+1
       strip = R(row:row+window-1, :);
       parfor x=1:size(L,2)-window+1
           patch = L(row:row+window-1, x:x+window-1);
           D(row, x) = x-find_best_match(patch, strip);
       end
    end
    %maybe it is better to average the results from overlapping windows?
  
end

function best_x = find_best_match(patch, strip)
    min_diff = Inf;
    best_x = 0; % column index (x value) of topleft corner; haven't found it yet
    for x = 1:(size(strip, 2) - size(patch, 2))
        other_patch = strip(:, x:(x + size(patch, 2) - 1));
        diff = sumsqr((patch - other_patch));
        if diff < min_diff
            min_diff = diff;
            best_x = x;
        end
    end
end

function D = vector_ssd(L, R, w, l2r)

    filter = fspecial('average', w);
    
    maxd = size(L, 1); 
    for d=0:maxd
        rshift = shiftimg(R, d, l2r);
        diff = L-rshift;
        diff = diff.^2;
        ssd = imfilter(diff, filter, 'symmetric');
        DSI(:, :, d+1) = ssd;
    end
    [~, D] = min(DSI, [], 3);
end

function newimg = shiftimg(img, distance, l2r)
    if distance>0;
        if l2r
            newimg = [zeros(size(img,1), distance), img(:, 1:end-distance)];
        else
            newimg = [img(:, distance+1:end), zeros(size(img,1), distance)];
        end
    else
        newimg = img;
    end
end