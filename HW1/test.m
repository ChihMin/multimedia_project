
img = imread('data/BFCatvengers.png');
img_double = im2double( img );
subplot( 1, 2, 1);
img_gray = rgb2gray( img_double );
imshow( img );

[h,w,~] = size( img );
gMask = fspecial('gaussian', [h,w], 0.5*min(h,w) );
gMask = gMask / max( max(gMask) ) ;
subplot(1,2,2);
img_mask = img_double .* repmat( gMask, [1 1 3] );
imshow(img_mask);
imwrite(img_mask,  'yotachi.jpg', 'jpg' );