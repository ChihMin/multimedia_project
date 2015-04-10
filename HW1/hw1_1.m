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

origImg = im2double(origImg);
distImg = im2double(distImg);

% Calculate PSNR value

figure;
absolute_diff_img = absolute_difference(origImg, distImg);
imwrite(absolute_diff_img, 'absolute_difference.png', 'png');
imshow(absolute_diff_img);

MSE = double(0);
for i = 1:h,
    for j = 1:w,
        for k = 1:3,
            dis = origImg(i, j, k) - distImg(i, j, k);
            MSE = MSE + dis * dis;
        end
    end
end


MAX = double(1);
MSE = MSE / double(h) / double(w) / double(3);
PSNR = 10 * (log(MAX*MAX/MSE)) / (log(10.0));

PSNR