check = imread(fullfile('input', 'check.bmp'));
transA = imread(fullfile('input', 'transA.jpg'));
transB = imread(fullfile('input', 'transB.jpg'));
simA = imread(fullfile('input', 'simA.jpg'));
simB = imread(fullfile('input', 'simB.jpg'));

%%1a
[~, ~, img1] = gradient2img(transA, 1.5); 
imwrite(img1, fullfile('output', 'ps4-1-a-1.png'));
[~, ~, img2] = gradient2img(simA, 1.5);
imwrite(img2, fullfile('output', 'ps4-1-a-2.png'));

%%1b
[R1, A1] = harris(transA, 5);
imwrite(mat2gray(R1), fullfile('output', 'ps4-1-b-1.png'));
[R2, A2] = harris(transB, 5);
imwrite(mat2gray(R2), fullfile('output', 'ps4-1-b-2.png'));
[R3, A3] = harris(simA, 5);
imwrite(mat2gray(R3), fullfile('output', 'ps4-1-b-3.png'));
[R4, A4] = harris(simB, 5);
imwrite(mat2gray(R4), fullfile('output', 'ps4-1-b-4.png'));
[R, A] = harris(check, 5);
imshow(mat2gray(R));

%%1c
R1_s = n_suppression(R1, 15);
R2_s = n_suppression(R2, 15);
R3_s = n_suppression(R3, 15); 
R4_s = n_suppression(R4, 15);
draw_corners(transA, R1_s, 'ps4-1-c-1.png');
draw_corners(transB, R2_s, 'ps4-1-c-2.png');
draw_corners(simA, R3_s, 'ps4-1-c-3.png');
draw_corners(simB, R3_s, 'ps4-1-c-4.png');

%%2a
f1 = get_frames(R1_s, A1);
f2 = get_frames(R2_s, A2);
draw_corner_pair(transA, transB, f1, f2, 'ps4-2-a-1');
f3 = get_frames(R3_s, A3);
f4 = get_frames(R4_s, A4);
draw_corner_pair(transA, transB, f1, f2, 'ps4-2-a-2');

%%2b
 [match1, score1] = run_sift(transA, transB, f1, f2, 'ps4-2-b-1');
 [match2, score2] = run_sift(simA, simB, f3, f4, 'ps4-2-b-2');