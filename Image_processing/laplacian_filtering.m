clc;
close all;
clear all;
a= imread("C:\Users\DELL\Desktop\Study\DIP\Lab_exp\cameraman.jpg");
a = rgb2gray(a)
[m n]= size(a);
total = m*n;
figure;
imshow(a);
title('Original Image');

%mean
sum = 0;
a = double(a);
for j=1:m
    for k=1:n
        sum=sum+a(j,k);
    end
end
mean = sum/total;
disp('Mean is:');
disp(mean);

%std deviation and varinace

dev = 0;
for j=1:m
    for k=1:n
        dev = dev+(a(j,k)-mean)^2;
    end
end
dev = sqrt(dev/total);
disp('Deviation is:');
disp(dev);
var = dev^2;
disp('Variance is:');
disp(var);

%HPD
c=zeros(1,m);
k=m/2;
for i=1:n
    c(i)=a(k,i);
end
figure;
subplot(2,1,1)
stem(c);
title('HPD');

%VPD
c=zeros(1,m);
k=m/2;
for i=1:n
    c(i)=a(i,k);
end
subplot(2,1,2)
stem(c);
title('VPD');

%Entropy

e = 0;
p=imhist(uint8(a));
[m1 n1]=size(p);
p=p/(m*n);
for i=1:m1
    if (p(i)~= 0)
        e = e-p(i).*log2(p(i));
    end
end
disp('Entropy is: ');
disp(e);

%MSE and PSNR
image = max(a(:));
image1 = min(a(:));
mse = std(a(:));
snr = 20*log10((image-image1)./mse);
disp('Signal to noise is:');
disp(snr);

PSNR = 20*log10(image)-10*log10(mse);
disp('Peak Signal to Noise Ratio is:');
disp(psnr);