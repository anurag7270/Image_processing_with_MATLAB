clc;
clear all;
img1 = imread('C:\Users\DELL\Desktop\Important\DIP\Lab_exp\cameraman.jpg');
img1=rgb2gray(img1);
figure;
imshow(img1);
title("Orginal Image");

Hx = [-1 -1 -1; 0 0 0; 1 1 1]; Hy = Hx';
Jx = [1 0; 0 -1]; Jy = Jx';
Gx = [-1 -2 -1; 0 0 0; +1 +2 +1]; Gy = Gx';
%Prewitt
tic
temp_x = imfilter(img1, Hx);
temp_y = imfilter(img1, Hy);
Output = abs(temp_x) + abs(temp_y);
toc
Output= uint8(Output);
figure;
imshow(Output);
title('Hard code Prewitt');

%Robert
tic
temp_x = imfilter(img1, Jx);
temp_y = imfilter(img1, Jy);
Output = abs(temp_x) + abs(temp_y);
toc
Output= uint8(Output);
figure;
imshow(Output);
title('Hard code Robert');

%Sobel
tic
temp_x = imfilter(img1, Gx);
temp_y = imfilter(img1, Gy);
Output = abs(temp_x) + abs(temp_y);
toc
Output= uint8(Output);
figure;
imshow(Output);
title('Hard code Sobel');