img1 = imread('caltrain007.bmp');
img2 = imread('caltrain008.bmp');
img1 = rgb2gray(img1);
img2 = rgb2gray(img2);


[motion_vec] = fullSearch(img1, img2, 8, 8)