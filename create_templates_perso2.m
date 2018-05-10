% CREATING TEMPLATES Machine Learning
%%
% Clear all
clc, close all, clear all
%Storage matrix character from image
character=[];
for j=1:1071
    if(j<=455 || j>1016)
        disp(j);
        for i=1:62
            image = imread(strcat('C:\Users\Syed\Desktop\Final DSAA Project\dataset\Sample',num2str(i),'\',num2str(i-1),' (',num2str(j),').png'));
            % Convert to gray scale
            if size(image,3)==3 %RGB image
                image=rgb2gray(image);
            end
            % Convert to BW
            threshold = graythresh(image);
            image =~im2bw(image,threshold);
            [f c]=find(image);
            clipped_image = image(min(f):max(f),min(c):max(c));
            %Crops image
            %imshow(fl);pause(0.5)    
            % Resize letter (size of template)
            img_r=imresize(clipped_image,[42 24]);
            %-------------------------------------------------------------------
            % character concatenation
            %figure();
            %imshow(img_r);
            character=[character img_r];
        end
    end
end
%figure();
%imshow(character);
x=[];
for k=1:(62*510)
    x=[x 24];
end

templates=mat2cell(character,42,x);
save('templates','templates');