function [ result ] = Demosaicing( img )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    [h, w, ~] = size(img)

    drb = [1 1; -1 1; 1 -1; -1 -1];
    dg = [1 0; 0 1; -1 0; 0 -1];
    
    R = img(1:h, 1:w, 1);
    G = img(1:h, 1:w, 2);
    B = img(1:h, 1:w, 3);
    
    for i = 2:(h-1),
        for j = 2:(w-1),
            r = R(i ,j);
            g = G(i, j);
            b = B(i, j);
            
            if g > 0,
                if R(i-1, j) > 0,
                    img(i, j, 1) = (R(i-1, j) + R(i+1, j))/2;
                    img(i, j, 3) = (B(i, j+1) + B(i, j-1))/2;
                else
                    img(i, j, 3) = (B(i-1, j) + B(i+1, j))/2;
                    img(i, j, 1) = (R(i, j+1) + R(i, j-1))/2;
                end
            elseif r > 0,
                sum = 0;
                for k = 1:4,
                    ii = i + dg(k ,1);
                    jj = j + dg(k, 2);
                    sum = sum + G(ii, jj);
                end
                
                img(i, j, 2) = sum / 4;
               
                sum = 0;
                for k = 1:4,
                    ii = i + drb(k, 1);
                    jj = j + drb(k, 2);
                    sum = sum + B(ii, jj);
                end
                img(i, j, 3) = sum / 4; 
            else
                sum = 0;
                for k = 1:4,
                    ii = i + dg(k, 1);
                    jj = j + dg(k, 2);
                    sum = sum + G(ii, jj);
                end
                
                img(i, j, 2) = sum / 4;
                
                sum = 0;
                for k = 1:4,
                    ii = i + drb(k, 1);
                    jj = j + drb(k, 2);
                    sum = sum + R(ii, jj);
                end
                img(i, j, 1) = sum / 4;
                
            end
        end
    end
    result = img;        
end

