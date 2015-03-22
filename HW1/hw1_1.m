img = imread('data/BFCatvengers.png');

subplot(1, 2, 1);
imshow(img);

[h, w, ~] = size( img );
img = im2double( img );
img = Demosaicing( img );
subplot( 1, 2, 2);
imshow(img);
imwrite(img, 'demosaicing_output.png', 'png');

origImg = imread('data/Catvengers.png');
distImg = imread('demosaicing_output.png');
[PSNR, SNR] = psnr(distImg, origImg, 255);
PSNR
SNR