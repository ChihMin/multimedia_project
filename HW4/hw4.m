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
