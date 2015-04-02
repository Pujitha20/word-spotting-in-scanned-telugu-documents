clc;
clear all;
a=imread('C:\Users\Sony\Downloads\RagaLakshanaSangraham.djvu (1).jpg');
%figure,imshow(a)
b=rgb2gray(a);
%Igray1=medfilt2(b);
Ibw = im2bw(b,graythresh(b));
[m n] = size(Ibw);
Ibw2=~Ibw;


Iedge = edge(uint8(Ibw)); 
imshow(Iedge);

se = strel('square',2); 
Iedge2 = imdilate(Iedge, se); 
imshow(Iedge2);

%Image Filling
Ifill= imfill(Iedge2,'holes'); 
Ilabel = bwlabel(Ifill); 
%disp(num); 
Ibox = regionprops(Ilabel,'BoundingBox'); 
numel(Ibox)
Ibox(1)
%Ibox = [Iprops.BoundingBox];
%Ibox = reshape(Ibox,[4 15]); 

imshow(~Ibw2)
hold on; 
for cnt = 1:85 
    p=Ibox(cnt);
    rectangle('position',[p.BoundingBox(1) p.BoundingBox(2) p.BoundingBox(3) p.BoundingBox(4)],'edgecolor','r');
end
