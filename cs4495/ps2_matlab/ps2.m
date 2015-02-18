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

%% 4-a use normalized correlation on pair 0

%% 4-b use on noise and contrast versions 

%% 5-a try on pair 2 adjusting to get best results