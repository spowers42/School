% ps1

%% 1-a
img = imread(fullfile('input', 'ps1-input0.png'));  % already grayscale
img_edges = edge(img);
imwrite(img_edges, fullfile('output', 'ps1-1-a-1.png')); 

%% 2-a
[H, theta, rho] = hough_lines_acc(img_edges);  
imwrite(im2uint8(mat2gray(H)), fullfile('output', 'ps1-2-a-1.png'))
%% 2-b
peaks = hough_peaks(H, 'numpeaks', 10);
annotate_peaks(H, peaks, 'ps1-2-b-1.png');
%% 2-c
%% ps1-2-c-1 hough lines
hough_lines_draw(img, 'ps1-2-c-1.png', peaks, rho, theta);

%% 3-a
img_w_noise = imread(fullfile('input', 'ps1-input0-noise.png'));
filter_size = 10;
filter_sigma = 2;
H = fspecial('gaussian', filter_size, filter_sigma);
smoothed_img = imfilter(img_w_noise, H, 'replicate');
imwrite(smoothed_img, fullfile('output', 'ps1-3-a-1.png'));

%% 3-b
noise_edges = edge(smoothed_img);
imwrite(noise_edges, fullfile('output', 'ps1-3-b-1.png'));