function [ Ans ] = calPSNR( img1, img2 )

[h, w] = size(img1);
img_dis = double(img1) - double(img2);
img_dis = img_dis .* img_dis;
MSE = sum(sum(img_dis));

MAX = 255;
MSE = MSE / h / w ;
Ans = 10 * (log(MAX*MAX/MSE)) / (log(10.0));

end

