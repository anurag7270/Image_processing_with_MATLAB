%%dog
clc;
clear all;
close all;
%a= imread('E:\Study\DIP\Lab_exp\cameraman.jpg');
a= imread('E:\Study\DIP\Lab_exp\xray.jpg');
a = rgb2gray(a);
subplot(2, 2, 1);
imshow(a);
title('original Image');
gaussian1 = fspecial('Gaussian', 21, 10);
gaussian2 = fspecial('Gaussian', 21, 15);;
dog = gaussian1 - gaussian2;
dogFilterImage = conv2(double(a), dog, 'same');
subplot(2, 2, 2);
imshow(dogFilterImage, []);
title('DOG Filtered Image');
%%log
A = fspecial('Gaussian', 25, 12);
B=imfilter(a,A,'same');
subplot(2, 2, 3);
imshow(B);
title('LOG Image');