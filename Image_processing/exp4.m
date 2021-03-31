a = imread('C:\Users\DELL\Desktop\Important\DIP\Lab_exp\cameraman.jpg');
figure
imshow(a);
title('Original Image');
[x,y]=size(a);
img7=a;
img6=a;
img5=a;
img4=a;
img3=a;
img2=a;
img1=a;
img0=a;
img7=double(bitand(a,128));
img6=double(bitand(a,64));
img5=double(bitand(a,32));
img4=double(bitand(a,16));
img3=double(bitand(a,8));
img2=double(bitand(a,4));
img1=double(bitand(a,2));
img0=double(bitand(a,1));
figure
subplot(2,2,1)
imshow(img7);
title('Img7_MSB');
subplot(2,2,2)
imshow(img6);
title('Img6');
subplot(2,2,3)
imshow(img5);
title('Img5');
subplot(2,2,4)
imshow(img4);
title('Img4');


figure
subplot(2,2,1)
imshow(img3);
title('Img3');

subplot(2,2,2)
imshow(img2);
title('Img2');

subplot(2,2,3)
imshow(img1);
title('Img1');

subplot(2,2,4)
imshow(img0);
title('Img0');


