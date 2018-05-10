function [char, re, space]=chars(image)
% Divide text in caracters
% [char, re, esp]=chars(ligne);
% subplot(3,1,1);imshow(ligne);title('INPUT IMAGE')
% subplot(3,1,2);imshow(char);title('FIRST CHAR')
% subplot(3,1,3);imshow(re);title('REMAIN CHARS')
% space


%%
%This function does the same thing as the function 'lines', working horizontally instead of vertically 
numOfColumns=size(image,2);
for i=1:numOfColumns
    if sum(image(:,i))~=0
        if i-1>0
            space=i-1;
        else 
            space=[];
        end
        for s=i+1:numOfColumns % from the first column to the last 
            if sum(image(:,s))==0 % if a column is blank
                char=image(:,i:s-1); % First char matrix
                char=clip(char);
                re=image(:,s:end);% Remain chars matrix
                
                %*-*-*Uncomment lines below to see the result*-*-*-*-
                %         subplot(2,1,1);imshow(char);
                %         subplot(2,1,2);imshow(re);
                %         esp
                break
            else 
                char=image(:,i:end);%Only one char.
                char=clip(char);
                re=[ ];
                %We deca le column
            end
        end
        break
    else %error no character in 'line'
        char=[];
        re=[];
        space='Error';
        %We decale column
    end
end
%Fcn clip is the same in lines.m
function img_out=clip(img_in)
[f c]=find(img_in);
img_out=img_in(min(f):max(f),min(c):max(c));%Crops image