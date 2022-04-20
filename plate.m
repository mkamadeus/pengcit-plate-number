img = imread("images/plates/sample01.jpg");
imggray = rgb2gray(img);
% imgbin = imbinarize(imggray);

img = edge(imggray, "prewitt");
% imshow(result)

Iprops = regionprops(img,'BoundingBox','Area', 'Image');
disp(Iprops.Area)