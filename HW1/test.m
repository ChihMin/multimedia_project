clear all;
oriImg = imread('data/BFCatvengers.png');
oriImg2 = imread('data/Catvengers.png');
temp = zeros(size(oriImg,1),size(oriImg,2),3); %會不會是邊界存取問題??
temp = im2uint8(temp);
 
for i=1:size(oriImg,1),
    for j=1:size(oriImg,2),
        for k=1:3,
            
            if oriImg(i,j,k)==0 ,
                
               temp(i,j,k)= NNA(i,j,k,oriImg);
               temp(i,j,k);
            end
               
        end
        
    end
end
   
temp2 = temp + oriImg;
temp = abs(oriImg2 -temp2);
 
MSE = sum(sum(abs(temp2-oriImg2))) / (size(oriImg,1)*size(oriImg,2));
PSNR = 10 * log10((255*255)/MSE);
imwrite(temp2,'temp2.jpg');