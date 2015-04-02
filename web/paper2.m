clc
clear all
close all
 im=imread('C:\Users\AK PUJITHA\Desktop\10752009_1714588685433257_1953465240_n.jpg');
 im_ref=imread('C:\Users\AK PUJITHA\Desktop\sadhana.jpg');
im_ref=im2bw(im_ref);
 % im=imread('C:\Users\Sony\Downloads\imp\Poem-2.JPG');
%im=imread('C:\Users\Sony\Desktop\1.jpeg');

%conversion to binary
im=im2bw(im);
im=cropping(im);
im3=im;


[m n]=size(im);


im_ver=zeros(size(im));
count=0;
for i=1:m
    count=0;
    for j=1:n
        
        if im(i,j)==0
            count=count+1;
        end
    end
    
    if count==0
        im_ver(i,:)=0;
    else 
        im_ver(i,:)=1;
    end
end

%  imshow(im2);
%  figure()
% imshow(im);
im_ver = 1-im_ver;

for i=1:m
    for j= 1:n
        if im(i,j)==0
            im_ver(i,j)=1;
        end
    end
end

%  imshow(im_ver);

[m n]=size(im_ver);

su=sum(im_ver,2);
max2=max(su(:));
j=1;
k=1;
g = 0;

for i=1:m
    if su(i)~=max2
       ma{k}(j,:)=im_ver(i,:);
       g = 1;
       j = j+1;
    end

    if (su(i)==max2 && g == 1)
        g = 0;
        j=1;
        k=k+1;
    end
    
    
    
end
k=k-1;
k1=1;
 for cnt = 1:k
    temp=ma{cnt};

[m n]=size(temp);
im_ver=zeros(size(temp));


% h_vi=sum(temp);
% imshow(temp);
% figure()
count=0;
for i=1:n
    count(i)=0;
    for j=1:m
        
        if temp(j,i)==1
            count(i)=count(i)+1;
        end
    end
    if (i>4)
        if (count(i)==0 && count(i-1)==0 && count(i-2)==0 && count(i-3)==0)
            im_ver(:,i)=1;
        else 
            im_ver(:,i)=temp(:,i);
        end
    else
        if (count(i)==0 )
            im_ver(:,i)=1;
        else 
            im_ver(:,i)=temp(:,i);
        end
    end
end

%  imshow(im_ver);
% end

% imshow(im_ver);
test=im_ver;


 [m1 n1]=size(im_ver);

su1=sum(test,1);
j1=1;
max1=max(su1(:));
g1 = 0;
if max1>10
for i1=1:n1
    if su1(i1)~=max1
       ma1{k1}(:,j1)=test(:,i1);
       g1 = 1;
       j1 = j1+1;
    end

    if (su1(i1)==max1 && g1 == 1)
        g1 = 0;
        j1=1;
        k1=k1+1;
    end
    
    
    
end
end
 end
%  figure()
%  imshow(ma1{2});

ref=findBlocksHOG(im_ref,0,4,20,'vector','showWindow');
[m ,n] = size(im_ref);
[row ,col]= size(ref);

for q= 1:numel(ma1)
    I = ma1{q};
    I = im2bw(I);
    I = imresize(I,[m n]);
    output(q,:) = findBlocksHOG(I,0,4,20,'vector','showWindow');
    image_sub = ref-output(q,:);
    image_norm(q) = norm(image_sub);
   
end

min(image_norm(:));
for q= 1:numel(ma1)
    
    if (image_norm(q) <min(image_norm(:))+0.1 )
         figure()
         imshow(ma1{q});
         title('matched words');
    end
end

