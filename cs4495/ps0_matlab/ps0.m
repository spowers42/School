ps0_1_a_1 = imread('output/ps0-1-a-1.jpg');
ps0_1_a_2 = imread('output/ps0-1-a-2.png');

%swap red and blue of image 1_a_1
ps0_2_a_1 = uint8(zeros(size(ps0_1_a_1)));
ps0_2_a_1(:,:,1) = ps0_1_a_1(:,:,3);
ps0_2_a_1(:,:,2) = ps0_1_a_1(:,:,2);
ps0_2_a_1(:,:,3) = ps0_1_a_1(:,:,1);
imwrite(ps0_2_a_1, 'output/ps0-2-a-1.png');

%select just the green channel
ps0_2_b_1 = ps0_1_a_1(:, :, 2);
imwrite(ps0_2_b_1, 'output/ps0-2-b-1.png');

%select the red channel
ps0_2_c_1 = ps0_1_a_1(:,:,1);
imwrite(ps0_2_c_1, 'output/ps0-2-c-1.png');

%replace center 100x100 region of image 2 with center of image 1
img2_mono = ps0_1_a_2(:,:,2);  %using green
center1 = floor(size(ps0_1_a_1(:,:,1))/2);
center2 = floor(size(ps0_1_a_2(:,:,1))/2);

img2_mono(center2(1)-50:center2(1)+49, center2(2)-50:center2(2)+49) =  ps0_1_a_1(center1(1)-50:center1(1)+49, center1(2)-50:center1(2)+49);
imwrite(img2_mono, 'output/ps0-3-a-1.png');

[maximum, minimum, m, s] = describe(ps0_1_a_1(:,:,2));
disp([maximum, minimum, m, s])

ps0_4_b_1 = uint8(((double(ps0_1_a_1)-m)/s*10)+m);
imwrite(ps0_4_b_1, 'output/ps0-4-b-1.png');

%shift to right
s = size(ps0_1_a_1);
edge = zeros([s(1), 2]);
ps0_4_c_1 = [edge ps0_1_a_1(:,1:s(2)-2,2)];
imwrite(ps0_4_c_1, 'output/ps0-4-c-1.png');

ps0_4_d_1 = double(ps0_1_a_1(:,:,2));
ps0_4_d_1 = ps0_4_d_1 - double(ps0_4_c_1);
ps0_4_d(ps0_4_d_1<0) = 0; %replace negatives with 0
imwrite(ps0_4_d_1, 'output/ps0-4-d-1.png');

sigma = 6;
noise = randn(s(1:2)) * sigma;
ps0_5_a_1 = double(ps0_1_a_1);
ps0_5_b_1 = double(ps0_1_a_1);
ps0_5_a_1(:,:,2) = ps0_5_a_1(:,:,2)+noise;
imwrite(uint8(ps0_5_a_1), 'output/ps0-5-a-1.png');
ps0_5_b_1(:,:,3) = ps0_5_b_1(:,:,3)+noise;
imwrite(uint8(ps0_5_b_1), 'output/ps0-5-b-1.png');