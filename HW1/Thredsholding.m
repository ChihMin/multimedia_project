function [ result ] = Thredsholding( img )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
    [h, w] = size( img );
    
    sum = double(0);
    
    for i = 1:h,
        for j = 1:w,
            sum = sum + double(img(i, j));
        end
    end
    
    sum
    sum = sum / ( w * h ) ;    
    for i = 1:h,
        for j = 1:w,
            if img(i, j) > 128
                img(i, j) = 255;
            else
                img(i, j) = 0;
            end
        end
    end
    result = img;
end

