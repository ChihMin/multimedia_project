img = imread('data/BFCatvengers.png');

[h, w, ~] = size( img );
img = im2double( img );
img = Demosaicing( img );
fprintf('%d %d\n', h, w);
imshow(img);
imwrite(img, 'demosaicing_output.png', 'png');
