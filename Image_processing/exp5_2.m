%% Non linear filter:Median Filter

A=imread('C:\Users\DELL\Desktop\Important\DIP\Lab_exp\cameraman.jpg');
A1=rgb2gray(A);

%lets chech by default, what is takes (noise)
B=imnoise(A1,'salt & pepper');
%B=imnoise(A1,'salt&pepper',0.02);

%medfill is for 1D & medfilt2 for 2D
C=medfilt2(B,[3,3]);

D=imnoise(A1,'salt & pepper');

C1=medfilt2(D,[7,7]);

subplot(3,2,1)
imshow(A);
title('Original image');

subplot(3,2,2)
imshow(A1);
title('Grayscale image');

subplot(3,2,3)
imshow(B);
title('Salt and pepper noise with filter 3*3');

subplot(3,2,4)
imshow(C);
title('median filter of B');

subplot(3,2,5)
imshow(D);
title('Salt and pepper noise with filter 7*7');

subplot(3,2,6)
imshow(C1);
title('median filter of D');

