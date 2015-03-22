img_given = imread('data/lena_gray.bmp');
img_choose = imread('choose.png');

img_choose = rgb2gray( img_choose );

img_given_thred = Thredsholding( img_given );
img_choose_thred = Thredsholding( img_choose );


imwrite(img_given_thred, 'thresholding1.bmp','bmp');
imwrite(img_choose_thred, 'thresholding2.png','png');



img_given_error_dithering = ErrorDithering(img_given);
img_choose_error_dithering = ErrorDithering(img_choose);


imwrite(img_given_error_dithering, 'error_dithering1.bmp', 'bmp');
imwrite(img_choose_error_dithering, 'error_dithering2.png', 'png');


subplot(1, 2 ,1);
imshow(img_given_thred);
subplot(1, 2, 2);
imshow(img_given_error_dithering);

figure;

subplot(1, 2 ,1);
imshow(img_choose_thred);
subplot(1, 2, 2);
imshow(img_choose_error_dithering);

