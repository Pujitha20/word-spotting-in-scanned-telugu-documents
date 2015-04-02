function imx=cropping(im_cro);
% im_cro=cropp(im,40 ,30);

[m n]=size(im_cro);
flag=0;
 for i=1:m
     for j=1:n
         if im_cro(i,j)==0
           min_y=i;
           flag=1;
           break;
        end
      end
 if flag==1
     break;

 end
 end
 flag=0;
 for j=1:n
     for i=1:m
         if im_cro(i,j)==0
           min_x=j;
           flag=1;
           break;
        end
      end
 if flag==1
     break;

 end
 end
 
 flag=0;
 for j=n:-1:1
     for i=m:-1:1
         if im_cro(i,j)==0
           max_x=j;
           flag=1;
           break;
        end
      end
 if flag==1
     break;

 end
 end 
imx=im_cro(min_y:m,min_x:max_x);
end