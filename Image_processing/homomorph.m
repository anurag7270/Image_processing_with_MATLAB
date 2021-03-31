function res=homomorph(fim,lowg,highg);
dif = (highg-lowg);
sig = 15;
[r,c] = size(fim);
for i = 1:r
    for j=1:c
        p=-(((i-(r/2))^2)+(j-(c/2))^2)/((2*sig^2));
        k = (1/2*3.14*(sig^2));
        term(i,j) = (1-k*exp(p));
    end
end
for i=1:r
    for j=1:c
        h(i,j)=(dif*term(i,j))+lowg;
    end
end
for i = 1:r
    for j=1:c
        res(i,j)=fim(i,j)*h(i,j);
    end
end


