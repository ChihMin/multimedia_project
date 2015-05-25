function [ SAD ] = calculateSAD( img1, img2, N )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    SAD = sum(sum(abs(img1-img2)));
end

