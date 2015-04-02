clc;
clear all;
close all;

% I = imread('C:\Users\AK PUJITHA\Desktop\iiit h\semester 5\SMAI\project\per00001.jpg');
% I =double(rgb2hsv(I));


%  output = findBlocksHOG(uint8(I(:,:,3)),0,8,20,'vector','showWindow');
%  figure()
%  imshow(output);
% title('output')
%  data.X = output';
%  data.y = 1; 
%  model=svmlight(data,struct('ker','rbf','C',10,'arg',1));
%  figure; ppatterns(data); psvm(model);
%  
%  data.X = ori_bin_blocks;
%  data.y = ones(1,1); 
%  model=svmlight(data,struct('ker','rbf','C',10,'arg',1));
% heart_scale_label=[1];
% b = output;
% model = svmtrain(heart_scale_label, b);
% [predict_label, accuracy, dec_values] = svmpredict(heart_scale_label,blocks, model);%  figure; ppatterns(data); psvm(model);

output = finalHOG ;

