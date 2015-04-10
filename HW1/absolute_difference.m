function [ img ] = absolute_difference(origImg, distImg )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    img = distImg;
    [h, w, ~] = size(origImg);
    for i = 1:h,
        for j = 1:w,
            for k = 1:3,
                img(i, j, k) = origImg(i, j, k) - distImg(i, j, k);
                img(i, j, k) = abs(img(i, j, k));
            end
        end
    end
end

