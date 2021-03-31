clear all;
close all;
clc;
a=imread("E:\Study\DIP\Lab_exp\cameraman.jpg");
figure(1);imshow(a);title('Original Image');
[x,y]=size(a);

%*****************For Image Negative*********************

n=255-a;
figure(2);imshow(n);title('Negative Image');
for i=0:255,
    map(i+1)=255-(i-1);
end
figure(3);plot(map);title('Plot of negative');

%****************For Logarithmic************************

d=double(a);
c=20;
l=c*log(1+d);
figure(4);imshow(uint8(l)); title('Logarithmic Transformation');
for i=0:255,
    map(i+1)=c*log(1+i);
end
figure(5);plot(map);title('Plot of Logarithmic transform');

%***********For Power Law Transformation****************

c=10;
r=1.1;
p=c*(power(d,r));
figure(6);imshow(uint8(p));title('Power Law Transform');
for i=0:255,
    map(i+1)=c*(power(double(i),r));
end   
figure(7);plot(map);title('Plot of Power Law Transform');

%**************For Contrast Stretching********************

r1=60;
s1=45;
r2=180;
s2=200;
m1=s1/r1;
m2=(s2-s1)/(r2-r1);
m3=(255-s2)/(255-r2);
piece=[(0:r1)*m1,(((0:(r2-r1))*m2)+s1),(((0:(255-r2))*m3)+s2)];
for i=1:x,
    for j=1:y,
        c(i,j)=piece(a(i,j)+1);
    end
end
figure(8);imshow(uint8(c));title('Contrast Stretching');
figure(9);plot(piece);title('Plot of Contrast Streching');

%*******************For Thresholding***********************

th=125;

for i=1:x,
    for j=1:y,
        if(a(i,j)<th)
            t(i,j)=0;
        else
            t(i,j)=255;
        end
    end
end
figure(10);imshow(uint8(t));title('Thrsholding');
map(1:th)=0;
map(th:256)=255;
figure(11);plot(map);title('Plot of Thresholding');
