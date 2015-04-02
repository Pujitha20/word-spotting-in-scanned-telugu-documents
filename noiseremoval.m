clc;
close all;
clear all;

im = imread('C:\Users\AK PUJITHA\Desktop\10799269_1717478691810923_12971359_n.jpg');
im = im2bw(im,0.5);
imshow(im);
figure()
im_out = bwareaopen(im,50);
imshow(im_out);