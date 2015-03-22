img = imread('data/BFCatvengers.png');

subplot(1, 2, 1);
imshow(img);

[h, w, ~] = size( img );
img = im2double( img );
img = Demosaicing( img );
fprintf('%d %d\n', h, w);

subplot( 1, 2, 2);
imshow(img);
imwrite(img, 'demosaicing_output.png', 'png');

origImg = imread('data/Catvengers.png');
distImg = imread('demosaicing_output.png');
PSNR = CalculatePSNR(origImg, distImg);

fprintf('PSNR is %f %f %f\n', PSNR(1), PSNR(2), PSNR(3) );
