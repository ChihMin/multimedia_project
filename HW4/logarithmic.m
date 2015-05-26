function [ macroblocks ] = logarithmic( img1, img2, range, N )
    
    [h, w] = size(img1);
    macroblocks = zeros(floor(h/N), floor(w/N));
    for i = 1:N:h,
        for j = 1:N:w,
            % [i, j]
            if( (i + N - 1) > h || (j + N - 1) > w) 
                continue; 
            end
            
            % initializa
            
            SAD = calculateSAD(img1(i:i+N-1, j:j+N-1), img2(i:i+N-1, j:j+N-1), N);
            nn = floor(log(range) / log(2));
            n = max(2, 2 ^ (nn-1));
            q = 0; l = 0;
            [h, w] = size(img1);

            d = [1 0; 0 1; -1 0; 0 -1];
            is_visit = zeros(h, w);
            is_visit(i, j) = 1;
            while n > 0,
                dis = d * n;
                ii = 0; jj = 0;
                x = i + q;
                y = j + l;
                
                % step 3
                for k = 1:4,              
                    xx = x + dis(k, 1);
                    yy = y + dis(k, 2);
                    if(xx < 1 || xx + N - 1 > h), continue; end
                    if(yy < 1 || yy + N - 1 > w), continue; end
                    if(is_visit(xx, yy) == 1), continue; end
                    
                    is_visit(xx, yy) = 1;   % visit the point
                    cur_SAD = calculateSAD(...
                                img1(i:i+N-1, j:j+N-1), ...
                                img2(xx:xx+N-1, yy:yy+N-1),...
                                N...
                    );
                
                    if(cur_SAD < SAD),
                        SAD = cur_SAD;
                        ii = dis(k, 1);
                        jj = dis(k, 2);
                    end
                end
                % step 5
                if( ii == 0 && jj == 0 ),   
                    n = floor(n / 2);
                
                % step 4
                else
                    q = q + ii;
                    l = l + jj;
                end
                
                % step 6
                if( n == 1 ),
                    dis = [1 0; 0 1; -1 0; 0 -1; 1 1; 1 -1; -1 1; -1 -1];
                    x = i + q;
                    y = j + l;
                    ii = 0; jj = 0;
                    
                    for k = 1:8,
                        xx = x + dis(k, 1);
                        yy = y + dis(k, 2);
                        if(xx < 1 || xx + N - 1 > h), continue; end
                        if(yy < 1 || yy + N - 1 > w), continue; end
                        if(is_visit(xx, yy) == 1), continue; end

                        is_visit(xx, yy) = 1;   % visit the point
                        cur_SAD = calculateSAD(...
                                    img1(i:i+N-1, j:j+N-1), ...
                                    img2(xx:xx+N-1, yy:yy+N-1),...
                                    N...
                        );

                        if(cur_SAD < SAD),
                            SAD = cur_SAD;
                            ii = dis(k, 1);
                            jj = dis(k, 2);
                        end
                    end
                    q = q + ii; l = l + jj;
                    n = floor(n/2);
                end
            end
            macro_i = floor((i - 1) / N) + 1;
            macro_j = floor((j - 1) / N) + 1;
            macroblocks(macro_i, macro_j, 1) = q;
            macroblocks(macro_i, macro_j, 2) = l;
        end
    end
end

