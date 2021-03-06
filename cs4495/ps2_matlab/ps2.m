% ps2

%% 1-a
% Read images
L = im2double(imread(fullfile('input', 'pair0-L.png')));
R = im2double(imread(fullfile('input', 'pair0-R.png')));

% Compute disparity
D_L = disparity_ssd(L, R, 11, true);
D_R = disparity_ssd(R, L, 11, false);

imwrite(mat2gray(D_L), fullfile('output', 'ps2-1-a-1.png'));
imwrite(mat2gray(D_R), fullfile('output', 'ps2-1-a-2.png'));
%% 2-a compute disparity with pair 1
p1_L = im2double(rgb2gray(imread(fullfile('input', 'pair1-L.png'))));
p1_R = im2double(rgb2gray(imread(fullfile('input', 'pair1-R.png'))));

D_L2 = disparity_ssd(p1_L, p1_R, 11, true);
D_R2 = disparity_ssd(p1_R, p1_L, 11, false);
imwrite(mat2gray(D_L2), fullfile('output', 'ps2-2-a-1.png'));
imwrite(mat2gray(D_R2), fullfile('output', 'ps2-2-a-2.png'));

%% 3-a compute disparity with gaussian noise (pair 0)
L_with_noise = imnoise(L, 'gaussian', 0, .2);
D_L3 = disparity_ssd(L_with_noise, R, 11, true);
D_R3 = disparity_ssd(R, L_with_noise, 11, false);
imwrite(mat2gray(D_L3), fullfile('output', 'ps2-3-a-1.png'));
imwrite(mat2gray(D_R3), fullfile('output', 'ps2-3-a-2.png'));

%% 3-b compute disparity with one img * 10%
L_contrast = L + L * 0.1;
D_L4 = disparity_ssd(L_contrast, R, 11, true);
D_R4 = disparity_ssd(R, L_contrast, 11, true);
imwrite(mat2gray(D_L4), fullfile('output', 'ps2-3-b-1.png'));
imwrite(mat2gray(D_R4), fullfile('output', 'ps2-3-b-2.png'));

%% 4-a use normalized correlation on pair 0
D_L5 = disparity_ncorr(L,R);
D_R5 = disparity_ncorr(R, L);
imwrite(mat2gray(D_L5), fullfile('output', 'ps2-4-a-1.png'));
imwrite(mat2gray(D_R5), fullfile('output', 'ps2-4-a-2.png'));

%% 4-b use on noise and contrast versions 
D_L5 = disparity_ncorr(L_with_noise, R);
D_R5 = disparity_ncorr(R, L_with_noise);
imwrite(mat2gray(D_L5), fullfile('output', 'ps2-4-b-1.png'));
imwrite(mat2gray(D_R5), fullfile('output', 'ps2-4-b-2.png'));
D_L5 = disparity_ncorr(L_contrast, R);
D_R5 = disparity_ncorr(R, L_contrast);
imwrite(mat2gray(D_L5), fullfile('output', 'ps2-4-b-3.png'));
imwrite(mat2gray(D_R5), fullfile('output', 'ps2-4-b-4.png'));


%% 5-a try on pair 2 adjusting to get best results
L = im2double(rgb2gray(imread(fullfile('input', 'pair2-L.png'))));
R = im2double(rgb2gray(imread(fullfile('input', 'pair2-R.png'))));
filter_size = 20;
filter_sigma = 2;
H = fspecial('gaussian', filter_size, filter_sigma);
L_s = imfilter(L, H, 'replicate');
R_s = imfilter(R, H, 'replicate');
D_L5 = disparity_ncorr(L_s, R_s);
D_R5 = disparity_ncorr(R_s, L_s);
imwrite(mat2gray(D_L5), fullfile('output', 'ps2-5-a-1.png'));
imwrite(mat2gray(D_R5), fullfile('output', 'ps2-5-a-2.png'));