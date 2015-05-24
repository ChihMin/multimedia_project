function [ macroblocks ] = fullSearch( img1, img2, range, N)
    [h, w] = size(img1);
    SAD = 1e9;
    a = 1;
    b = 1;
    for i = 1:N:h,
        for j = 1:N:w,
            % Find the begining point
            SAD = 1e9;
            vec_i = 0;
            vec_j = 0;
            for a = max(1,(i-range)):min(N,(i+range)),
                for b = max(1,(j-range)):min(N,(j+range)),
                    if( a + N > h) continue; end
                    if( b + N > w) continue; end
                    cur_SAD = calculateSAD(...
                        img1( a:(a+N-1), b:(b+N-1)),...
                        img2( i:(i+N-1), j:(j+N-1)),...
                        N...
                    );

                     if( cur_SAD < SAD),
                        SAD = cur_SAD;
                        vec_i = a - i;
                        vec_j = b - j;
                    end
                    macroblocks(a, b, 1) = vec_i;
                    macroblocks(a, b, 2) = vec_j;
                    a = a + 1;
                    b = b + 1;
                end
            end
            [i , j]
        end
    end
   
end

