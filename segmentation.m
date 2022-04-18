I = truecolorload('images/mrorange.jpg');
gray = rgb2gray(I);

% e = laplacian_edge(gray);
% T = graythresh(e);
% e = imbinarize(e, T);
% imshow(e); title Laplacian;

subplot(2,2,1);
imshow(I);

STD = 1.5;
Size = 25;
e = log_edge(gray, Size, STD);
e = imbinarize(e, 'adaptive');
%T = graythresh(e);

disp(size(e));

%e = uint8(edge(gray, "Canny", [], 0.25) * 255);
subplot(2,2,2);
imshow(e, [0 1]); 
%hold on;
%plot(320,240, 'r+', 'MarkerSize', 30, 'LineWidth', 2);
title log;

% imshow(e); title LoG;

% mask = uint8(imbinarize(imclose(imfill(e, 'holes'), strel('square', 7))));
mask = imdilate(e, strel('line', 10, 90));
mask = imdilate(mask, strel('line', 10, 0));
mask = imdilate(mask, strel('disk', 10));

mask = imfill(mask, [320 240], 8);
subplot(2,2,3);
imshow(mask, [0 1]); title LoG;
result = I .* uint8(mask);

subplot(2,2,4);
imshow(result); title LoG;

% C = 2
% e = sobel_edge(gray, C);
% T = graythresh(e);
% e = imbinarize(e, T);
% imshow(e); title Sobel;

% e = prewitt_edge(gray);
% T = graythresh(e);
% e = imbinarize(e, T);
% imshow(e); title Prewitt;

% e = roberts_edge(gray);
% T = graythresh(e);
% e = imbinarize(e, T);
% imshow(e); title Roberts;

% e = uint8(edge(gray, "Canny") * 255);
% imshow(e); title Canny;