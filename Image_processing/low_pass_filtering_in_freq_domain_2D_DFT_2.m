%step1: Read th i/p image f(x,y) of size MxN and obtain the padding by
        %setting parameterP and Q: P=2M , Q=2N
%step2: From a padded image fp(x,y) of size PxQ
%step3: Multiply fp(x,y) by (-1)^x+y
%step4: Compute DFT F(u,v) of image from step 3
%step5: Generate a real and symmetric filter function H(u,v)of size PxQ
        %with center at coordinates (P/2,Q/2)
%step6: From a product of H(u,v) F(u,v)= G(u,v)using array multiplication.
%step7: Obtain a prcocessed image gp(x,y)= {real{inverse DFT [G(u,v)]}(-1^x+y)}
%step8: obtain the finalprocessed result g(x,y) by extracting MxN region
        %from top left quadrant of gp(x,y)
a = imread("C:\Users\DELL\Downloads\Cameraman.png");
b= im2double(a);
[m,n]=size(b);
c = zeros(2*m,2*n);
[p,q] = size(c);
for i = 1:p
    for j = 1:q
        if i<=m && j<=n
            c(i,j) = b(i,j);
        end
    end
end
imshow(b);
title("Original Image");
figure;
imshow(c);
title("Padded Image");

d = zeros(p,q);
for i= 1:p
    for j = 1:q
        d(i,j) = c(i,j).*(-1).^(i+j);
    end
end
figure;
imshow(d);
title("Preprocessed Image for Calculating DFT");
e = fft2(d);
figure;
imshow(e);
title("2D DFT of the preprocessed Image");
[x,y] = freqspace(p,'meshgrid');
z = zeros(p,q);
for i = 1:p
    for j = 1:q
        z(i,j)=sqrt(x(i,j).^2+y(i,j).^2);
    end
end
H = zeros(p,q);
for i = 1:p
    for j = 1:q
        if z(i,j)<=0.4
            H(i,j)=1;
        else
            H(i,j)=0;
        end
    end
end
figure;
imshow(H);
title('Low pass filter function');
h1 = e.*H;
figure;
imshow(h1);
title("Low pass output");
h2 = ifft2(h1);
figure;
imshow(h2);
title("Output image after inverse 2D DFT")
h3 = zeros(p,q);
for i = 1:p
    for j = 1:q
        h3(i,j)=h2(i,j).*((-1).^(i+j));
    end
end
figure;
imshow(h3);
title("Post processed Image");
out = zeros(m,n);
for i = 1:m
    for j=1:n
        out(i,j)=h3(i,j);
    end
end
figure;
imshow([b out]);