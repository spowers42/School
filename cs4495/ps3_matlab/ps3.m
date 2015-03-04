
% problem 1a 
pt2d_norm = dlmread(fullfile('input','pts2d-norm-pic_a.txt'));
ps3d_norm = dlmread(fullfile('input', 'pts3d-norm.txt'));
A = buildA(ps3d_norm, pt2d_norm);
Y = reshape(pt2d_norm', 1, numel(pt2d_norm))';
M = Y\A;  %why is this answer incorrect???
%expected = [-0.4583, 0.2947, 0.0139, -0.004, 0.0509, 0.0546, 0.541, 0.0524, -0.109, -0.1784, 0.0443, -0.5968];
M = reshape(M, 4, 3)';

%or the one that works....

[U D V] = svd(A);
M = reshape(V(:,end), 4, 3)';
disp('problem 1a');
disp(M);
last_point = world2camera(M, ps3d_norm(end,:));
disp(last_point);
known_last = pt2d_norm(end,:);
[residual, ~] = sumsqr(last_point-known_last);
disp(sqrt(residual));

% problem 1b
pt2d = dlmread(fullfile('input', 'pts2d-pic_b.txt'));
pt3d = dlmread(fullfile('input', 'pts3d.txt'));
for k=[8,12, 16]
    disp(k);
    [res, m] = calibrate(k, pt3d, pt2d);
    disp(res);
    disp(m)
end

%problem 1c
%test case is M
disp(camera_center(M)); %[-1.5127;-2.3517;02826]
disp(camera_center(m));

%problem 2a
p1 = dlmread(fullfile('input','pts2d-pic_a.txt'));
p2 = dlmread(fullfile('input','pts2d-pic_b.txt'));
A = buildA(p1, p2);
[U D V] = svd(A);
F = reshape(V(:,end), 3, 3)';
disp('2a - F');
disp(F);
[U D V] = svd(F);
D(end,:) = zeros(1,size(D,2));
F_hat = U*D*V';
disp('2b');
disp(F_hat);

