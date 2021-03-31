% Wiener Filter for Image restoration

clc;
clear all;
img = imread("C:\Users\DELL\Desktop\Study\DIP\Lab_exp\cameraman.jpg");
figure(1);
imshow(img)
title("Orginal Image");
PSF = fspecial("motion",20,10);
imgd = im2double(img);
blurred = imfilter(imgd,PSF,"conv",'circular');
figure(2);
imshow(blurred);
title("Blurred image");

%This blurred image is restored using weiner filter

wnr1  = deconvwnr(blurred,PSF);
figure(3);
imshow(wnr1)
title("Restored Image");

% add a zero mean gaussain noise to blurred image

noise_mean = 0;
noise_variance = 0.0001;
blurred_noisy_image  = imnoise(blurred,"gaussian");
figure(4);
imshow(blurred_noisy_image);
title("Blurred Noisy Image");

wnr2 = deconvwnr(blurred_noisy_image,PSF);
figure(5);
imshow(wnr2)
title("Restoration of blurred image with NSR=0");

%with realistic estimate of noise
signal_variance = var(imgd(:));
NSR = noise_variance/signal_variance;
wnr3 = deconvwnr(blurred_noisy_image,PSF,NSR);
figure(6);
imshow(wnr3);
title("Restoration of blurred noisy image in presence of NSR");