clc;
clear all;
a=imread('C:\Users\Sony\Downloads\RagaLakshanaSangraham.djvu (1).jpg');

%figure,imshow(a)
b=rgb2gray(a);
%Igray1=medfilt2(b);
Ibw = im2bw(b,graythresh(b));
Ibw=cropping(Ibw);
[m n] = size(Ibw);
Ibw2=~Ibw;


Iedge = edge(uint8(Ibw)); 
%imshow(Iedge);

se = strel('square',2); 
Iedge2 = imdilate(Iedge, se); 
%imshow(Iedge2);

%Image Filling
Ifill= imfill(Iedge2,'holes'); 
im=~Ifill;
[m n] = size(im);
im2= zeros(size(im));
for i=1:m
    count=0;
    for j=1:n
        
        if im(i,j)==0
            count=count+1;
        end
    end
    
    if count==0
        im2(i,:)=0;
    else 
        im2(i,:)=1;
    end
end



% imshow(im2);
% figure()
% imshow(im);
im2 = 1-im2;

for i=1:m
    for j= 1:n
        if im(i,j)==0
            im2(i,j)=1;
        end
    end
end


label = bwlabel(im2); 

 s = regionprops(label, 'BoundingBox');
 num=numel(s);
 
 imshow(~Ibw);
 hold on;
 for cnt = 1:num
    p=s(cnt);
    rectangle('position',[p.BoundingBox(1) p.BoundingBox(2) p.BoundingBox(3) p.BoundingBox(4)],'edgecolor','r');
 end

 
% break;
% Ilabel = bwlabel(Ifill); 
% %disp(num); 
% Ibox = regionprops(Ilabel,'BoundingBox'); 
% numel(Ibox)
% Ibox(1)
% %Ibox = [Iprops.BoundingBox];
% %Ibox = reshape(Ibox,[4 15]); 
% 
% imshow(Ibw2)
% hold on; 
% for cnt = 1:85 
%     p=Ibox(cnt);
%     rectangle('position',[p.BoundingBox(1) p.BoundingBox(2) p.BoundingBox(3) p.BoundingBox(4)],'edgecolor','r');
% end
