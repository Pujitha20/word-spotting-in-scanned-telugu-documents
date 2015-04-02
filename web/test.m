clc;
clear all;
close all;

I = imread('C:\Users\AK PUJITHA\Desktop\10751882_1717338605158265_511850618_n.jpg');

% I =double(rgb2hsv(I));
I = im2bw(I)
[m n]=size(I); 
% 
output = findBlocksHOG(I,0,4,20,'vector','showWindow');
I1 = imread('C:\Users\AK PUJITHA\Desktop\10805466_1717338608491598_1512294077_n.jpg');
% I1 =double(rgb2hsv(I1));
I1 = im2bw(I1);
I1= imresize(I1,[m n]);
 
output1=findBlocksHOG(I1,0,4,20,'vector','showWindow');


