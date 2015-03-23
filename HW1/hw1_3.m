clear all

img = imread('data/Catvengers_gray.png');

img_NNI = NNI(img);
imwrite(img_NNI, 'output_NNI.png', 'png');

subplot( 1, 3, 1);
imshow(img);

subplot(1, 3, 2);
imshow(img_NNI);
