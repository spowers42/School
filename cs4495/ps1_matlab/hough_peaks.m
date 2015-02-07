function peaks = hough_peaks(H, varargin)
    % Find peaks in a Hough accumulator array.
    %
    % Threshold (optional): Threshold at which values of H are considered to be peaks
    % NHoodSize (optional): Size of the suppression neighborhood, [M N]
    %
    % Please see the Matlab documentation for houghpeaks():
    % http://www.mathworks.com/help/images/ref/houghpeaks.html
    % Your code should imitate the matlab implementation.

    %% Parse input arguments
    p = inputParser;
    addOptional(p, 'numpeaks', 1, @isnumeric);
    addParameter(p, 'Threshold', 0.5 * max(H(:)));
    addParameter(p, 'NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    parse(p, varargin{:});

    numpeaks = p.Results.numpeaks;
    threshold = p.Results.Threshold;
    nHoodSize = p.Results.NHoodSize;
    peaks = [];
    offset = floor(nHoodSize/2);
    s = size(H);
    while size(peaks,1)<numpeaks
        m = max(H(:));
        if m<threshold
            return
        end
        [r, c] = find(H==m, 1, 'first');
        peaks = [peaks;[r, c]];
        r_min = r-offset(1);
        r_max = r+offset(1);
        c_min = c-offset(2);
        c_max = c+offset(2);
        if r_min<=0
            r_min = 1;
        end
        if c_min<=0
            c_min = 1;
        end
        if r_max>s(1)
            r_max = s(1);
        end
        if c_max>s(2)
            c_max = s(2);
        end
        H(r_min:r_max, c_min:c_max) = 0;
    end
    

end
