%% (a) : full search
N = 0;
D = 0;
for aa = 1:1:2,
    for bb = 1:1:2,
        disp(['now is ', int2str(aa), ' ',int2str(bb)]);
        N = 8 * aa;
        D = 8 * bb;
        fileName = 'caltrain017';
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
        string_008 = fileName;
        string_N = int2str(N);
        string_D = int2str(D);
        output_string = strcat('output/', string_008,'_',string_N,'_',string_D,'.bmp');
        imwrite(img4, output_string);
    end
end


%% (a) 2D logarithmic
clear
N = 0;
D = 0;
for aa = 1:1:2,
    for bb = 1:1:2,
        disp(['now is ', int2str(aa), ' ',int2str(bb)]);
        N = 8 * aa;
        D = 8 * bb;
        fileName = 'caltrain017';
        img1 = imread('input/caltrain007.bmp');
        img2 = imread(strcat('input/',fileName, '.bmp'));
        
        img1 = rgb2gray(img1);
        img2 = rgb2gray(img2);

        [motion_vec] = logarithmic(double(img1), double(img2), D, N);

        img3 = img1;
        [h, w, ~] = size(motion_vec);
        for i = 1:1:h,
            for j = 1:1:w,    
                ii = (i-1)*N+1 + int64(motion_vec(i, j, 1));
                jj = (j-1)*N+1 + int64(motion_vec(i, j, 2));
                % if( ii == 0 || jj == 0 ), continue; end
                img3(ii:ii+N-1, jj:jj+N-1) = img1(((i-1)*N+1):((i-1)*N+N), ((j-1)*N+1):((j-1)*N+N));
            end
        end
        
        img3 = uint8(img3);
        img4 = abs(img2 - img3);
        string_008 = fileName;
        string_N = int2str(N);
        string_D = int2str(D);
        output_string = strcat('output/', 'log_', string_008,'_',string_N,'_',string_D,'.bmp');
        imwrite(img4, output_string);
    end
end