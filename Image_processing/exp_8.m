clc;
clear all;
img = imread("C:\Users\DELL\Desktop\Important\DIP\Lab_exp\cameraman.jpg");
img = rgb2gray(img);
imshow(img);
title("Home sweet home");

%sobel operator
z=edge(img,'sobel');
figure;
subplot(1,2,1);
imshow(z);
y= edge(z,'sobel',0.2);
subplot(1,2,2);
imshow(y);
title('Sobel filtered image');

%Prewitt Operator
z1=edge(img,'prewitt');
figure;
subplot(1,2,1);
imshow(z1);
y1= edge(z1,'prewitt',0.2);
subplot(1,2,2);
imshow(y1);
title('Prewitt filtered image');

%Roberts operator
z2=edge(img,'roberts');
figure;
subplot(1,2,1);
imshow(z2);
y2= edge(z2,'roberts',0.2);
subplot(1,2,2);
imshow(y2);
title('Roberts filtered image');

%Canny Operator

z3=edge(img,'canny');
figure;
subplot(1,2,1);
imshow(z3);
y3= edge(z3,'canny',0.2);
subplot(1,2,2);
imshow(y3);
title('Canny filtered image');