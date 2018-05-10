[filename, pathname] = uigetfile('*','Select an Image');
i=imread(fullfile(pathname, filename));
i=rgb2gray(i);
bw4 = edge(i,'sobel');
figure; imshow(bw4);