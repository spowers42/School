function [ M ] = n_suppression( M, s )
%N_SUPPRESSION suppresses the non maximum values in a neighborhood of size
% s
threshold = 0.01;
for x_idx = 1:size(M,2)
    for y_idx = 1:size(M,1)
        x_end = x_idx + s;
        y_end = y_idx + s;
        if x_end > size(M,2)
            x_end = size(M,2);
        end
        if y_end > size(M, 1)
            y_end = size(M,1);
        end
        tmp = M(y_idx:y_end, x_idx:x_end);
        [n_max, I] = max(tmp(:));
        [max_r, max_c] = ind2sub(size(tmp),I);
        M(y_idx:y_end, x_idx:x_end) = 0;
        if n_max > threshold
            M(y_idx+max_r-1, x_idx+max_c-1) = n_max;
        end 
    end
end
end