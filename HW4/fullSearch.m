function [ macroblocks ] = fullSearch( img1, img2, range, N)
    [h, w] = size(img1);
    macro_i = 1;
    macro_j = 1;
    macroblocks = [];
    for i = 1:N:h,
        macro_j = 1;
        for j = 1:N:w,
            % Find the begining point
            SAD = uint64(1e9);
            vec_i = 0;
            vec_j = 0;
            %[i, j]
            for a = max(1,(i-range)):1:(i+range),
                for b = max(1,(j-range)):1:(j+range),
                    if( (a + N - 1) > h || (b + N - 1) > w) ,
                        continue; 
                    end
                    cur_SAD = calculateSAD(...
                        img1( a:(a+N-1), b:(b+N-1)),...
                        img2( i:(i+N-1), j:(j+N-1)),...
                        N...
                    );
                    
                    if( uint64(cur_SAD) < uint64(SAD)),
                        %[a, b, cur_SAD, SAD]
                        SAD = cur_SAD;
                        vec_i = a - i;
                        vec_j = b - j;
                        
                    end
                    
                end
                
            end
            %[j, SAD]
            macroblocks(macro_i, macro_j, 1) = vec_i;
            macroblocks(macro_i, macro_j, 2) = vec_j;
            macro_j = macro_j + 1;
        end
        macro_i = macro_i + 1;
    end
   [macro_i, macro_j]
end

