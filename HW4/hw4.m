%%

img1 = imread('caltrain007.bmp');
img2 = imread('caltrain017.bmp');
img1 = rgb2gray(img1);
img2 = rgb2gray(img2);


[motion_vec] = fullSearch(img1, img2, 8, 8);
[h, w, ~] = size(motion_vec);
for i = 1:h,
    for j = 1:w,
        for k = 1:2,
            if motion_vec(i, j, k) ~= 0,
                [i, j, k, motion_vec(i, j, k)]
            end
        end
    end
end

%%
N = 8;

img3 = zeros(h, w);
[h, w, ~] = size(motion_vec);
for i = 1:1:h,
    for j = 1:1:w,
        
        ii = (i-1)*N+1 + int64(motion_vec(i, j, 1));
        jj = (j-1)*N+1 + int64(motion_vec(i, j, 2));
        img3(ii:ii+N-1, jj:jj+N-1) = img1((i-1)*N+1:(i-1)*N+N, (j-1)*N+1:(j-1)*N+N);
    end
end
imshow(img1);


