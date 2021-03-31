a2=imread('C:\Users\DELL\Desktop\Important\DIP\Lab_exp\cameraman.jpg');
a=rgb2gray(a1)
figure;
imshow(a);
a1=imnoise(a,'salt & pepper',0.08);
figure
imshow(a1);

d1=medfilt2(double(a1),[3 3]);
figure
imshow(uint8(d1));
title('median filter with 3*3');

d2=medfilt2(double(a1),[5,5]);
figure
imshow(uint8(d2));
title('median filter with 5*5');

d3=medfilt2(double(a1),[7,7]);
figure
imshow(uint8(d3));
title('median filter with 7*7');

d4=medfilt2(double(a1),[9,9]);
figure
imshow(uint8(d4));
title('median filter with 9*9');