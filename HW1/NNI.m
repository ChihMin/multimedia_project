function [ results ] = NNI( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [h, w] = size( img );
    scale = 4;
    C = repmat(img, scale, scale);
    
    h_large = h * scale;
    w_large = w * scale;
    
    for i = 1:h_large,
        for j = 1:w_large,
            x = uint64( double(i) / scale + 0.5 );
            y = uint64( double(j) / scale + 0.5 );
            
            if x > h, x = x - 1; end
            if y > w, y = y - 1; end
            
            C(i, j) = img(x, y);
        end
    end
    results = C;
end