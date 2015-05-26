function fullSearchTime(range)

N = 0;
D = 0;
aa = 1;
bb = range;
        % disp(['now is ', int2str(aa), ' ',int2str(bb)]);
        N = 8 * aa;
        D = 8 * bb;
        fileName = 'caltrain008';
        img1 = imread('input/caltrain007.bmp');
        img2 = imread(strcat('input/', fileName, '.bmp'));
        
        img1 = rgb2gray(img1);
        img2 = rgb2gray(img2);

        [motion_vec] = fullSearch(double(img1), double(img2), D, N);

        img3 = img1;
        [h, w, ~] = size(motion_vec);
        for i = 1:1:h,
            for j = 1:1:w,    
                ii = (i-1)*N+1 + int64(motion_vec(i, j, 1));
                jj = (j-1)*N+1 + int64(motion_vec(i, j, 2));
                img3(ii:ii+N-1, jj:jj+N-1) = img1((i-1)*N+1:(i-1)*N+N, (j-1)*N+1:(j-1)*N+N);
            end
        end
        
        img3 = uint8(img3);
        img4 = abs(img2 - img3);

end