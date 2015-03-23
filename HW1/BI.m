function [ result ] = BI( img )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [h ,w] = size(img);
    scale = 4;
    result = repmat(img, scale, scale);
    
    h_large = h * scale;
    w_large = w * scale;
    
    for i = 1:h_large,
        for j = 1:w_large,
            double_x = double(i) / scale;
            double_y = double(j) / scale;
            x = double(floor(double_x));
            y = double(floor(double_y));
            
            a = uint64(x);
            b = uint64(y);
            
            alpha = double_x - x;
            beta = double_y - y;
            
            if a + 1 > h || y + 1 > w,  continue; end
            if a == 0, a = 1; end
            if b == 0, b = 1; end
            
            result(i, j) = (1 - alpha) * (1 - beta) * img(a, b) + (1 - alpha) * beta * img(a, b+1) + (alpha) * (1 - beta) * img(a+1, b) + alpha * beta * img(a+1, b+1);
        end
    end
end

