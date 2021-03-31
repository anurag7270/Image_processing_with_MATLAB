
clc;
clear all;
img = imread("C:\Users\DELL\Desktop\Study\DIP\Lab_exp\cameraman.jpg");
img= rgb2gray(img)
img = double(img);
[r,c] = size(img);
if (r==c)
    N=c;
else
    error("Error");
end

% Using Inbuilt Function

figure(1);
imshow(uint8(img));
title("Input Image");

img1 = dct2(img);
figure(2);
imshow(uint8(img1));
title("Dicrete Cosine Transform");

figure(3);
img2 = idct2(img1);
figure(3);
imshow(uint8(img2));
title('Reconstructed Image');

err = immse(img,img2);

%Without using inbuilt function

for u=0:N-1
    for v=0:N-1
       
        if(u==0)
            c(u+1,v+1) = sqrt(1/N);
        else
            c(u+1,v+1) = sqrt(2/N)*cos(((2*v+1)*pi*u)/(2*N));
        end
    end
end
DCT2  = c*img*(c');
DCT2_inverse= (c')*DCT2*c;
figure("Name","DCT without inbuilt function");
subplot(1,2,1);
imshow(uint8(DCT2));
title('DCT of the image');
subplot(1,2,2);
imshow(uint8(DCT2_inverse));
title("Reconstructed Image")
 
err1 = immse(img,DCT2_inverse);