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
noise_edges = edge(smoothed_img, 'canny');
imwrite(edge(img_w_noise), fullfile('output', 'ps1-3-b-1.png'));
imwrite(noise_edges, fullfile('output', 'ps1-3-b-2.png'));

%% 3-c
[H, theta, rho] = hough_lines_acc(noise_edges);  
peaks = hough_peaks(H, 10);
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
[H, theta, rho] = hough_lines_acc(edges, 'RhoResolution', 2);
peaks = hough_peaks(H, 20, 'Threshold', 0.4 * max(H(:)));  %0.4 gives 5 lines, .5 gives 3
annotate_peaks(H, peaks, 'ps1-4-c-1.png');
hough_lines_draw(img, 'ps1-4-c-2.png', peaks, rho, theta);

%% 5-a
imwrite(smoothed_img, fullfile('output', 'ps1-5-a-1.png'));
imwrite(edges, fullfile('output', 'ps1-5-a-2.png'));
H = hough_circles_acc(edges, 20);
peaks = hough_peaks(H, 10);
r = ones(1, size(peaks,1)) * 20;
draw_circles(peaks, r, smoothed_img, 'ps1-5-a-3.png');

%% 5-b
[centers, radii] = find_circles(edges, [20 50]);
draw_circles(centers, radii, img, 'ps1-5-b-1.png');

%% 6-a
img = rgb2gray(imread(fullfile('input', 'ps1-input2.png')));
filter_size = 20;
filter_sigma = 6;
H = fspecial('gaussian', filter_size, filter_sigma);
smoothed_img = imfilter(img, H, 'replicate');
edges = edge(smoothed_img, 'canny', 0.6);
[H, theta, rho] = hough_lines_acc(edges);  
peaks = hough_peaks(H, 20);
hough_lines_draw(img, 'ps1-6-a-1.png', peaks, rho, theta);

%% 6-b no code
%% 6-c exclude non pen
distances = squareform(pdist(peaks));
disp(distances);
%todo minimum non 0 value per row
%todo filter peaks on distances

%% 7-1 circle finder
[centers, radii] = find_circles(edges, [20 50]);
draw_circles(centers, radii, img, 'ps1-7-a-1.png');

%% 8-1 find lines and circles
img = rgb2gray(imread(fullfile('input', 'ps1-input3.png')));
filter_sigma = 6;
H = fspecial('gaussian', filter_size, filter_sigma);
smoothed_img = imfilter(img, H, 'replicate');
edges = edge(smoothed_img, 'canny');
[H, theta, rho] = hough_lines_acc(edges);  
peaks = hough_peaks(H, 20);
hough_lines_draw(img, 'tmp.png', peaks, rho, theta);
tmp = imread(fullfile('output','tmp.png'));
[centers, radii] = find_circles(edges, [20 50]);
draw_circles(centers, radii, tmp, 'ps1-8-a-1.png');
