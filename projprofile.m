clc
clear all
close all
im=imread('C:\Users\AK PUJITHA\Desktop\10752009_1714588685433257_1953465240_n.jpg');
%im=imread('C:\Users\Sony\Desktop\1.jpeg');
im_gray = rgb2gray(im);
%conversion to binary
im=im2bw(im);

for i = 1: size(im,1)
    for j = 1: size(im,2)
        projection(i) = sum(im(i,:));
    end
end

i=1:1:size(im,1);
plot(i,projection);
% 
% k=2;
% sigma = 0.5;
% G = fspecial('gaussian',[5 5],2);

sigma = 2;
i=1:1:size(im,1)+1;
G = (1/(sqrt(2*pi)*sigma))*(exp((-1*i.^2)./(2*sigma.^2)));
dif_G = diff(G);
shape = size(projection);
proj = conv(projection, dif_G,'shape');
figure()

i=1:1:size(im,1);
plot(i,proj)

