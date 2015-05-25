img1 = imread('caltrain007.bmp');

for ii = 1:2,
    for jj = 1:2,
        N = 8 * ii;
        D = 8 * jj;
        fileName = 'caltrain008';
        img2 = imread(strcat(fileName, '.bmp'));
        img1 = rgb2gray(img1);
        img2 = rgb2gray(img2);


        [motion_vec] = fullSearch(img1, img2, D, N);
        [h, w, ~] = size(motion_vec);

        
        [h, w, ~] = size(img1)
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
        string_008 = fileName;
        string_017 = 'caltrain017';
        string_N = int2str(N);
        string_D = int2str(D);

        output_string = strcat('output/', string_008,'_',string_N,'_',string_D,'.bmp');
        imwrite(img4, output_string);
    end
end