clear all

img = imread('data/Catvengers_gray.png');
img_double = im2double(img);

fprintf('------Now processing NNI-------\n');
img_NNI = NNI(img);
imwrite(img_NNI, 'output_NNI.png', 'png');
fprintf('-----------Complete  NNI-------\n');

fprintf('------Now processing  BI-------\n');
img_BI = BI(img_double);
imwrite(img_BI, 'output_BI.png', 'png');
fprintf('------------Complete  BI-------\n');

subplot( 1, 3, 1);
imshow(img);

subplot(1, 3, 2);
imshow(img_NNI);

subplot(1, 3, 3);
imshow(img_BI);
