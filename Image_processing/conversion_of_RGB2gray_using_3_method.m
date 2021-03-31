%RGB to Gray conversion using Lightness method, Average Method and
%Luminosity Method

%Lightness method
close all;
clear all;
clc;
a=imread("E:\Study\DIP\Lab_exp\images.jpg");
z=a;
ar=z(:,:,1);
ag=z(:,:,2);
ab=z(:,:,3);
[m,n]=size(ar);
for i=1:m
    for j=1:n
        temp1=max(ar(i,j),ag(i,j));
        ma=max(temp1,ab(i,j));
        temp2=min(ar(i,j),ag(i,j));
        mi=min(temp2,ab(i,j));
        gr1(i,j)=(ma+mi)/2
    end
end

%averaging method (avg of 3 plane)
for i=1:m
    for j=1:n
        gr2(i,j)=(ar(i,j)+ag(i,j)+ab(i,j))/3
    end
end

%Luminosity method
for i=1:m
    for j=1:n
        gr3=(0.2989*ar(i,j)+0.5870*ag(i,j)+0.1140*ab(i,j))
    end
end

%using the inbuilt function in matlab
gr4(i,j)=rgb2gray(a);
subplot(2,3,1);
imshow(a);
title("original color image");
subplot(2,3,2);
imshow(gr1);
title("conversion using ligtness method");
subplot(2,3,3);
imshow(gr2);
title("conversion using average method");
subplot(2,3,4);
imshow(gr3);
title("conversion using luminosity method");
subplot(2,3,5);
imshow(gr4);
title("conversion using inbuilt function");
