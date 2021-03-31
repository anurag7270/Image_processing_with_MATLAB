%Average or LPF

b = imread('C:\Users\DELL\Desktop\Important\DIP\Lab_exp\cameraman.jpg');
a=rgb2gray(b)
figure
imshow(a);
title('Original Image');
h1=1/9*ones(3,3);
h2=1/25*ones(5,5);
h3=1/49*ones(7,7);
h4=1/81*ones(9,9);
h5=1/121*ones(11,11);


% for 2D image
%unsigned -->double
b1=conv2(double(a),double(h1),'same');
figure
imshow(uint8(b1));
% low pass filter
title('Average fiter(3*3)');

b2=conv2(double(a),double(h2),'same');
figure
imshow(uint8(b2));
title('Average fiter(5*5)');

b3=conv2(double(a),double(h3),'same');
figure
imshow(uint8(b3));
title('Average fiter(7*7)');

b4=conv2(double(a),double(h4),'same');
figure
imshow(uint8(b4));
title('Average fiter(9*9)');

b5=conv2(double(a),double(h5),'same');
figure
imshow(uint8(b5));
title('Average fiter(11*11)');

