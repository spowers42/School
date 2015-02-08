function H = hough_circles_acc(BW, radius)
    % Compute Hough accumulator array for finding circles.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius: Radius of circles to look for, in pixels

    % TODO: Your code here
    H = zeros(size(BW));
    
    for x = 1:size(BW, 2)
        for y = 1:size(BW,1)
            if (BW(y,x)==1)
                for theta = 0:360
                    %basic version
                    b = round(x-radius*cosd(theta));
                    a = round(y+radius*sind(theta));
                    if inbounds(a,b,size(BW))
                        H(a,b) = H(a,b)+1;
                    end
                end
            end
        end
    end
end

function is_ok = inbounds(a, b, s)
    if (a>0 && b>0 && a<s(1) && b<s(2))
        is_ok = true;
    else
        is_ok = false;
    end
end
