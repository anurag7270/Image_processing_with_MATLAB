% Homomorphic Filtering
clc;
clear all;
img = imread("C:\Users\DELL\Desktop\Important\DIP\Lab_exp\xray.jpg");
img1 = rgb2gray(img);
img = double(img1);
[r,c] = size(img);
img = img+1;
lim = log(img);
fim = fft2(lim);
lowg = 0.9;
highg = 1.1;

him = homomorph(fim,lowg,highg);
ifim=ifft2(him);
eim = exp(ifim);

%plots

figure;
subplot(2,3,1);
imshow(img1);
title("Original Image");
subplot(2,3,2);
imshow(lim);
title("Logarithmic Transformed Image");
subplot(2,3,3);
imshow(uint8(fim));
title('2-D DFT of Image');
subplot(2,3,4);
imshow(him);
title("Homomorphic Filtered Image");
subplot(2,3,5);
imshow(ifim);
title("Inverse fft of the Image");
subplot(2,3,6);
imshow(uint8(eim));
title('Inverse logarithmic');