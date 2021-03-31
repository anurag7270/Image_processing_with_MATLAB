clc;
clear all;
a1=imread('E:\Study\DIP\Lab_exp\cameraman.jpg');
a = rgb2gray(a1);
subplot(3,3,1);
imshow(a);
title('original image');

%simple thresholding takes a default level of 0.3

level=0.3
subplot(3,3,2);
segimage1=im2bw(a,level);
imshow(segimage1);
title('simple thresholding at 0.3');
subplot(3,3,3);
imshow(a>153);
title('simple thresholding at 0.6');

temp=a;
[m n]=find(a<26);
for j=1:length(m)
    temp(m(j),n(j))=0;
end

[m n]=find(a>26 & a<=230);
for j=1:length(m)
    temp(m(j),n(j))=0.8;
end

[m n]=find(a>230);
for j=1:length(m)
    temp(m(j),n(j))=0.7;
end
subplot(3,3,4);
segimage2 = im2bw(temp,0);
imshow(segimage2);
title('Multiple thresholding (Between 26-230)');

level=graythresh(a);
subplot(3,3,5);
segimage3=im2bw(a,level);
imshow(segimage3);
title('thresholding using inbuilt function');