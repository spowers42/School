function [H, theta, rho] = hough_lines_acc(BW, varargin)
    % Compute Hough accumulator array for finding lines.
    %
    % BW: Binary (black and white) image containing edge pixels
    % RhoResolution (optional): Difference between successive rho values, in pixels
    % Theta (optional): Vector of theta values to use, in degrees
    %
    % Please see the Matlab documentation for hough():
    % http://www.mathworks.com/help/images/ref/hough.html
    % Your code should imitate the Matlab implementation.
    %
    % Pay close attention to the coordinate system specified in the assignment.
    % Note: Rows of H should correspond to values of rho, columns those of theta.

    %% Parse input arguments
    p = inputParser();
    addParameter(p, 'RhoResolution', 1);
    addParameter(p, 'Theta', linspace(-90, 89, 180));
    parse(p, varargin{:});

    rhoStep = p.Results.RhoResolution;
    theta = p.Results.Theta;
    %%%Thus, the pixel at img(r,c) corresponds to the (x,y) coordinates (r,c),
    %%%i.e. x=c and y=r. This pixel should vote for line parameters (?,?) where:
    %%%? = x?cos(?) + y?sin(?), and ? = atan2(y,x).
    %% TODO: Your code here
    
    %     nrho = 2*(ceil(D/RhoResolution)) + 1, where 
    % D = sqrt((numRowsInBW - 1)^2 + (numColsInBW - 1)^2). 
    % rho values range from -diagonal to diagonal, where 
    % diagonal = RhoResolution*ceil(D/RhoResolution).
    D = sqrt(sum((size(BW)-1).^2));
    nrho = 2*(ceil(D/rhoStep)) + 1;
    diagonal = rhoStep * ceil(D/rhoStep);
    rho = linspace(-diagonal, diagonal, nrho);
    H = zeros(size(rho,2), (size(theta, 2)));
    
    for x = 1:size(BW, 2)
        for y = 1:size(BW,1)
            if BW(y, x) == 1
                for theta_idx = 1:size(theta, 2)
                    t = theta(theta_idx);
                    d = ceil(x*cosd(t) + y*sind(t));
                    rho_idx = find(rho<=d, 1, 'last');
                    H(rho_idx, theta_idx) = H(rho_idx, theta_idx)+1;
                end
            end
        end
    end
    
end
