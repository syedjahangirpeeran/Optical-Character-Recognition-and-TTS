[filename, pathname] = uigetfile('*','Select an Image');
imagen=imread(fullfile(pathname, filename));
% Show image
imshow(imagen);
title('INPUT');
% Convert to gray scale
if size(imagen,3)==3 %RGB image
    imagen=rgb2gray(imagen);
end
% Convert to BW
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
% Remove all object containing fewer than 100 pixels
imagen = bwareaopen(imagen,100);
%Storage matrix word from image
x=ocr(imagen);
disp(x.Text);