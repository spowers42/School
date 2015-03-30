%1a
t0 = imread(fullfile('input', 'TestSeq','Shift0.png'));
t1 = imread(fullfile('input', 'TestSeq','ShiftR2.png'));
[u, v] = lk(t0, t1);
save_displacement(u, v, 'ps5-1-a-1.png');

t1b = imread(fullfile('input', 'TestSeq', 'ShiftR5U5.png'));
[u, v] = lk(t0, t1b);
save_displacement(u, v, 'ps5-1-a-2.png');

%1b
r10 = imread(fullfile('input', 'TestSeq', 'ShiftR10.png'));
r20 = imread(fullfile('input', 'TestSeq', 'ShiftR20.png'));
r40 = imread(fullfile('input', 'TestSeq', 'ShiftR40.png'));
[u, v] = lk(t0, r10);
save_displacement(u, v, 'ps5-1-b-1.png');
[u, v] = lk(t0, r20);
save_displacement(u, v, 'ps5-1-b-2.png');
[u, v] = lk(t0, r40);
save_displacement(u, v, 'ps5-1-b-3.png');

%2a
f = figure();
set(f, 'visible', 'off');
lvl0 = double(imread(fullfile('input', 'DataSeq1', 'yos_img_01.jpg')));
subplot(1,4,1); imshow(mat2gray(lvl0));
lvl1 = reduce(lvl0);
subplot(1,4,2); imshow(mat2gray(lvl1));
lvl2 = reduce(lvl1);
subplot(1,4,3); imshow(mat2gray(lvl2));
lvl3 = reduce(lvl2);
subplot(1,4,4); imshow(mat2gray(lvl3));
saveas(f, fullfile('output', 'ps5-2-a-1.png'));
hold off;
close(f);

%2b
e1 = expand(lvl1, size(lvl0));
e2 = expand(lvl2, size(lvl1));
e3 = expand(lvl3, size(lvl2));
lp0 = lvl0 - e1;
lp1 = lvl1 - e2;
lp2 = lvl2 - e3;
f = figure();
set(f, 'visible', 'off');
subplot(1,4,1); imshow(mat2gray(lp0));
subplot(1,4,2); imshow(mat2gray(lp1));
subplot(1,4,3); imshow(mat2gray(lp2));
subplot(1,4,4); imshow(mat2gray(lvl3));
saveas(f, fullfile('output', 'ps5-2-b-1.png'));
hold off;
close(f);

%3a
img1 = lvl0;
img2 = double(imread(fullfile('input', 'DataSeq1', 'yos_img_02.jpg')));
img3 = double(imread(fullfile('input', 'DataSeq1', 'yos_img_03.jpg')));
img2_lvl1 = reduce(img2);
img2_lvl2 = reduce(img2_lvl1);
img2_lvl3 = reduce(img2_lvl2);
img3_lvl1 = reduce(img3);
img3_lvl2 = reduce(img3_lvl1);
[u, v] = lk(lvl3, img2_lvl3);
save_displacement(u, v, 'ps5-3-a-1.png');
f = figure();
set(f, 'visible', 'off');
imshow(mat2gray(imabsdiff(lvl3, warp(img2_lvl3, -u, -v))));
saveas(f, fullfile('output', 'ps5-3-a-2.png'));
hold off;
close(f);

img1 = double(rgb2gray(imread(fullfile('input', 'DataSeq2', '0.png'))));
img2 = double(rgb2gray(imread(fullfile('input', 'DataSeq2', '1.png'))));
img3 = double(rgb2gray(imread(fullfile('input', 'DataSeq2', '2.png'))));
img1_lvl1 = reduce(img1);
img1_lvl2 = reduce(img1_lvl1);
img1_lvl3 = reduce(img1_lvl2);
img1_lvl4 = reduce(img1_lvl3);
img2_lvl1 = reduce(img2);
img2_lvl2 = reduce(img2_lvl1);
img2_lvl3 = reduce(img2_lvl2);
img2_lvl4 = reduce(img2_lvl3);
[u, v] = lk(img1_lvl4, img2_lvl4);
save_displacement(u, v, 'ps5-3-a-3.png');
f = figure();
set(f, 'visible', 'off');
imshow(mat2gray(imabsdiff(img1_lvl4, warp(img2_lvl4, -u, -v))));
saveas(f, fullfile('output', 'ps5-3-a-4.png'));
hold off;
close(f);
