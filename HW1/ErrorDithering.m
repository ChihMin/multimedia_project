function [ result ] = ErrorDithering( img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    img = im2double( img );
    d = [0 1; 1 -1; 1 0; 1 1];
    [h, w] = size(img);
    for i = 1:h,
        for j = 1:w,
             
            if img(i, j) < 0.5,
                e = double(img(i, j));
                img(i ,j) = double(0);
            else
                e = double(img(i, j) - 1);
                img(i, j) = double(1);
            end
            
            for k = 1:4,
                ii = i + d(k, 1);
                jj = j + d(k, 2);
                
                if islegal( ii, jj, h, w ),
                    if k == 1,
                        img(ii, jj) = img(ii, jj) + e*(7/16);
                    elseif k == 2,
                        img(ii, jj) = img(ii, jj) + e*(3/16);
                    elseif k == 3,
                        img(ii, jj) = img(ii, jj) + e*(5/16);
                    elseif k == 4,
                        img(ii, jj) = img(ii, jj) + e*(1/16);
                    end
                end
            end
        end
    end
    result = img;
end

