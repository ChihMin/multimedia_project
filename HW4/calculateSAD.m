function [ SAD ] = calculateSAD( img1, img2, N )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%{
    SAD = sum(sum(abs(img1-img2)));

%}

    SAD = 0;
    for i = 1:N,
        for j = 1:N,
            SAD = SAD + abs(img1(i, j) - img2(i, j));
        end
    end
    
end

