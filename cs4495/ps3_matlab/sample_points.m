function [ m1_train, m2_train, m1_test, m2_test ] = sample_points( m1, m2, k )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    test_size = 4;
    indices = randperm(size(m1, 1));
    m1_train = m1(indices(1:k),:);
    m2_train = m2(indices(1:k),:);
    m1_test = m1(indices(k+1:k+test_size),:);
    m2_test = m2(indices(k+1:k+test_size),:);
end

