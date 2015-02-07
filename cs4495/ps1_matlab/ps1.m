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
filter_size = 20;
filter_sigma = 4;
H = fspecial('gaussian', filter_size, filter_sigma);
smoothed_img = imfilter(img_w_noise, H, 'replicate');
imwrite(smoothed_img, fullfile('output', 'ps1-3-a-1.png'));

%% 3-b
noise_edges = edge(smoothed_img);
imwrite(edge(img_w_noise), fullfile('output', 'ps1-3-b-1.png'));
imwrite(noise_edges, fullfile('output', 'ps1-3-b-2.png'));

%% 3-c
[H, theta, rho] = hough_lines_acc(noise_edges);  
peaks = hough_peaks(H, 10);
disp(size(peaks));
annotate_peaks(H, peaks, 'ps1-3-c-1.png')  %wat?????
hough_lines_draw(img_w_noise, 'ps1-3-c-2.png', peaks, rho, theta);

%% 4-a
img = rgb2gray(imread(fullfile('input', 'ps1-input1.png')));
filter_size = 20;
filter_sigma = 2;
H = fspecial('gaussian', filter_size, filter_sigma);
smoothed_img = imfilter(img, H, 'replicate');
imwrite(smoothed_img, fullfile('output', 'ps1-4-a-1.png'));

%% 4-b
edges = edge(smoothed_img);
imwrite(edges, fullfile('output', 'ps1-4-b-1.png'));

%% 4-c
[H, theta, rho] = hough_lines_acc(edges);
peaks = hough_peaks(H, 20);
annotate_peaks(H, peaks, 'ps1-4-c-1.png');
hough_lines_draw(img, 'ps1-4-c-2.png', peaks, rho, theta);