function [ vec_i, vec_j, SAD ] = findMaxSAD(img1, img2, ii, jj, range, N)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    SAD = 1e9;
    [h, w] = size(img1);
    vec_i = 0;
    vec_j = 0;
    for i = (ii-range):(ii+range),
        for j = (jj-range):(jj+range),
            if( i < 1 || j < 1), continue;  end
            if( ii < 1 || jj < 1), continue; end
            
            if( i + N > h || j + N > w), 
                continue;  
            end
            if( ii + N > h || jj + N > w),
                continue;
            end
            
            cur_SAD = calculateSAD(...
                        img2(ii:(ii+N-1), jj:(jj+N-1)),...
                        img1( i:(i+N-1),  j:( j+N-1)),...
                        N...
                    );
                
            if( cur_SAD < SAD),
                SAD = cur_SAD;
                vec_i = i;
                vec_j = j;
            end
        end
    end
end

