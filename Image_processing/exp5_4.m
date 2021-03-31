% Min and Max filter
%standard mask of 3*3
b=imread('C:\Users\DELL\Desktop\Important\DIP\Lab_exp\cameraman.jpg');
a=rgb2gray(b);
figure;
imshow(a);

c1=ordfilt2(double(a),1,ones(3,3));
figure;
imshow(uint8(c1));
title('Min filter');
    c2=ordfilt2(double(a),9,ones(3,3));
    figure;
    imshow(uint8(c2));
    title('Max filter');