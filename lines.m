function [fl, re]=lines(image)
% Divide text in lines
% im_texto->input image; fl->first line; re->remain line
% Example:
% im_texto=imread('TEST_3.jpg');
% [fl re]=lines(im_texto);
% subplot(3,1,1);imshow(im_texto);title('INPUT IMAGE')
% subplot(3,1,2);imshow(fl);title('FIRST LINE')
% subplot(3,1,3);imshow(re);title('REMAIN LINES')


image=clip(image);
numOfRows=size(image,1);
for s=1:numOfRows
    if sum(image(s,:))==0
        fm=image(1:s-1, :); % First line matrix
        rm=image(s:end, :);% Remain line matrix
        
        
        fl=clip(fm);
        
        re=clip(rm);
        
        %         subplot(2,1,1);imshow(fl);
        %         subplot(2,1,2);imshow(re);
        break
    else
        fl=image;%Only one line.
        re=[ ];
    end
end

function img_out=clip(img_in)
[f c]=find(img_in);
img_out=img_in(min(f):max(f),min(c):max(c));%Crops image